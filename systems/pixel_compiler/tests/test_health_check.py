#!/usr/bin/env python3
"""
Tests for Health Check System.

Unit tests for health_check.py module covering:
- HealthStatus dataclass
- HealthChecker class
- Individual check methods
- Status determination logic
- JSON serialization
"""

import json
import os
import tempfile
import time
from pathlib import Path
from unittest.mock import Mock, patch, MagicMock

import pytest


class TestHealthStatus:
    """Tests for HealthStatus dataclass."""

    def test_health_status_creation(self):
        """Test basic HealthStatus creation."""
        from systems.pixel_compiler.health_check import HealthStatus

        status = HealthStatus(
            status="healthy",
            checks={"vat_integrity": True, "storage_available": True},
            details={"vat_integrity": {"message": "OK"}},
            timestamp=time.time()
        )

        assert status.status == "healthy"
        assert status.checks["vat_integrity"] is True
        assert status.checks["storage_available"] is True
        assert "vat_integrity" in status.details

    def test_health_status_defaults(self):
        """Test HealthStatus default values."""
        from systems.pixel_compiler.health_check import HealthStatus

        status = HealthStatus(status="healthy")

        assert status.checks == {}
        assert status.details == {}
        assert isinstance(status.timestamp, float)

    def test_to_dict(self):
        """Test HealthStatus to_dict method."""
        from systems.pixel_compiler.health_check import HealthStatus

        status = HealthStatus(
            status="healthy",
            checks={"test": True},
            details={"test": {"message": "OK"}}
        )

        result = status.to_dict()

        assert isinstance(result, dict)
        assert result["status"] == "healthy"
        assert result["checks"]["test"] is True
        assert "timestamp" in result

    def test_to_json(self):
        """Test HealthStatus to_json method."""
        from systems.pixel_compiler.health_check import HealthStatus

        status = HealthStatus(
            status="healthy",
            checks={"test": True},
            details={"test": {"message": "OK"}}
        )

        json_str = status.to_json()
        result = json.loads(json_str)

        assert isinstance(json_str, str)
        assert result["status"] == "healthy"
        assert result["checks"]["test"] is True

    def test_from_dict(self):
        """Test HealthStatus from_dict class method."""
        from systems.pixel_compiler.health_check import HealthStatus

        data = {
            "status": "degraded",
            "checks": {"test": False},
            "details": {"test": {"error": "Failed"}},
            "timestamp": 1234567890.0
        }

        status = HealthStatus.from_dict(data)

        assert status.status == "degraded"
        assert status.checks["test"] is False
        assert status.timestamp == 1234567890.0

    def test_is_healthy(self):
        """Test is_healthy method."""
        from systems.pixel_compiler.health_check import HealthStatus

        assert HealthStatus(status="healthy").is_healthy() is True
        assert HealthStatus(status="degraded").is_healthy() is False
        assert HealthStatus(status="unhealthy").is_healthy() is False

    def test_is_degraded(self):
        """Test is_degraded method."""
        from systems.pixel_compiler.health_check import HealthStatus

        assert HealthStatus(status="degraded").is_degraded() is True
        assert HealthStatus(status="healthy").is_degraded() is False
        assert HealthStatus(status="unhealthy").is_degraded() is False

    def test_is_unhealthy(self):
        """Test is_unhealthy method."""
        from systems.pixel_compiler.health_check import HealthStatus

        assert HealthStatus(status="unhealthy").is_unhealthy() is True
        assert HealthStatus(status="healthy").is_unhealthy() is False
        assert HealthStatus(status="degraded").is_unhealthy() is False


class TestHealthChecker:
    """Tests for HealthChecker class."""

    def test_health_checker_creation(self):
        """Test basic HealthChecker creation."""
        from systems.pixel_compiler.health_check import HealthChecker

        checker = HealthChecker(vat_path="/tmp/vat.json")

        assert checker.vat_path == Path("/tmp/vat.json")
        assert checker.builder is None
        assert checker.daemon is None

    def test_health_checker_with_defaults(self):
        """Test HealthChecker with default values."""
        from systems.pixel_compiler.health_check import (
            HealthChecker,
            DEFAULT_MIN_STORAGE_GB,
            DEFAULT_MAX_MEMORY_PERCENT
        )

        checker = HealthChecker()

        assert checker.vat_path is None
        assert checker.min_storage_gb == DEFAULT_MIN_STORAGE_GB
        assert checker.max_memory_percent == DEFAULT_MAX_MEMORY_PERCENT

    def test_determine_status_healthy(self):
        """Test status determination - all checks pass."""
        from systems.pixel_compiler.health_check import HealthChecker

        checker = HealthChecker()
        checks = {
            "vat_integrity": True,
            "storage_available": True,
            "daemon_running": True,
            "snapshot_recent": True,
            "memory_usage": True
        }

        status = checker._determine_status(checks)
        assert status == "healthy"

    def test_determine_status_degraded(self):
        """Test status determination - non-critical check fails."""
        from systems.pixel_compiler.health_check import HealthChecker

        checker = HealthChecker()
        checks = {
            "vat_integrity": True,
            "storage_available": True,
            "daemon_running": False,  # Non-critical
            "snapshot_recent": True,
            "memory_usage": True
        }

        status = checker._determine_status(checks)
        assert status == "degraded"

    def test_determine_status_unhealthy_vat(self):
        """Test status determination - VAT integrity fails (critical)."""
        from systems.pixel_compiler.health_check import HealthChecker

        checker = HealthChecker()
        checks = {
            "vat_integrity": False,  # Critical!
            "storage_available": True,
            "daemon_running": True,
            "snapshot_recent": True,
            "memory_usage": True
        }

        status = checker._determine_status(checks)
        assert status == "unhealthy"

    def test_determine_status_unhealthy_storage(self):
        """Test status determination - storage fails (critical)."""
        from systems.pixel_compiler.health_check import HealthChecker

        checker = HealthChecker()
        checks = {
            "vat_integrity": True,
            "storage_available": False,  # Critical!
            "daemon_running": True,
            "snapshot_recent": True,
            "memory_usage": True
        }

        status = checker._determine_status(checks)
        assert status == "unhealthy"


class TestCheckVatIntegrity:
    """Tests for check_vat_integrity method."""

    def test_vat_integrity_no_path(self):
        """Test VAT integrity check with no path configured."""
        from systems.pixel_compiler.health_check import HealthChecker

        checker = HealthChecker(vat_path=None)
        passed, details = checker.check_vat_integrity()

        assert passed is False
        assert details["error"] is not None
        assert "not configured" in details["error"].lower()

    def test_vat_integrity_file_not_found(self):
        """Test VAT integrity check with missing file."""
        from systems.pixel_compiler.health_check import HealthChecker

        with tempfile.TemporaryDirectory() as tmpdir:
            checker = HealthChecker(vat_path=os.path.join(tmpdir, "nonexistent.json"))
            passed, details = checker.check_vat_integrity()

            assert passed is False
            assert "not found" in details["error"].lower()

    def test_vat_integrity_invalid_json(self):
        """Test VAT integrity check with invalid JSON."""
        from systems.pixel_compiler.health_check import HealthChecker

        with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
            f.write("{ invalid json }")
            f.flush()
            vat_path = f.name

        try:
            checker = HealthChecker(vat_path=vat_path)
            passed, details = checker.check_vat_integrity()

            assert passed is False
            assert "json" in details["error"].lower()
        finally:
            os.unlink(vat_path)

    def test_vat_integrity_missing_fields(self):
        """Test VAT integrity check with missing required fields."""
        from systems.pixel_compiler.health_check import HealthChecker

        with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
            json.dump({"format": "visual-allocation-table-v2"}, f)  # Missing grid_size, entries
            f.flush()
            vat_path = f.name

        try:
            checker = HealthChecker(vat_path=vat_path)
            passed, details = checker.check_vat_integrity()

            assert passed is False
            assert "missing" in details["error"].lower()
        finally:
            os.unlink(vat_path)

    def test_vat_integrity_valid(self):
        """Test VAT integrity check with valid VAT file."""
        from systems.pixel_compiler.health_check import HealthChecker

        vat_data = {
            "format": "visual-allocation-table-v2",
            "version": "2.0",
            "grid_size": 2048,
            "entries": {
                "file1.txt": [[100, 200]],
                "file2.txt": [[150, 250], [160, 260]]
            },
            "center": [1024, 1024]
        }

        with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
            json.dump(vat_data, f)
            f.flush()
            vat_path = f.name

        try:
            checker = HealthChecker(vat_path=vat_path)
            passed, details = checker.check_vat_integrity()

            assert passed is True
            assert details["entries_count"] == 2
            assert details["grid_size"] == 2048
        finally:
            os.unlink(vat_path)


class TestCheckStorageAvailable:
    """Tests for check_storage_available method."""

    def test_storage_available_sufficient(self):
        """Test storage check with sufficient space."""
        from systems.pixel_compiler.health_check import HealthChecker

        checker = HealthChecker(min_storage_gb=0.001)  # Very low threshold
        passed, details = checker.check_storage_available()

        # Should pass on most systems with 0.001GB threshold
        assert details["free_gb"] is not None
        assert details["total_gb"] is not None
        assert details["percent_free"] is not None

    def test_storage_available_insufficient(self):
        """Test storage check with unrealistic threshold."""
        from systems.pixel_compiler.health_check import HealthChecker

        checker = HealthChecker(min_storage_gb=999999.0)  # Unrealistic
        passed, details = checker.check_storage_available()

        assert passed is False
        assert details["error"] is not None


class TestCheckDaemonRunning:
    """Tests for check_daemon_running method."""

    def test_daemon_no_instance(self):
        """Test daemon check with no daemon instance."""
        from systems.pixel_compiler.health_check import HealthChecker

        checker = HealthChecker(daemon=None)
        passed, details = checker.check_daemon_running()

        assert passed is True  # Non-critical, so passes
        assert "no daemon" in details["message"].lower()

    def test_daemon_running(self):
        """Test daemon check with running daemon."""
        from systems.pixel_compiler.health_check import HealthChecker

        mock_daemon = Mock()
        mock_daemon.is_running = Mock(return_value=True)
        mock_stats = Mock()
        mock_stats.to_dict = Mock(return_value={"scans": 10})
        mock_daemon.get_statistics = Mock(return_value=mock_stats)

        checker = HealthChecker(daemon=mock_daemon)
        passed, details = checker.check_daemon_running()

        assert passed is True
        assert details["is_running"] is True

    def test_daemon_not_running(self):
        """Test daemon check with stopped daemon."""
        from systems.pixel_compiler.health_check import HealthChecker

        mock_daemon = Mock()
        mock_daemon.is_running = Mock(return_value=False)

        checker = HealthChecker(daemon=mock_daemon)
        passed, details = checker.check_daemon_running()

        # Non-critical, so still passes
        assert passed is True
        assert details["is_running"] is False


class TestCheckSnapshotRecent:
    """Tests for check_snapshot_recent method."""

    def test_snapshot_no_manager(self):
        """Test snapshot check with no manager."""
        from systems.pixel_compiler.health_check import HealthChecker

        checker = HealthChecker(snapshot_manager=None)
        passed, details = checker.check_snapshot_recent()

        # Non-critical, passes
        assert passed is True

    def test_snapshot_no_snapshots(self):
        """Test snapshot check with no snapshots."""
        from systems.pixel_compiler.health_check import HealthChecker

        mock_manager = Mock()
        mock_manager.list_snapshots = Mock(return_value=[])

        checker = HealthChecker(snapshot_manager=mock_manager)
        passed, details = checker.check_snapshot_recent()

        assert passed is False
        assert details["snapshot_count"] == 0

    def test_snapshot_recent_exists(self):
        """Test snapshot check with recent snapshot."""
        from systems.pixel_compiler.health_check import HealthChecker

        mock_snapshot = Mock()
        mock_snapshot.timestamp = time.time() - 3600  # 1 hour ago

        mock_manager = Mock()
        mock_manager.list_snapshots = Mock(return_value=[mock_snapshot])

        checker = HealthChecker(snapshot_manager=mock_manager)
        passed, details = checker.check_snapshot_recent()

        assert passed is True
        assert details["newest_snapshot_age_hours"] is not None

    def test_snapshot_too_old(self):
        """Test snapshot check with old snapshot."""
        from systems.pixel_compiler.health_check import HealthChecker

        mock_snapshot = Mock()
        mock_snapshot.timestamp = time.time() - (48 * 3600)  # 48 hours ago

        mock_manager = Mock()
        mock_manager.list_snapshots = Mock(return_value=[mock_snapshot])

        checker = HealthChecker(
            snapshot_manager=mock_manager,
            snapshot_max_age_hours=24.0
        )
        passed, details = checker.check_snapshot_recent()

        assert passed is False
        assert details["newest_snapshot_age_hours"] > 24


class TestCheckMemoryUsage:
    """Tests for check_memory_usage method."""

    def test_memory_usage_no_psutil(self):
        """Test memory check without psutil."""
        from systems.pixel_compiler.health_check import HealthChecker

        with patch('systems.pixel_compiler.health_check.PSUTIL_AVAILABLE', False):
            checker = HealthChecker()
            passed, details = checker.check_memory_usage()

            # Should pass with note
            assert passed is True
            assert details["psutil_available"] is False

    @patch('systems.pixel_compiler.health_check.PSUTIL_AVAILABLE', True)
    @patch('systems.pixel_compiler.health_check.psutil')
    def test_memory_usage_ok(self, mock_psutil):
        """Test memory check with acceptable usage."""
        from systems.pixel_compiler.health_check import HealthChecker

        mock_memory = Mock()
        mock_memory.percent = 50.0
        mock_memory.available = 8 * 1024 ** 3  # 8GB
        mock_memory.total = 16 * 1024 ** 3  # 16GB
        mock_psutil.virtual_memory.return_value = mock_memory

        checker = HealthChecker(max_memory_percent=90.0)
        passed, details = checker.check_memory_usage()

        assert passed is True
        assert details["percent_used"] == 50.0

    @patch('systems.pixel_compiler.health_check.PSUTIL_AVAILABLE', True)
    @patch('systems.pixel_compiler.health_check.psutil')
    def test_memory_usage_high(self, mock_psutil):
        """Test memory check with high usage."""
        from systems.pixel_compiler.health_check import HealthChecker

        mock_memory = Mock()
        mock_memory.percent = 95.0
        mock_memory.available = 0.8 * 1024 ** 3  # 0.8GB
        mock_memory.total = 16 * 1024 ** 3  # 16GB
        mock_psutil.virtual_memory.return_value = mock_memory

        checker = HealthChecker(max_memory_percent=90.0)
        passed, details = checker.check_memory_usage()

        assert passed is False
        assert details["percent_used"] == 95.0


class TestCheckAll:
    """Tests for check_all method."""

    def test_check_all_returns_health_status(self):
        """Test check_all returns HealthStatus."""
        from systems.pixel_compiler.health_check import HealthChecker, HealthStatus

        checker = HealthChecker()
        status = checker.check_all()

        assert isinstance(status, HealthStatus)
        assert status.status in ["healthy", "degraded", "unhealthy"]

    def test_check_all_includes_all_checks(self):
        """Test check_all includes all expected checks."""
        from systems.pixel_compiler.health_check import HealthChecker

        checker = HealthChecker()
        status = checker.check_all()

        expected_checks = [
            "vat_integrity",
            "storage_available",
            "daemon_running",
            "snapshot_recent",
            "memory_usage"
        ]

        for check in expected_checks:
            assert check in status.checks
            assert check in status.details


class TestConvenienceFunction:
    """Tests for check_health convenience function."""

    def test_check_health_function(self):
        """Test check_health convenience function."""
        from systems.pixel_compiler.health_check import check_health, HealthStatus

        status = check_health()

        assert isinstance(status, HealthStatus)

    def test_check_health_with_vat_path(self):
        """Test check_health with VAT path."""
        from systems.pixel_compiler.health_check import check_health

        with tempfile.TemporaryDirectory() as tmpdir:
            vat_path = os.path.join(tmpdir, "vat.json")
            status = check_health(vat_path=vat_path)

            # Should fail because file doesn't exist
            assert status.checks["vat_integrity"] is False


class TestToJson:
    """Tests for to_json method."""

    def test_to_json_runs_checks(self):
        """Test to_json runs all checks."""
        from systems.pixel_compiler.health_check import HealthChecker

        checker = HealthChecker()
        json_str = checker.to_json()

        assert isinstance(json_str, str)

        data = json.loads(json_str)
        assert "status" in data
        assert "checks" in data
        assert "details" in data
        assert "timestamp" in data

    def test_to_json_custom_indent(self):
        """Test to_json with custom indent."""
        from systems.pixel_compiler.health_check import HealthChecker

        checker = HealthChecker()
        json_str = checker.to_json(indent=4)

        # Check indentation
        assert "    " in json_str  # 4 spaces


if __name__ == '__main__':
    pytest.main([__file__, '-v'])
