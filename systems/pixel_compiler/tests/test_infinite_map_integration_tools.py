#!/usr/bin/env python3
"""
Tests for Infinite Map Integration Tools.

Tests the integration testing framework, deployment management,
health checking, and migration tools.
"""

import pytest
import tempfile
import os
import json
import shutil
from pathlib import Path
from unittest.mock import Mock, patch, MagicMock
from datetime import datetime

from systems.pixel_compiler.infinite_map_integration import (
    # Enums
    TestCategory,
    TestStatus,
    HealthCheckStatus,
    # Dataclasses
    TestResult,
    TestSuite,
    DeploymentConfig,
    DeploymentStatus,
    HealthCheckResult,
    MigrationProgress,
    # Classes
    IntegrationTester,
    DeploymentManager,
    HealthChecker,
    MigrationTool,
    IntegrationCLI,
)


# ============================================================================
# Test Enums
# ============================================================================

class TestTestCategory:
    """Tests for TestCategory enum."""

    def test_categories_exist(self):
        """Test that all categories are defined."""
        assert TestCategory.BOOT.value == "boot"
        assert TestCategory.FILESYSTEM.value == "filesystem"
        assert TestCategory.PERFORMANCE.value == "performance"
        assert TestCategory.RELIABILITY.value == "reliability"
        assert TestCategory.SECURITY.value == "security"
        assert TestCategory.STRESS.value == "stress"

    def test_category_count(self):
        """Test category count."""
        assert len(TestCategory) == 6


class TestTestStatus:
    """Tests for TestStatus enum."""

    def test_statuses_exist(self):
        """Test that all statuses are defined."""
        assert TestStatus.PENDING.value == "pending"
        assert TestStatus.RUNNING.value == "running"
        assert TestStatus.PASSED.value == "passed"
        assert TestStatus.FAILED.value == "failed"
        assert TestStatus.SKIPPED.value == "skipped"
        assert TestStatus.ERROR.value == "error"

    def test_status_count(self):
        """Test status count."""
        assert len(TestStatus) == 6


class TestHealthCheckStatus:
    """Tests for HealthCheckStatus enum."""

    def test_statuses_exist(self):
        """Test that all health check statuses are defined."""
        assert HealthCheckStatus.HEALTHY.value == "healthy"
        assert HealthCheckStatus.DEGRADED.value == "degraded"
        assert HealthCheckStatus.UNHEALTHY.value == "unhealthy"

    def test_status_count(self):
        """Test health status count."""
        assert len(HealthCheckStatus) == 3


# ============================================================================
# Test Dataclasses
# ============================================================================

class TestTestResult:
    """Tests for TestResult dataclass."""

    def test_creation(self):
        """Test TestResult creation."""
        result = TestResult(
            name="test_example",
            category=TestCategory.FILESYSTEM,
            status=TestStatus.PASSED,
            duration_ms=100.5,
            message="Test passed",
            details={"files": 10},
        )
        assert result.name == "test_example"
        assert result.category == TestCategory.FILESYSTEM
        assert result.status == TestStatus.PASSED
        assert result.duration_ms == 100.5
        assert result.message == "Test passed"
        assert result.details == {"files": 10}

    def test_default_values(self):
        """Test default values."""
        result = TestResult(
            name="test",
            category=TestCategory.BOOT,
            status=TestStatus.PENDING,
            duration_ms=0,
        )
        assert result.message == ""
        assert result.details == {}
        assert isinstance(result.timestamp, datetime)

    def test_to_dict(self):
        """Test to_dict conversion."""
        result = TestResult(
            name="test_example",
            category=TestCategory.FILESYSTEM,
            status=TestStatus.PASSED,
            duration_ms=100.5,
            message="Test passed",
            details={"files": 10},
        )
        d = result.to_dict()
        assert d["name"] == "test_example"
        assert d["category"] == "filesystem"
        assert d["status"] == "passed"
        assert d["duration_ms"] == 100.5
        assert d["message"] == "Test passed"
        assert d["details"] == {"files": 10}
        assert "timestamp" in d


class TestTestSuite:
    """Tests for TestSuite dataclass."""

    def test_creation(self):
        """Test TestSuite creation."""
        suite = TestSuite(name="Example Suite")
        assert suite.name == "Example Suite"
        assert suite.results == []
        assert suite.start_time is None
        assert suite.end_time is None

    def test_passed_count(self):
        """Test passed count."""
        suite = TestSuite(
            name="Test Suite",
            results=[
                TestResult("t1", TestCategory.FILESYSTEM, TestStatus.PASSED, 10),
                TestResult("t2", TestCategory.FILESYSTEM, TestStatus.PASSED, 10),
                TestResult("t3", TestCategory.FILESYSTEM, TestStatus.FAILED, 10),
            ],
        )
        assert suite.passed == 2

    def test_failed_count(self):
        """Test failed count."""
        suite = TestSuite(
            name="Test Suite",
            results=[
                TestResult("t1", TestCategory.FILESYSTEM, TestStatus.PASSED, 10),
                TestResult("t2", TestCategory.FILESYSTEM, TestStatus.FAILED, 10),
                TestResult("t3", TestCategory.FILESYSTEM, TestStatus.FAILED, 10),
            ],
        )
        assert suite.failed == 2

    def test_skipped_count(self):
        """Test skipped count."""
        suite = TestSuite(
            name="Test Suite",
            results=[
                TestResult("t1", TestCategory.FILESYSTEM, TestStatus.PASSED, 10),
                TestResult("t2", TestCategory.FILESYSTEM, TestStatus.SKIPPED, 10),
                TestResult("t3", TestCategory.FILESYSTEM, TestStatus.SKIPPED, 10),
            ],
        )
        assert suite.skipped == 2

    def test_total_count(self):
        """Test total count."""
        suite = TestSuite(
            name="Test Suite",
            results=[
                TestResult("t1", TestCategory.FILESYSTEM, TestStatus.PASSED, 10),
                TestResult("t2", TestCategory.FILESYSTEM, TestStatus.FAILED, 10),
            ],
        )
        assert suite.total == 2

    def test_duration_ms(self):
        """Test duration calculation."""
        suite = TestSuite(
            name="Test Suite",
            results=[
                TestResult("t1", TestCategory.FILESYSTEM, TestStatus.PASSED, 100),
                TestResult("t2", TestCategory.FILESYSTEM, TestStatus.PASSED, 200),
                TestResult("t3", TestCategory.FILESYSTEM, TestStatus.PASSED, 300),
            ],
        )
        assert suite.duration_ms == 600

    def test_to_dict(self):
        """Test to_dict conversion."""
        start = datetime(2025, 1, 1, 10, 0, 0)
        end = datetime(2025, 1, 1, 10, 1, 0)

        suite = TestSuite(
            name="Test Suite",
            results=[
                TestResult("t1", TestCategory.FILESYSTEM, TestStatus.PASSED, 100),
            ],
            start_time=start,
            end_time=end,
        )

        d = suite.to_dict()
        assert d["name"] == "Test Suite"
        assert d["passed"] == 1
        assert d["failed"] == 0
        assert d["skipped"] == 0
        assert d["total"] == 1
        assert d["duration_ms"] == 100
        assert d["start_time"] == start.isoformat()
        assert d["end_time"] == end.isoformat()
        assert len(d["results"]) == 1


class TestDeploymentConfig:
    """Tests for DeploymentConfig dataclass."""

    def test_creation(self):
        """Test DeploymentConfig creation."""
        config = DeploymentConfig(
            mount_point="/mnt/test",
            grid_size=4096,
            cache_size_mb=200,
        )
        assert config.mount_point == "/mnt/test"
        assert config.grid_size == 4096
        assert config.cache_size_mb == 200
        assert config.enable_monitoring is True
        assert config.enable_security is True
        assert config.log_level == "INFO"

    def test_default_values(self):
        """Test default values."""
        config = DeploymentConfig()
        assert config.mount_point == "/mnt/infinite"
        assert config.grid_size == 2048
        assert config.cache_size_mb == 100


class TestDeploymentStatus:
    """Tests for DeploymentStatus dataclass."""

    def test_creation(self):
        """Test DeploymentStatus creation."""
        now = datetime.now()
        status = DeploymentStatus(
            deployed=True,
            mount_point="/mnt/test",
            image_path="/path/to/image.png",
            started_at=now,
            pid=12345,
        )
        assert status.deployed is True
        assert status.mount_point == "/mnt/test"
        assert status.image_path == "/path/to/image.png"
        assert status.started_at == now
        assert status.pid == 12345

    def test_to_dict(self):
        """Test to_dict conversion."""
        now = datetime(2025, 1, 1, 10, 0, 0)
        status = DeploymentStatus(
            deployed=True,
            mount_point="/mnt/test",
            image_path="/path/to/image.png",
            started_at=now,
            pid=12345,
        )
        d = status.to_dict()
        assert d["deployed"] is True
        assert d["mount_point"] == "/mnt/test"
        assert d["image_path"] == "/path/to/image.png"
        assert d["started_at"] == now.isoformat()
        assert d["pid"] == 12345


class TestHealthCheckResult:
    """Tests for HealthCheckResult dataclass."""

    def test_creation(self):
        """Test HealthCheckResult creation."""
        result = HealthCheckResult(
            component="test_component",
            status=HealthCheckStatus.HEALTHY,
            message="Component is healthy",
            details={"key": "value"},
        )
        assert result.component == "test_component"
        assert result.status == HealthCheckStatus.HEALTHY
        assert result.message == "Component is healthy"
        assert result.details == {"key": "value"}

    def test_to_dict(self):
        """Test to_dict conversion."""
        result = HealthCheckResult(
            component="test_component",
            status=HealthCheckStatus.DEGRADED,
            message="Component is degraded",
            details={"key": "value"},
        )
        d = result.to_dict()
        assert d["component"] == "test_component"
        assert d["status"] == "degraded"
        assert d["message"] == "Component is degraded"
        assert d["details"] == {"key": "value"}
        assert "timestamp" in d


class TestMigrationProgress:
    """Tests for MigrationProgress dataclass."""

    def test_creation(self):
        """Test MigrationProgress creation."""
        progress = MigrationProgress(
            total_files=100,
            migrated_files=50,
            failed_files=2,
            bytes_migrated=1024000,
            current_file="test.txt",
        )
        assert progress.total_files == 100
        assert progress.migrated_files == 50
        assert progress.failed_files == 2
        assert progress.bytes_migrated == 1024000
        assert progress.current_file == "test.txt"

    def test_percent_complete(self):
        """Test percent_complete calculation."""
        progress = MigrationProgress(
            total_files=100,
            migrated_files=50,
            failed_files=0,
            bytes_migrated=0,
        )
        assert progress.percent_complete == 50.0

    def test_percent_complete_zero_total(self):
        """Test percent_complete with zero total."""
        progress = MigrationProgress(
            total_files=0,
            migrated_files=0,
            failed_files=0,
            bytes_migrated=0,
        )
        assert progress.percent_complete == 100.0

    def test_to_dict(self):
        """Test to_dict conversion."""
        now = datetime(2025, 1, 1, 10, 0, 0)
        progress = MigrationProgress(
            total_files=100,
            migrated_files=50,
            failed_files=2,
            bytes_migrated=1024000,
            current_file="test.txt",
            started_at=now,
            eta_seconds=60.0,
        )
        d = progress.to_dict()
        assert d["total_files"] == 100
        assert d["migrated_files"] == 50
        assert d["failed_files"] == 2
        assert d["bytes_migrated"] == 1024000
        assert d["percent_complete"] == 50.0
        assert d["current_file"] == "test.txt"
        assert d["eta_seconds"] == 60.0


# ============================================================================
# Test IntegrationTester
# ============================================================================

class TestIntegrationTester:
    """Tests for IntegrationTester class."""

    @pytest.fixture
    def temp_image(self, tmp_path):
        """Create a temporary test image."""
        from PIL import Image

        img_path = tmp_path / "test.rts.png"
        img = Image.new("RGBA", (256, 256), (0, 0, 0, 255))
        img.save(img_path)
        return str(img_path)

    def test_init(self, temp_image):
        """Test IntegrationTester initialization."""
        tester = IntegrationTester(temp_image)
        assert tester.image_path == Path(temp_image)
        assert tester.suites == []

    def test_create_suite(self, temp_image):
        """Test creating a test suite."""
        tester = IntegrationTester(temp_image)
        suite = tester.create_suite("My Suite")

        assert suite.name == "My Suite"
        assert len(tester.suites) == 1
        assert tester.suites[0] == suite

    def test_run_test_passed(self, temp_image):
        """Test running a passing test."""
        tester = IntegrationTester(temp_image)
        suite = tester.create_suite("Test Suite")

        def passing_test():
            return True, "Success", {"key": "value"}

        result = tester.run_test("test_pass", TestCategory.FILESYSTEM, passing_test, suite)

        assert result.name == "test_pass"
        assert result.status == TestStatus.PASSED
        assert result.message == "Success"
        assert result.details == {"key": "value"}
        assert len(suite.results) == 1

    def test_run_test_failed(self, temp_image):
        """Test running a failing test."""
        tester = IntegrationTester(temp_image)
        suite = tester.create_suite("Test Suite")

        def failing_test():
            return False, "Failure", {"error": "bad"}

        result = tester.run_test("test_fail", TestCategory.FILESYSTEM, failing_test, suite)

        assert result.name == "test_fail"
        assert result.status == TestStatus.FAILED
        assert result.message == "Failure"
        assert result.details == {"error": "bad"}

    def test_run_test_error(self, temp_image):
        """Test running a test that raises an exception."""
        tester = IntegrationTester(temp_image)
        suite = tester.create_suite("Test Suite")

        def error_test():
            raise ValueError("Test error")

        result = tester.run_test("test_error", TestCategory.FILESYSTEM, error_test, suite)

        assert result.name == "test_error"
        assert result.status == TestStatus.ERROR
        assert "Test error" in result.message

    def test_run_test_without_suite(self, temp_image):
        """Test running a test without a suite."""
        tester = IntegrationTester(temp_image)

        def passing_test():
            return True, "Success", {}

        result = tester.run_test("test_no_suite", TestCategory.FILESYSTEM, passing_test)

        assert result.status == TestStatus.PASSED
        assert len(tester.suites) == 0

    def test_test_image_load(self, temp_image):
        """Test image load test."""
        tester = IntegrationTester(temp_image)
        passed, message, details = tester.test_image_load()

        assert passed is True
        assert "successfully" in message.lower()
        assert "size" in details
        assert "mode" in details

    def test_test_image_load_missing(self, temp_image):
        """Test image load test with missing image."""
        tester = IntegrationTester("/nonexistent/image.png")
        passed, message, details = tester.test_image_load()

        assert passed is False
        assert "failed" in message.lower()

    def test_get_summary(self, temp_image):
        """Test getting test summary."""
        tester = IntegrationTester(temp_image)

        suite1 = tester.create_suite("Suite 1")
        suite1.results.append(TestResult("t1", TestCategory.FILESYSTEM, TestStatus.PASSED, 10))
        suite1.results.append(TestResult("t2", TestCategory.FILESYSTEM, TestStatus.FAILED, 10))

        suite2 = tester.create_suite("Suite 2")
        suite2.results.append(TestResult("t3", TestCategory.FILESYSTEM, TestStatus.PASSED, 10))
        suite2.results.append(TestResult("t4", TestCategory.FILESYSTEM, TestStatus.SKIPPED, 10))

        summary = tester.get_summary()

        assert summary["total_suites"] == 2
        assert summary["total_tests"] == 4
        assert summary["passed"] == 2
        assert summary["failed"] == 1
        assert summary["skipped"] == 1
        assert summary["pass_rate"] == 0.5

    def test_get_summary_empty(self, temp_image):
        """Test getting summary with no tests."""
        tester = IntegrationTester(temp_image)
        summary = tester.get_summary()

        assert summary["total_suites"] == 0
        assert summary["total_tests"] == 0
        assert summary["pass_rate"] == 0


# ============================================================================
# Test DeploymentManager
# ============================================================================

class TestDeploymentManager:
    """Tests for DeploymentManager class."""

    @pytest.fixture
    def temp_image(self, tmp_path):
        """Create a temporary test image."""
        from PIL import Image

        img_path = tmp_path / "test.rts.png"
        img = Image.new("RGBA", (256, 256), (0, 0, 0, 255))
        img.save(img_path)
        return str(img_path)

    def test_init(self, temp_image):
        """Test DeploymentManager initialization."""
        manager = DeploymentManager(temp_image)
        assert manager.image_path == Path(temp_image)
        assert manager.deployments == {}

    def test_deploy(self, temp_image, tmp_path):
        """Test deploying filesystem."""
        manager = DeploymentManager(temp_image)
        mount_point = str(tmp_path / "mount")

        status = manager.deploy(mount_point)

        assert status.deployed is True
        assert status.mount_point == mount_point
        assert status.image_path == temp_image
        assert status.pid is not None
        assert len(manager.deployments) == 1

    def test_deploy_with_config(self, temp_image, tmp_path):
        """Test deploying with custom config."""
        manager = DeploymentManager(temp_image)
        mount_point = str(tmp_path / "mount")

        config = DeploymentConfig(
            mount_point=mount_point,
            grid_size=4096,
            cache_size_mb=200,
        )
        status = manager.deploy(mount_point, config)

        assert status.deployed is True

    def test_deploy_already_deployed(self, temp_image, tmp_path):
        """Test deploying when already deployed."""
        manager = DeploymentManager(temp_image)
        mount_point = str(tmp_path / "mount")

        status1 = manager.deploy(mount_point)
        status2 = manager.deploy(mount_point)

        assert status1 == status2
        assert len(manager.deployments) == 1

    def test_undeploy(self, temp_image, tmp_path):
        """Test undeploying filesystem."""
        manager = DeploymentManager(temp_image)
        mount_point = str(tmp_path / "mount")

        manager.deploy(mount_point)
        result = manager.undeploy(mount_point)

        assert result is True
        assert manager.deployments[mount_point].deployed is False

    def test_undeploy_not_deployed(self, temp_image):
        """Test undeploying when not deployed."""
        manager = DeploymentManager(temp_image)
        result = manager.undeploy("/nonexistent/mount")

        assert result is False

    def test_undeploy_already_undeployed(self, temp_image, tmp_path):
        """Test undeploying when already undeployed."""
        manager = DeploymentManager(temp_image)
        mount_point = str(tmp_path / "mount")

        manager.deploy(mount_point)
        manager.undeploy(mount_point)
        result = manager.undeploy(mount_point)

        assert result is False

    def test_get_status(self, temp_image, tmp_path):
        """Test getting deployment status."""
        manager = DeploymentManager(temp_image)
        mount_point = str(tmp_path / "mount")

        manager.deploy(mount_point)
        status = manager.get_status(mount_point)

        assert status is not None
        assert status.deployed is True

    def test_get_status_nonexistent(self, temp_image):
        """Test getting status for nonexistent deployment."""
        manager = DeploymentManager(temp_image)
        status = manager.get_status("/nonexistent/mount")

        assert status is None

    def test_list_deployments(self, temp_image, tmp_path):
        """Test listing all deployments."""
        manager = DeploymentManager(temp_image)
        mount1 = str(tmp_path / "mount1")
        mount2 = str(tmp_path / "mount2")

        manager.deploy(mount1)
        manager.deploy(mount2)

        deployments = manager.list_deployments()

        assert len(deployments) == 2


# ============================================================================
# Test HealthChecker
# ============================================================================

class TestHealthChecker:
    """Tests for HealthChecker class."""

    @pytest.fixture
    def temp_image(self, tmp_path):
        """Create a temporary test image."""
        from PIL import Image

        img_path = tmp_path / "test.rts.png"
        img = Image.new("RGBA", (256, 256), (0, 0, 0, 255))
        img.save(img_path)
        return str(img_path)

    def test_init(self, temp_image):
        """Test HealthChecker initialization."""
        checker = HealthChecker(temp_image)
        assert checker.image_path == Path(temp_image)
        assert checker.results == []

    def test_check_image_exists(self, temp_image):
        """Test checking image exists."""
        checker = HealthChecker(temp_image)
        result = checker.check_image_exists()

        assert result.component == "image_file"
        assert result.status == HealthCheckStatus.HEALTHY
        assert "exists" in result.message.lower()

    def test_check_image_exists_missing(self, temp_image):
        """Test checking missing image."""
        checker = HealthChecker("/nonexistent/image.png")
        result = checker.check_image_exists()

        assert result.component == "image_file"
        assert result.status == HealthCheckStatus.UNHEALTHY
        assert "missing" in result.message.lower()

    def test_check_image_readable(self, temp_image):
        """Test checking image is readable."""
        checker = HealthChecker(temp_image)
        result = checker.check_image_readable()

        assert result.component == "image_readable"
        assert result.status == HealthCheckStatus.HEALTHY
        assert "readable" in result.message.lower()

    def test_check_image_readable_corrupted(self, temp_image, tmp_path):
        """Test checking corrupted image."""
        bad_image = tmp_path / "bad.png"
        bad_image.write_bytes(b"not a real png")

        checker = HealthChecker(str(bad_image))
        result = checker.check_image_readable()

        assert result.component == "image_readable"
        assert result.status == HealthCheckStatus.UNHEALTHY

    def test_check_disk_space(self, temp_image):
        """Test checking disk space."""
        checker = HealthChecker(temp_image)
        result = checker.check_disk_space()

        assert result.component == "disk_space"
        assert result.status in [
            HealthCheckStatus.HEALTHY,
            HealthCheckStatus.DEGRADED,
            HealthCheckStatus.UNHEALTHY,
        ]
        assert "usage" in result.message.lower()
        assert "free_gb" in result.details

    def test_check_dependencies(self, temp_image):
        """Test checking dependencies."""
        checker = HealthChecker(temp_image)
        result = checker.check_dependencies()

        assert result.component == "dependencies"
        assert result.status == HealthCheckStatus.HEALTHY
        assert "available" in result.message.lower()

    def test_run_all_checks(self, temp_image):
        """Test running all health checks."""
        checker = HealthChecker(temp_image)
        results = checker.run_all_checks()

        assert len(results) == 5
        assert len(checker.results) == 5

    def test_get_overall_status_healthy(self, temp_image):
        """Test getting overall healthy status."""
        checker = HealthChecker(temp_image)
        checker.results = [
            HealthCheckResult("c1", HealthCheckStatus.HEALTHY, "OK"),
            HealthCheckResult("c2", HealthCheckStatus.HEALTHY, "OK"),
        ]

        assert checker.get_overall_status() == HealthCheckStatus.HEALTHY

    def test_get_overall_status_degraded(self, temp_image):
        """Test getting overall degraded status."""
        checker = HealthChecker(temp_image)
        checker.results = [
            HealthCheckResult("c1", HealthCheckStatus.HEALTHY, "OK"),
            HealthCheckResult("c2", HealthCheckStatus.DEGRADED, "Warning"),
        ]

        assert checker.get_overall_status() == HealthCheckStatus.DEGRADED

    def test_get_overall_status_unhealthy(self, temp_image):
        """Test getting overall unhealthy status."""
        checker = HealthChecker(temp_image)
        checker.results = [
            HealthCheckResult("c1", HealthCheckStatus.HEALTHY, "OK"),
            HealthCheckResult("c2", HealthCheckStatus.UNHEALTHY, "Error"),
        ]

        assert checker.get_overall_status() == HealthCheckStatus.UNHEALTHY

    def test_get_overall_status_no_results(self, temp_image):
        """Test getting status with no results."""
        checker = HealthChecker(temp_image)

        assert checker.get_overall_status() == HealthCheckStatus.UNHEALTHY

    def test_to_dict(self, temp_image):
        """Test to_dict conversion."""
        checker = HealthChecker(temp_image)
        checker.run_all_checks()

        d = checker.to_dict()

        assert "overall_status" in d
        assert "checks" in d
        assert "timestamp" in d
        assert len(d["checks"]) == 5


# ============================================================================
# Test MigrationTool
# ============================================================================

class TestMigrationTool:
    """Tests for MigrationTool class."""

    @pytest.fixture
    def temp_image(self, tmp_path):
        """Create a temporary test image."""
        from PIL import Image

        img_path = tmp_path / "test.rts.png"
        img = Image.new("RGBA", (256, 256), (0, 0, 0, 255))
        img.save(img_path)
        return str(img_path)

    @pytest.fixture
    def temp_source_dir(self, tmp_path):
        """Create a temporary source directory with files."""
        source_dir = tmp_path / "source"
        source_dir.mkdir()

        # Create some test files
        (source_dir / "file1.txt").write_text("content1")
        (source_dir / "file2.txt").write_text("content2")

        subdir = source_dir / "subdir"
        subdir.mkdir()
        (subdir / "file3.txt").write_text("content3")

        return str(source_dir)

    def test_init(self, temp_image):
        """Test MigrationTool initialization."""
        tool = MigrationTool(temp_image)
        assert tool.image_path == Path(temp_image)
        assert tool.progress is None
        assert tool._cancel_flag is False

    def test_import_from_directory_missing_source(self, temp_image):
        """Test importing from missing source."""
        tool = MigrationTool(temp_image)
        success, message, details = tool.import_from_directory("/nonexistent/source")

        assert success is False
        assert "not found" in message.lower()

    @patch("systems.pixel_compiler.infinite_map_v2.InfiniteMapBuilderV2")
    def test_import_from_directory(self, mock_builder_class, temp_image, temp_source_dir):
        """Test importing from directory."""
        mock_builder = MagicMock()
        mock_builder_class.return_value = mock_builder

        tool = MigrationTool(temp_image)
        success, message, details = tool.import_from_directory(temp_source_dir)

        assert success is True
        assert "success" in message.lower()
        assert tool.progress is not None
        assert tool.progress.total_files == 3

    def test_cancel(self, temp_image):
        """Test canceling migration."""
        tool = MigrationTool(temp_image)
        tool._cancel_flag = False

        tool.cancel()

        assert tool._cancel_flag is True


# ============================================================================
# Test IntegrationCLI
# ============================================================================

class TestIntegrationCLI:
    """Tests for IntegrationCLI class."""

    @pytest.fixture
    def temp_image(self, tmp_path):
        """Create a temporary test image."""
        from PIL import Image

        img_path = tmp_path / "test.rts.png"
        img = Image.new("RGBA", (256, 256), (0, 0, 0, 255))
        img.save(img_path)
        return str(img_path)

    def test_init(self, temp_image):
        """Test IntegrationCLI initialization."""
        cli = IntegrationCLI(temp_image)
        assert cli.image_path == temp_image
        assert isinstance(cli.tester, IntegrationTester)
        assert isinstance(cli.deployment, DeploymentManager)
        assert isinstance(cli.health, HealthChecker)
        assert isinstance(cli.migration, MigrationTool)

    def test_cmd_health(self, temp_image):
        """Test health command."""
        cli = IntegrationCLI(temp_image)

        args = MagicMock()
        result = cli.cmd_health(args)

        assert result in [0, 1]  # 0 for healthy, 1 otherwise

    def test_cmd_deploy(self, temp_image, tmp_path):
        """Test deploy command."""
        cli = IntegrationCLI(temp_image)

        args = MagicMock()
        args.mount = str(tmp_path / "mount")

        result = cli.cmd_deploy(args)

        assert result == 0

    def test_cmd_undeploy(self, temp_image, tmp_path):
        """Test undeploy command."""
        cli = IntegrationCLI(temp_image)

        args = MagicMock()
        args.mount = str(tmp_path / "mount")

        # Deploy first
        cli.cmd_deploy(args)

        # Then undeploy
        result = cli.cmd_undeploy(args)

        assert result == 0

    def test_cmd_undeploy_not_deployed(self, temp_image):
        """Test undeploy when not deployed."""
        cli = IntegrationCLI(temp_image)

        args = MagicMock()
        args.mount = "/nonexistent/mount"

        result = cli.cmd_undeploy(args)

        assert result == 1


# ============================================================================
# Integration Tests
# ============================================================================

class TestIntegrationIntegration:
    """Integration tests combining multiple components."""

    @pytest.fixture
    def temp_image(self, tmp_path):
        """Create a temporary test image."""
        from PIL import Image

        img_path = tmp_path / "test.rts.png"
        img = Image.new("RGBA", (256, 256), (0, 0, 0, 255))
        img.save(img_path)
        return str(img_path)

    def test_full_workflow(self, temp_image, tmp_path):
        """Test full workflow: check, deploy, test, undeploy."""
        cli = IntegrationCLI(temp_image)

        # 1. Health check
        args = MagicMock()
        health_result = cli.cmd_health(args)

        # 2. Deploy
        args.mount = str(tmp_path / "mount")
        deploy_result = cli.cmd_deploy(args)

        # 3. Check deployment status
        status = cli.deployment.get_status(args.mount)
        assert status is not None
        assert status.deployed is True

        # 4. Undeploy (use same args object with mount set)
        undeploy_result = cli.cmd_undeploy(args)

        assert deploy_result == 0
        assert undeploy_result == 0

    def test_test_suite_with_results(self, temp_image):
        """Test running a test suite and verifying results."""
        tester = IntegrationTester(temp_image)

        suite = tester.create_suite("Integration Test")

        # Run several tests
        def pass_test():
            return True, "Passed", {}

        def fail_test():
            return False, "Failed", {}

        def error_test():
            raise RuntimeError("Test error")

        tester.run_test("passing", TestCategory.FILESYSTEM, pass_test, suite)
        tester.run_test("failing", TestCategory.FILESYSTEM, fail_test, suite)
        tester.run_test("error", TestCategory.FILESYSTEM, error_test, suite)

        assert suite.total == 3
        assert suite.passed == 1
        assert suite.failed == 1
        # Error counts as failed due to ERROR status

    def test_multiple_deployments(self, temp_image, tmp_path):
        """Test multiple deployments."""
        manager = DeploymentManager(temp_image)

        mount1 = str(tmp_path / "mount1")
        mount2 = str(tmp_path / "mount2")

        manager.deploy(mount1)
        manager.deploy(mount2)

        deployments = manager.list_deployments()
        assert len(deployments) == 2

        # Undeploy both
        manager.undeploy(mount1)
        manager.undeploy(mount2)

        assert manager.deployments[mount1].deployed is False
        assert manager.deployments[mount2].deployed is False


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
