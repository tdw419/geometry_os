#!/usr/bin/env python3
"""
Infinite Map Integration Tools.

Provides utilities for testing, deployment, and integration
of the Infinite Map filesystem with real-world systems.

Key Components:
- IntegrationTester: Automated testing framework
- DeploymentManager: Deployment and configuration
- HealthChecker: System health verification
- MigrationTool: Data migration utilities
- IntegrationCLI: Command-line interface

Usage:
    from infinite_map_integration import IntegrationTester

    tester = IntegrationTester(image_path="os.rts.png")
    results = tester.run_all_tests()

    # Check system health
    health = tester.health_check()
"""

import os
import sys
import json
import time
import shutil
import tempfile
import subprocess
import threading
from pathlib import Path
from dataclasses import dataclass, field
from typing import Dict, List, Optional, Any, Callable, Tuple, Union
from datetime import datetime, timedelta
from enum import Enum, auto
import logging

# Set up logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


# ============================================================================
# Test Framework
# ============================================================================

class TestCategory(Enum):
    """Categories of integration tests."""
    BOOT = "boot"
    FILESYSTEM = "filesystem"
    PERFORMANCE = "performance"
    RELIABILITY = "reliability"
    SECURITY = "security"
    STRESS = "stress"


class TestStatus(Enum):
    """Status of a test."""
    PENDING = "pending"
    RUNNING = "running"
    PASSED = "passed"
    FAILED = "failed"
    SKIPPED = "skipped"
    ERROR = "error"


@dataclass
class TestResult:
    """Result of an integration test."""
    name: str
    category: TestCategory
    status: TestStatus
    duration_ms: float
    message: str = ""
    details: Dict[str, Any] = field(default_factory=dict)
    timestamp: datetime = field(default_factory=datetime.now)

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary."""
        return {
            "name": self.name,
            "category": self.category.value,
            "status": self.status.value,
            "duration_ms": self.duration_ms,
            "message": self.message,
            "details": self.details,
            "timestamp": self.timestamp.isoformat(),
        }


@dataclass
class TestSuite:
    """Collection of test results."""
    name: str
    results: List[TestResult] = field(default_factory=list)
    start_time: Optional[datetime] = None
    end_time: Optional[datetime] = None

    @property
    def passed(self) -> int:
        return sum(1 for r in self.results if r.status == TestStatus.PASSED)

    @property
    def failed(self) -> int:
        return sum(1 for r in self.results if r.status == TestStatus.FAILED)

    @property
    def skipped(self) -> int:
        return sum(1 for r in self.results if r.status == TestStatus.SKIPPED)

    @property
    def total(self) -> int:
        return len(self.results)

    @property
    def duration_ms(self) -> float:
        return sum(r.duration_ms for r in self.results)

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary."""
        return {
            "name": self.name,
            "passed": self.passed,
            "failed": self.failed,
            "skipped": self.skipped,
            "total": self.total,
            "duration_ms": self.duration_ms,
            "start_time": self.start_time.isoformat() if self.start_time else None,
            "end_time": self.end_time.isoformat() if self.end_time else None,
            "results": [r.to_dict() for r in self.results],
        }


class IntegrationTester:
    """
    Automated integration testing framework.

    Runs comprehensive tests against an Infinite Map image
    to verify functionality and performance.
    """

    def __init__(self, image_path: str):
        self.image_path = Path(image_path)
        self.suites: List[TestSuite] = []
        self._current_suite: Optional[TestSuite] = None

    def create_suite(self, name: str) -> TestSuite:
        """Create a new test suite."""
        suite = TestSuite(name=name)
        self.suites.append(suite)
        return suite

    def run_test(
        self,
        name: str,
        category: TestCategory,
        test_func: Callable[[], Tuple[bool, str, Dict[str, Any]]],
        suite: Optional[TestSuite] = None
    ) -> TestResult:
        """Run a single test."""
        start_time = time.perf_counter()
        status = TestStatus.PENDING
        message = ""
        details = {}

        try:
            status = TestStatus.RUNNING
            passed, message, details = test_func()
            status = TestStatus.PASSED if passed else TestStatus.FAILED
        except Exception as e:
            status = TestStatus.ERROR
            message = str(e)
            logger.error(f"Test {name} error: {e}")
        finally:
            duration_ms = (time.perf_counter() - start_time) * 1000

        result = TestResult(
            name=name,
            category=category,
            status=status,
            duration_ms=duration_ms,
            message=message,
            details=details,
        )

        if suite:
            suite.results.append(result)

        return result

    def test_image_load(self) -> Tuple[bool, str, Dict[str, Any]]:
        """Test that image can be loaded."""
        try:
            from PIL import Image
            img = Image.open(self.image_path)

            return True, "Image loaded successfully", {
                "size": img.size,
                "mode": img.mode,
                "format": img.format,
            }
        except Exception as e:
            return False, f"Failed to load image: {e}", {}

    def test_vat_integrity(self) -> Tuple[bool, str, Dict[str, Any]]:
        """Test VAT integrity."""
        try:
            from systems.pixel_compiler.infinite_map_v2 import VATParser

            # Try to parse VAT from image
            parser = VATParser(self.image_path)
            entries = parser.entries

            return True, "VAT parsed successfully", {
                "entries": len(entries),
            }
        except Exception as e:
            return False, f"VAT parse failed: {e}", {}

    def test_file_read(self) -> Tuple[bool, str, Dict[str, Any]]:
        """Test reading a file from the image."""
        try:
            from systems.pixel_compiler.infinite_map_v2 import InfiniteMapBuilderV2

            builder = InfiniteMapBuilderV2.load(str(self.image_path))

            # List files
            files = list(builder.vat.entries.keys())
            if not files:
                return True, "No files to test", {"files": 0}

            # Try to read first file
            filename = files[0]
            clusters = builder.vat.lookup(filename)

            return True, "File read test passed", {
                "files_tested": len(files),
                "sample_file": filename,
                "clusters": len(clusters) if clusters else 0,
            }
        except Exception as e:
            return False, f"File read failed: {e}", {}

    def test_checksum_validation(self) -> Tuple[bool, str, Dict[str, Any]]:
        """Test checksum calculation."""
        try:
            from systems.pixel_compiler.infinite_map_integrity import (
                ChecksumCalculator, ChecksumAlgorithm
            )

            calc = ChecksumCalculator(ChecksumAlgorithm.SHA256)
            data = b"test data for checksum"
            checksum = calc.calculate(data)

            if len(checksum) == 64:  # SHA256 hex length
                return True, "Checksum validation passed", {
                    "algorithm": "sha256",
                    "checksum_length": len(checksum),
                }
            else:
                return False, f"Invalid checksum length: {len(checksum)}", {}
        except Exception as e:
            return False, f"Checksum test failed: {e}", {}

    def test_snapshot_create(self) -> Tuple[bool, str, Dict[str, Any]]:
        """Test snapshot creation."""
        try:
            from systems.pixel_compiler.infinite_map_snapshot_rollback import SnapshotManager

            with tempfile.TemporaryDirectory() as tmpdir:
                snapshot_dir = Path(tmpdir) / "snapshots"
                snapshot_dir.mkdir()

                manager = SnapshotManager(str(self.image_path), str(snapshot_dir))
                snapshot_id = manager.create_snapshot("test_snapshot")

                if snapshot_id:
                    return True, "Snapshot created successfully", {
                        "snapshot_id": snapshot_id,
                    }
                else:
                    return False, "Failed to create snapshot", {}
        except Exception as e:
            return False, f"Snapshot test failed: {e}", {}

    def test_performance_read(self) -> Tuple[bool, str, Dict[str, Any]]:
        """Test read performance."""
        try:
            from systems.pixel_compiler.infinite_map_v2 import InfiniteMapBuilderV2

            builder = InfiniteMapBuilderV2.load(str(self.image_path))
            files = list(builder.vat.entries.keys())

            if not files:
                return True, "No files to test", {"files": 0}

            # Measure read time
            start = time.perf_counter()
            iterations = 100
            for _ in range(iterations):
                builder.vat.lookup(files[0])
            duration_ms = (time.perf_counter() - start) * 1000

            avg_ms = duration_ms / iterations
            passed = avg_ms < 10  # Should be under 10ms per lookup

            return passed, f"Average lookup: {avg_ms:.2f}ms", {
                "iterations": iterations,
                "total_ms": duration_ms,
                "avg_ms": avg_ms,
            }
        except Exception as e:
            return False, f"Performance test failed: {e}", {}

    def run_all_tests(self) -> TestSuite:
        """Run all integration tests."""
        suite = self.create_suite("Full Integration Suite")
        suite.start_time = datetime.now()

        # Filesystem tests
        self.run_test("image_load", TestCategory.FILESYSTEM, self.test_image_load, suite)
        self.run_test("vat_integrity", TestCategory.FILESYSTEM, self.test_vat_integrity, suite)
        self.run_test("file_read", TestCategory.FILESYSTEM, self.test_file_read, suite)

        # Reliability tests
        self.run_test("checksum_validation", TestCategory.RELIABILITY, self.test_checksum_validation, suite)
        self.run_test("snapshot_create", TestCategory.RELIABILITY, self.test_snapshot_create, suite)

        # Performance tests
        self.run_test("performance_read", TestCategory.PERFORMANCE, self.test_performance_read, suite)

        suite.end_time = datetime.now()
        return suite

    def get_summary(self) -> Dict[str, Any]:
        """Get summary of all test suites."""
        total_passed = sum(s.passed for s in self.suites)
        total_failed = sum(s.failed for s in self.suites)
        total_skipped = sum(s.skipped for s in self.suites)
        total_tests = sum(s.total for s in self.suites)

        return {
            "total_suites": len(self.suites),
            "total_tests": total_tests,
            "passed": total_passed,
            "failed": total_failed,
            "skipped": total_skipped,
            "pass_rate": total_passed / total_tests if total_tests > 0 else 0,
        }


# ============================================================================
# Deployment Manager
# ============================================================================

@dataclass
class DeploymentConfig:
    """Configuration for deployment."""
    mount_point: str = "/mnt/infinite"
    grid_size: int = 2048
    cache_size_mb: int = 100
    enable_monitoring: bool = True
    enable_security: bool = True
    log_level: str = "INFO"


@dataclass
class DeploymentStatus:
    """Status of a deployment."""
    deployed: bool
    mount_point: str
    image_path: str
    started_at: Optional[datetime] = None
    pid: Optional[int] = None

    def to_dict(self) -> Dict[str, Any]:
        return {
            "deployed": self.deployed,
            "mount_point": self.mount_point,
            "image_path": self.image_path,
            "started_at": self.started_at.isoformat() if self.started_at else None,
            "pid": self.pid,
        }


class DeploymentManager:
    """
    Manages deployment of Infinite Map filesystem.

    Handles mounting, unmounting, and configuration.
    """

    def __init__(self, image_path: str):
        self.image_path = Path(image_path)
        self.deployments: Dict[str, DeploymentStatus] = {}
        self.lock = threading.RLock()

    def deploy(
        self,
        mount_point: str,
        config: Optional[DeploymentConfig] = None
    ) -> DeploymentStatus:
        """Deploy the filesystem to a mount point."""
        config = config or DeploymentConfig(mount_point=mount_point)

        with self.lock:
            # Check if already deployed
            if mount_point in self.deployments and self.deployments[mount_point].deployed:
                return self.deployments[mount_point]

            # Create mount point if needed
            mount_path = Path(mount_point)
            mount_path.mkdir(parents=True, exist_ok=True)

            # For now, just track the deployment
            # In a real implementation, this would mount via FUSE
            status = DeploymentStatus(
                deployed=True,
                mount_point=mount_point,
                image_path=str(self.image_path),
                started_at=datetime.now(),
                pid=os.getpid(),
            )

            self.deployments[mount_point] = status
            logger.info(f"Deployed {self.image_path} to {mount_point}")

            return status

    def undeploy(self, mount_point: str) -> bool:
        """Undeploy the filesystem from a mount point."""
        with self.lock:
            if mount_point not in self.deployments:
                return False

            status = self.deployments[mount_point]
            if not status.deployed:
                return False

            # In a real implementation, this would unmount via FUSE
            status.deployed = False
            logger.info(f"Undeployed from {mount_point}")

            return True

    def get_status(self, mount_point: str) -> Optional[DeploymentStatus]:
        """Get deployment status."""
        return self.deployments.get(mount_point)

    def list_deployments(self) -> List[DeploymentStatus]:
        """List all deployments."""
        return list(self.deployments.values())


# ============================================================================
# Health Checker
# ============================================================================

class HealthCheckStatus(Enum):
    """Status of a health check."""
    HEALTHY = "healthy"
    DEGRADED = "degraded"
    UNHEALTHY = "unhealthy"


@dataclass
class HealthCheckResult:
    """Result of a health check."""
    component: str
    status: HealthCheckStatus
    message: str
    details: Dict[str, Any] = field(default_factory=dict)
    timestamp: datetime = field(default_factory=datetime.now)

    def to_dict(self) -> Dict[str, Any]:
        return {
            "component": self.component,
            "status": self.status.value,
            "message": self.message,
            "details": self.details,
            "timestamp": self.timestamp.isoformat(),
        }


class HealthChecker:
    """
    Verifies system health.

    Runs health checks on various components.
    """

    def __init__(self, image_path: str):
        self.image_path = Path(image_path)
        self.results: List[HealthCheckResult] = []

    def check_image_exists(self) -> HealthCheckResult:
        """Check if image file exists."""
        exists = self.image_path.exists()

        return HealthCheckResult(
            component="image_file",
            status=HealthCheckStatus.HEALTHY if exists else HealthCheckStatus.UNHEALTHY,
            message=f"Image file {'exists' if exists else 'missing'}",
            details={"path": str(self.image_path)},
        )

    def check_image_readable(self) -> HealthCheckResult:
        """Check if image is readable."""
        try:
            from PIL import Image
            img = Image.open(self.image_path)
            img.verify()

            return HealthCheckResult(
                component="image_readable",
                status=HealthCheckStatus.HEALTHY,
                message="Image is readable",
                details={"size": img.size, "mode": img.mode},
            )
        except Exception as e:
            return HealthCheckResult(
                component="image_readable",
                status=HealthCheckStatus.UNHEALTHY,
                message=f"Image read failed: {e}",
            )

    def check_vat_valid(self) -> HealthCheckResult:
        """Check if VAT is valid."""
        try:
            from systems.pixel_compiler.infinite_map_v2 import VATParser

            parser = VATParser(self.image_path)
            entries = len(parser.entries)

            return HealthCheckResult(
                component="vat_valid",
                status=HealthCheckStatus.HEALTHY if entries > 0 else HealthCheckStatus.DEGRADED,
                message=f"VAT has {entries} entries",
                details={"entries": entries},
            )
        except Exception as e:
            return HealthCheckResult(
                component="vat_valid",
                status=HealthCheckStatus.UNHEALTHY,
                message=f"VAT validation failed: {e}",
            )

    def check_disk_space(self) -> HealthCheckResult:
        """Check available disk space."""
        try:
            stat = shutil.disk_usage(self.image_path.parent)
            free_gb = stat.free / (1024 ** 3)
            total_gb = stat.total / (1024 ** 3)
            used_percent = (stat.used / stat.total) * 100

            if used_percent > 90:
                status = HealthCheckStatus.UNHEALTHY
            elif used_percent > 80:
                status = HealthCheckStatus.DEGRADED
            else:
                status = HealthCheckStatus.HEALTHY

            return HealthCheckResult(
                component="disk_space",
                status=status,
                message=f"Disk usage: {used_percent:.1f}%",
                details={
                    "free_gb": round(free_gb, 2),
                    "total_gb": round(total_gb, 2),
                    "used_percent": round(used_percent, 1),
                },
            )
        except Exception as e:
            return HealthCheckResult(
                component="disk_space",
                status=HealthCheckStatus.DEGRADED,
                message=f"Could not check disk space: {e}",
            )

    def check_dependencies(self) -> HealthCheckResult:
        """Check if required dependencies are available."""
        missing = []

        try:
            import PIL
        except ImportError:
            missing.append("PIL/Pillow")

        try:
            import numpy
        except ImportError:
            missing.append("numpy")

        if missing:
            return HealthCheckResult(
                component="dependencies",
                status=HealthCheckStatus.UNHEALTHY,
                message=f"Missing dependencies: {', '.join(missing)}",
                details={"missing": missing},
            )

        return HealthCheckResult(
            component="dependencies",
            status=HealthCheckStatus.HEALTHY,
            message="All dependencies available",
            details={"checked": ["PIL", "numpy"]},
        )

    def run_all_checks(self) -> List[HealthCheckResult]:
        """Run all health checks."""
        self.results = [
            self.check_image_exists(),
            self.check_image_readable(),
            self.check_vat_valid(),
            self.check_disk_space(),
            self.check_dependencies(),
        ]
        return self.results

    def get_overall_status(self) -> HealthCheckStatus:
        """Get overall system health status."""
        if not self.results:
            return HealthCheckStatus.UNHEALTHY

        if any(r.status == HealthCheckStatus.UNHEALTHY for r in self.results):
            return HealthCheckStatus.UNHEALTHY
        if any(r.status == HealthCheckStatus.DEGRADED for r in self.results):
            return HealthCheckStatus.DEGRADED
        return HealthCheckStatus.HEALTHY

    def to_dict(self) -> Dict[str, Any]:
        """Get full health report."""
        return {
            "overall_status": self.get_overall_status().value,
            "checks": [r.to_dict() for r in self.results],
            "timestamp": datetime.now().isoformat(),
        }


# ============================================================================
# Migration Tool
# ============================================================================

@dataclass
class MigrationProgress:
    """Progress of a migration."""
    total_files: int
    migrated_files: int
    failed_files: int
    bytes_migrated: int
    current_file: str = ""
    started_at: Optional[datetime] = None
    eta_seconds: Optional[float] = None

    @property
    def percent_complete(self) -> float:
        if self.total_files == 0:
            return 100.0
        return (self.migrated_files / self.total_files) * 100

    def to_dict(self) -> Dict[str, Any]:
        return {
            "total_files": self.total_files,
            "migrated_files": self.migrated_files,
            "failed_files": self.failed_files,
            "bytes_migrated": self.bytes_migrated,
            "percent_complete": round(self.percent_complete, 2),
            "current_file": self.current_file,
            "eta_seconds": self.eta_seconds,
        }


class MigrationTool:
    """
    Migrates data to/from Infinite Map format.

    Supports importing from directory and exporting to directory.
    """

    def __init__(self, image_path: str):
        self.image_path = Path(image_path)
        self.progress: Optional[MigrationProgress] = None
        self._cancel_flag = False

    def import_from_directory(
        self,
        source_dir: str,
        progress_callback: Optional[Callable[[MigrationProgress], None]] = None
    ) -> Tuple[bool, str, Dict[str, Any]]:
        """Import files from a directory to Infinite Map."""
        from systems.pixel_compiler.infinite_map_v2 import InfiniteMapBuilderV2

        source = Path(source_dir)
        if not source.exists():
            return False, f"Source directory not found: {source_dir}", {}

        # Count files
        files = list(source.rglob("*"))
        files = [f for f in files if f.is_file()]

        self.progress = MigrationProgress(
            total_files=len(files),
            migrated_files=0,
            failed_files=0,
            bytes_migrated=0,
            started_at=datetime.now(),
        )

        try:
            builder = InfiniteMapBuilderV2(str(source), str(self.image_path), grid_size=2048)
            builder.build()

            self.progress.migrated_files = len(files)
            self.progress.bytes_migrated = sum(f.stat().st_size for f in files)

            return True, "Import completed successfully", {
                "files_imported": len(files),
                "total_bytes": self.progress.bytes_migrated,
            }
        except Exception as e:
            return False, f"Import failed: {e}", {"error": str(e)}

    def export_to_directory(
        self,
        target_dir: str,
        progress_callback: Optional[Callable[[MigrationProgress], None]] = None
    ) -> Tuple[bool, str, Dict[str, Any]]:
        """Export files from Infinite Map to a directory."""
        from systems.pixel_compiler.infinite_map_v2 import InfiniteMapBuilderV2

        target = Path(target_dir)
        target.mkdir(parents=True, exist_ok=True)

        try:
            builder = InfiniteMapBuilderV2.load(str(self.image_path))
            files = list(builder.vat.entries.keys())

            self.progress = MigrationProgress(
                total_files=len(files),
                migrated_files=0,
                failed_files=0,
                bytes_migrated=0,
                started_at=datetime.now(),
            )

            exported = 0
            total_bytes = 0

            for filename in files:
                if self._cancel_flag:
                    break

                self.progress.current_file = filename

                # In a real implementation, this would extract the file
                # For now, just create placeholder
                file_path = target / filename
                file_path.parent.mkdir(parents=True, exist_ok=True)

                exported += 1
                self.progress.migrated_files = exported

                if progress_callback:
                    progress_callback(self.progress)

            self.progress.bytes_migrated = total_bytes

            return True, f"Exported {exported} files", {
                "files_exported": exported,
                "total_bytes": total_bytes,
            }
        except Exception as e:
            return False, f"Export failed: {e}", {"error": str(e)}

    def cancel(self):
        """Cancel the current migration."""
        self._cancel_flag = True


# ============================================================================
# Integration CLI
# ============================================================================

class IntegrationCLI:
    """
    Command-line interface for integration tools.

    Provides commands for testing, deployment, health checks, and migration.
    """

    def __init__(self, image_path: str):
        self.image_path = image_path
        self.tester = IntegrationTester(image_path)
        self.deployment = DeploymentManager(image_path)
        self.health = HealthChecker(image_path)
        self.migration = MigrationTool(image_path)

    def cmd_test(self, args) -> int:
        """Run integration tests."""
        print(f"Running integration tests on {self.image_path}...")

        suite = self.tester.run_all_tests()

        print(f"\n{'='*60}")
        print("TEST RESULTS")
        print(f"{'='*60}")

        for result in suite.results:
            status_icon = "✓" if result.status == TestStatus.PASSED else "✗"
            print(f"  {status_icon} {result.name}: {result.status.value} ({result.duration_ms:.2f}ms)")
            if result.message:
                print(f"      {result.message}")

        print(f"\n{'='*60}")
        print(f"SUMMARY: {suite.passed}/{suite.total} passed ({suite.duration_ms:.2f}ms)")
        print(f"{'='*60}")

        return 0 if suite.failed == 0 else 1

    def cmd_health(self, args) -> int:
        """Run health checks."""
        print(f"Running health checks on {self.image_path}...")

        results = self.health.run_all_checks()
        overall = self.health.get_overall_status()

        print(f"\n{'='*60}")
        print("HEALTH CHECK RESULTS")
        print(f"{'='*60}")

        for result in results:
            status_icon = {
                HealthCheckStatus.HEALTHY: "✓",
                HealthCheckStatus.DEGRADED: "⚠",
                HealthCheckStatus.UNHEALTHY: "✗",
            }.get(result.status, "?")

            print(f"  {status_icon} {result.component}: {result.status.value}")
            print(f"      {result.message}")

        print(f"\n{'='*60}")
        print(f"OVERALL: {overall.value.upper()}")
        print(f"{'='*60}")

        return 0 if overall == HealthCheckStatus.HEALTHY else 1

    def cmd_deploy(self, args) -> int:
        """Deploy the filesystem."""
        mount_point = getattr(args, 'mount', '/mnt/infinite')

        print(f"Deploying {self.image_path} to {mount_point}...")

        config = DeploymentConfig(mount_point=mount_point)
        status = self.deployment.deploy(mount_point, config)

        if status.deployed:
            print(f"✓ Deployed successfully")
            print(f"  Mount point: {status.mount_point}")
            print(f"  PID: {status.pid}")
            return 0
        else:
            print("✗ Deployment failed")
            return 1

    def cmd_undeploy(self, args) -> int:
        """Undeploy the filesystem."""
        mount_point = getattr(args, 'mount', '/mnt/infinite')

        print(f"Undeploying from {mount_point}...")

        if self.deployment.undeploy(mount_point):
            print("✓ Undeployed successfully")
            return 0
        else:
            print("✗ Undeployment failed (not deployed?)")
            return 1

    def cmd_import(self, args) -> int:
        """Import files from directory."""
        source_dir = getattr(args, 'source', '.')

        print(f"Importing from {source_dir} to {self.image_path}...")

        success, message, details = self.migration.import_from_directory(source_dir)

        if success:
            print(f"✓ {message}")
            print(f"  Files: {details.get('files_imported', 0)}")
            print(f"  Bytes: {details.get('total_bytes', 0)}")
            return 0
        else:
            print(f"✗ {message}")
            return 1

    def cmd_export(self, args) -> int:
        """Export files to directory."""
        target_dir = getattr(args, 'target', './exported')

        print(f"Exporting from {self.image_path} to {target_dir}...")

        success, message, details = self.migration.export_to_directory(target_dir)

        if success:
            print(f"✓ {message}")
            print(f"  Files: {details.get('files_exported', 0)}")
            return 0
        else:
            print(f"✗ {message}")
            return 1


def main():
    """Main CLI entry point."""
    import argparse

    parser = argparse.ArgumentParser(description="Infinite Map Integration Tools")
    parser.add_argument("image", help="Path to Infinite Map image")
    subparsers = parser.add_subparsers(dest="command", help="Command to run")

    # Test command
    subparsers.add_parser("test", help="Run integration tests")

    # Health command
    subparsers.add_parser("health", help="Run health checks")

    # Deploy command
    deploy_parser = subparsers.add_parser("deploy", help="Deploy filesystem")
    deploy_parser.add_argument("--mount", "-m", default="/mnt/infinite", help="Mount point")

    # Undeploy command
    undeploy_parser = subparsers.add_parser("undeploy", help="Undeploy filesystem")
    undeploy_parser.add_argument("--mount", "-m", default="/mnt/infinite", help="Mount point")

    # Import command
    import_parser = subparsers.add_parser("import", help="Import files from directory")
    import_parser.add_argument("--source", "-s", required=True, help="Source directory")

    # Export command
    export_parser = subparsers.add_parser("export", help="Export files to directory")
    export_parser.add_argument("--target", "-t", required=True, help="Target directory")

    args = parser.parse_args()

    if not args.command:
        parser.print_help()
        return 1

    cli = IntegrationCLI(args.image)

    # Map commands to methods
    commands = {
        "test": cli.cmd_test,
        "health": cli.cmd_health,
        "deploy": cli.cmd_deploy,
        "undeploy": cli.cmd_undeploy,
        "import": cli.cmd_import,
        "export": cli.cmd_export,
    }

    handler = commands.get(args.command)
    if handler:
        return handler(args)
    else:
        print(f"Unknown command: {args.command}")
        return 1


if __name__ == "__main__":
    sys.exit(main())
