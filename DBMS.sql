CREATE DATABASE EcommerceDB;
USE EcommerceDB;
DROP TABLE IF EXISTS Customer;

CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15) UNIQUE,
    Address VARCHAR(100)
);
CREATE TABLE Seller (
    Seller_ID INT PRIMARY KEY,
    Seller_Name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15) UNIQUE
);
CREATE TABLE Product (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Stock INT NOT NULL,
    Seller_ID INT,
    FOREIGN KEY (Seller_ID) REFERENCES Seller(Seller_ID)
);
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Order_Date DATE NOT NULL,
    Quantity INT NOT NULL,
    Status VARCHAR(30) DEFAULT 'Pending',

    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);
CREATE TABLE Payment (
    Payment_ID INT PRIMARY KEY,
    Order_ID INT UNIQUE NOT NULL,
    Payment_Date DATE NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    Payment_Mode VARCHAR(30) NOT NULL,
    Payment_Status VARCHAR(30) DEFAULT 'Pending',

    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
);

INSERT INTO Customer VALUES
(1, 'Arun', 'arun@gmail.com', '9876543210', 'Chennai'),
(2, 'Priya', 'priya@gmail.com', '9876543211', 'Madurai'),
(3, 'Kavin', 'kavin@gmail.com', '9876543212', 'Coimbatore'),
(4, 'Meena', 'meena@gmail.com', '9876543213', 'Trichy'),
(5, 'Rahul', 'rahul@gmail.com', '9876543214', 'Salem'),
(6, 'Divya', 'divya@gmail.com', '9876543215', 'Thoothukudi'),
(7, 'Vijay', 'vijay@gmail.com', '9876543216', 'Tirunelveli'),
(8, 'Anu', 'anu@gmail.com', '9876543217', 'Erode'),
(9, 'Siva', 'siva@gmail.com', '9876543218', 'Dindigul'),
(10, 'Nisha', 'nisha@gmail.com', '9876543219', 'Vellore');

INSERT INTO Seller VALUES
(101, 'Tech World', 'techworld@gmail.com', '9000000001'),
(102, 'Fashion Hub', 'fashionhub@gmail.com', '9000000002'),
(103, 'Home Store', 'homestore@gmail.com', '9000000003');

INSERT INTO Product VALUES
(201, 'Laptop', 55000.00, 10, 101),
(202, 'Smartphone', 25000.00, 20, 101),
(203, 'Headphones', 2000.00, 30, 101),
(204, 'T-Shirt', 799.00, 50, 102),
(205, 'Jeans', 1499.00, 40, 102),
(206, 'Shoes', 2499.00, 25, 102),
(207, 'Chair', 3500.00, 15, 103),
(208, 'Table', 5000.00, 10, 103),
(209, 'Lamp', 999.00, 35, 103),
(210, 'Watch', 2999.00, 20, 102);

INSERT INTO Orders VALUES
(301, 1, 201, '2026-09-01', 1, 'Delivered'),
(302, 2, 202, '2026-09-02', 1, 'Shipped'),
(303, 3, 203, '2026-09-03', 2, 'Pending'),
(304, 4, 204, '2026-09-04', 3, 'Delivered'),
(305, 5, 205, '2026-09-05', 1, 'Shipped'),
(306, 6, 206, '2026-09-06', 1, 'Pending'),
(307, 7, 207, '2026-09-07', 2, 'Delivered'),
(308, 8, 208, '2026-09-08', 1, 'Shipped'),
(309, 9, 209, '2026-09-09', 2, 'Pending'),
(310, 10, 210, '2026-09-10', 1, 'Delivered');

INSERT INTO Payment VALUES
(401, 301, '2026-09-01', 55000.00, 'UPI', 'Paid'),
(402, 302, '2026-09-02', 25000.00, 'Card', 'Paid'),
(403, 303, '2026-09-03', 4000.00, 'UPI', 'Paid'),
(404, 304, '2026-09-04', 2397.00, 'Cash', 'Paid'),
(405, 305, '2026-09-05', 1499.00, 'UPI', 'Paid'),
(406, 306, '2026-09-06', 2499.00, 'Card', 'Pending'),
(407, 307, '2026-09-07', 7000.00, 'UPI', 'Paid'),
(408, 308, '2026-09-08', 5000.00, 'Card', 'Paid'),
(409, 309, '2026-09-09', 1998.00, 'UPI', 'Pending'),
(410, 310, '2026-09-10', 2999.00, 'Cash', 'Paid');

SELECT * FROM Customer;
SELECT * FROM Product;
SELECT * FROM Product WHERE Price > 2000;
SELECT Name, Email FROM Customer;

SELECT
    Orders.Order_ID,
    Customer.Name,
    Orders.Order_Date,
    Orders.Quantity,
    Orders.Status
FROM Orders
JOIN Customer
ON Orders.Customer_ID = Customer.Customer_ID;

SELECT
    Product.Product_Name,
    Product.Price,
    Seller.Seller_Name
FROM Product
JOIN Seller
ON Product.Seller_ID = Seller.Seller_ID;

UPDATE Product
SET Price = 57000
WHERE Product_ID = 201;
UPDATE Orders
SET Status = 'Delivered'
WHERE Order_ID = 302;
UPDATE Customer
SET Address = 'Chennai'
WHERE Customer_ID = 2;
SELECT * FROM Orders
