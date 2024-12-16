-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 16, 2024 at 06:42 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `studyhub_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL,
  `course_name` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `instructor` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `course_name`, `link`, `instructor`) VALUES
(5, 'BSIT', 'https://youtu.be/j0lBrYSlYaU?si=9EnaHF9udfu6sn2W', 'Hazel'),
(6, 'BSIT', 'https://youtu.be/dlacc6831zw?si=ukLflJn2ZhezNtlb', 'Hazel');

-- --------------------------------------------------------

--
-- Table structure for table `instructordb`
--

CREATE TABLE `instructordb` (
  `instructor_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `department` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `instructordb`
--

INSERT INTO `instructordb` (`instructor_id`, `username`, `email`, `password`, `department`) VALUES
(1, 'Hazel', 'hazel@gmail.com', '1234', 'IT department');

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `notes_id` int(11) NOT NULL,
  `created_notes` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `student_username` varchar(255) NOT NULL,
  `instructor_username` varchar(255) NOT NULL,
  `message` text DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `date_sent` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `studentdb`
--

CREATE TABLE `studentdb` (
  `student_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `course` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `studentdb`
--

INSERT INTO `studentdb` (`student_id`, `username`, `email`, `password`, `course`) VALUES
(4, 'levy', 'levy@gmail.com', '123', 'BSIT');

-- --------------------------------------------------------

--
-- Table structure for table `user_hidden_courses`
--

CREATE TABLE `user_hidden_courses` (
  `id` int(11) NOT NULL,
  `course_name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `course_name` (`course_name`);

--
-- Indexes for table `instructordb`
--
ALTER TABLE `instructordb`
  ADD PRIMARY KEY (`instructor_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`notes_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `instructor_username` (`instructor_username`),
  ADD KEY `student_username` (`student_username`);

--
-- Indexes for table `studentdb`
--
ALTER TABLE `studentdb`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `user_hidden_courses`
--
ALTER TABLE `user_hidden_courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_name` (`course_name`),
  ADD KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `instructordb`
--
ALTER TABLE `instructordb`
  MODIFY `instructor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `notes_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `studentdb`
--
ALTER TABLE `studentdb`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_hidden_courses`
--
ALTER TABLE `user_hidden_courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `notes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `studentdb` (`student_id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`instructor_username`) REFERENCES `instructordb` (`username`),
  ADD CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`student_username`) REFERENCES `studentdb` (`username`);

--
-- Constraints for table `user_hidden_courses`
--
ALTER TABLE `user_hidden_courses`
  ADD CONSTRAINT `user_hidden_courses_ibfk_1` FOREIGN KEY (`course_name`) REFERENCES `studentdb` (`username`),
  ADD CONSTRAINT `user_hidden_courses_ibfk_2` FOREIGN KEY (`username`) REFERENCES `studentdb` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
