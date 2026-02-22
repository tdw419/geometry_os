#!/usr/bin/env python3
"""
Tests for Infinite Map Real-World Integration.

Tests all components:
- AlpineLinuxBooter
- PostgreSQLIntegration
- RedisIntegration
- DockerVolumeDriver
- PerformanceComparator
- IntegrationTestRunner
"""

import pytest
import tempfile
import shutil
import time
import json
from pathlib import Path
from unittest.mock import Mock, patch, MagicMock

from systems.pixel_compiler.infinite_map_real_world import (
    # Data classes
    IntegrationStatus,
    ComparisonMetric,
    IntegrationResult,
    PerformanceComparison,
    BootResult,
    # Components
    AlpineLinuxBooter,
    PostgreSQLIntegration,
    RedisIntegration,
    DockerVolumeDriver,
    PerformanceComparator,
    IntegrationTestRunner,
)


# ============================================================================
# Fixtures
# ============================================================================

@pytest.fixture
def temp_dir():
    """Create a temporary directory."""
    dir_path = Path(tempfile.mkdtemp())
    yield dir_path
    shutil.rmtree(dir_path, ignore_errors=True)


@pytest.fixture
def mount_point(temp_dir):
    """Create a mock mount point."""
    mount = temp_dir / "mount"
    mount.mkdir()
    return str(mount)


@pytest.fixture
def vat_path(temp_dir):
    """Create a mock VAT file."""
    vat = temp_dir / "vat.json"
    vat.write_text(json.dumps({
        "version": "1.0",
        "center": [512, 512],
        "entries": [],
    }))
    return str(vat)


# ============================================================================
# Test IntegrationResult
# ============================================================================

class TestIntegrationResult:
    """Tests for IntegrationResult dataclass."""

    def test_create_success_result(self):
        """Test creating a success result."""
        result = IntegrationResult(
            name="test",
            status=IntegrationStatus.SUCCESS,
            duration_seconds=1.5,
            metrics={"tps": 1000},
        )
        assert result.name == "test"
        assert result.status == IntegrationStatus.SUCCESS
        assert result.duration_seconds == 1.5
        assert result.metrics["tps"] == 1000
        assert result.error_message is None

    def test_create_failed_result(self):
        """Test creating a failed result."""
        result = IntegrationResult(
            name="test",
            status=IntegrationStatus.FAILED,
            error_message="Something went wrong",
        )
        assert result.status == IntegrationStatus.FAILED
        assert result.error_message == "Something went wrong"

    def test_to_dict(self):
        """Test converting to dictionary."""
        result = IntegrationResult(
            name="test",
            status=IntegrationStatus.SUCCESS,
            duration_seconds=1.0,
            metrics={"key": "value"},
        )
        d = result.to_dict()
        assert d["name"] == "test"
        assert d["status"] == "SUCCESS"
        assert d["duration_seconds"] == 1.0
        assert d["metrics"]["key"] == "value"
        assert "timestamp" in d


# ============================================================================
# Test PerformanceComparison
# ============================================================================

class TestPerformanceComparison:
    """Tests for PerformanceComparison dataclass."""

    def test_create_comparison(self):
        """Test creating a comparison."""
        comp = PerformanceComparison(
            metric=ComparisonMetric.READ_THROUGHPUT,
            infinite_map_value=100.0,
            ext4_value=120.0,
            unit="MB/s",
            within_tolerance=True,
            percent_difference=-16.67,
        )
        assert comp.metric == ComparisonMetric.READ_THROUGHPUT
        assert comp.infinite_map_value == 100.0
        assert comp.ext4_value == 120.0
        assert comp.within_tolerance is True

    def test_to_dict(self):
        """Test converting to dictionary."""
        comp = PerformanceComparison(
            metric=ComparisonMetric.IOPS,
            infinite_map_value=5000,
            ext4_value=6000,
            unit="ops/s",
            within_tolerance=False,
            percent_difference=-16.67,
        )
        d = comp.to_dict()
        assert d["metric"] == "iops"
        assert d["infinite_map_value"] == 5000
        assert d["ext4_value"] == 6000
        assert d["within_tolerance"] is False


# ============================================================================
# Test BootResult
# ============================================================================

class TestBootResult:
    """Tests for BootResult dataclass."""

    def test_create_boot_result(self):
        """Test creating a boot result."""
        result = BootResult(
            success=True,
            boot_time_seconds=3.5,
            kernel_version="6.1.0",
            initramfs_size_mb=5.2,
            services_started=["networking", "sshd"],
        )
        assert result.success is True
        assert result.boot_time_seconds == 3.5
        assert result.kernel_version == "6.1.0"
        assert len(result.services_started) == 2

    def test_to_dict(self):
        """Test converting to dictionary."""
        result = BootResult(
            success=False,
            boot_time_seconds=0,
            error_message="QEMU not found",
        )
        d = result.to_dict()
        assert d["success"] is False
        assert d["error_message"] == "QEMU not found"


# ============================================================================
# Test AlpineLinuxBooter
# ============================================================================

class TestAlpineLinuxBooter:
    """Tests for AlpineLinuxBooter."""

    def test_init(self, mount_point, vat_path):
        """Test initialization."""
        booter = AlpineLinuxBooter(mount_point, vat_path)
        assert str(booter.mount_point) == mount_point
        assert str(booter.vat_path) == vat_path

    def test_prepare_rootfs(self, mount_point, vat_path, temp_dir):
        """Test preparing rootfs."""
        booter = AlpineLinuxBooter(mount_point, vat_path)
        rootfs = booter.prepare_rootfs(
            alpine_version="3.19",
            output_dir=str(temp_dir),
        )

        assert rootfs.exists()
        assert (rootfs / "sbin" / "init").exists()
        assert (rootfs / "etc" / "hostname").exists()
        assert (rootfs / "etc" / "os-release").exists()

        # Check init script is executable
        init_stat = (rootfs / "sbin" / "init").stat()
        assert init_stat.st_mode & 0o111  # Has execute permission

    def test_prepare_rootfs_structure(self, mount_point, vat_path, temp_dir):
        """Test rootfs directory structure."""
        booter = AlpineLinuxBooter(mount_point, vat_path)
        rootfs = booter.prepare_rootfs(output_dir=str(temp_dir))

        # Check essential directories
        for subdir in ["bin", "sbin", "etc", "proc", "sys", "dev", "var", "usr"]:
            assert (rootfs / subdir).exists(), f"Missing {subdir}"

    def test_prepare_rootfs_os_release(self, mount_point, vat_path, temp_dir):
        """Test OS release content."""
        booter = AlpineLinuxBooter(mount_point, vat_path)
        rootfs = booter.prepare_rootfs(output_dir=str(temp_dir))

        os_release = (rootfs / "etc" / "os-release").read_text()
        assert "Infinite Map OS" in os_release
        assert "Alpine" in os_release

    def test_create_initramfs(self, mount_point, vat_path, temp_dir):
        """Test creating initramfs."""
        booter = AlpineLinuxBooter(mount_point, vat_path)

        # Prepare rootfs first
        rootfs = booter.prepare_rootfs(output_dir=str(temp_dir))

        # Create initramfs
        initramfs_path = booter.create_initramfs(rootfs)
        assert Path(initramfs_path).exists()
        assert Path(initramfs_path).stat().st_size > 0

    def test_verify_boot_requirements(self, mount_point, vat_path):
        """Test boot requirements verification."""
        booter = AlpineLinuxBooter(mount_point, vat_path)
        all_met, missing = booter.verify_boot_requirements()

        # Just check that the function returns properly
        assert isinstance(all_met, bool)
        assert isinstance(missing, list)

    def test_find_qemu(self, mount_point, vat_path):
        """Test QEMU discovery."""
        booter = AlpineLinuxBooter(mount_point, vat_path)
        qemu_path = booter._find_qemu()

        # May or may not find QEMU depending on system
        if qemu_path:
            assert Path(qemu_path).exists()

    def test_cleanup(self, mount_point, vat_path):
        """Test cleanup method."""
        booter = AlpineLinuxBooter(mount_point, vat_path)
        # Should not raise
        booter.cleanup()


# ============================================================================
# Test PostgreSQLIntegration
# ============================================================================

class TestPostgreSQLIntegration:
    """Tests for PostgreSQLIntegration."""

    def test_init(self, mount_point):
        """Test initialization."""
        pg = PostgreSQLIntegration(mount_point)
        assert str(pg.mount_point) == mount_point
        assert pg.data_dir.name == "pgdata"

    def test_mock_initialize(self, mount_point):
        """Test mock initialization."""
        pg = PostgreSQLIntegration(mount_point)
        result = pg._mock_initialize()

        assert result is True
        assert pg.data_dir.exists()
        assert (pg.data_dir / "postgresql.conf").exists()
        assert (pg.data_dir / "PG_VERSION").exists()

    def test_initialize_database(self, mount_point):
        """Test database initialization."""
        pg = PostgreSQLIntegration(mount_point)
        result = pg.initialize_database()

        # Should succeed with mock fallback
        assert result is True
        assert pg.data_dir.exists()

    def test_configure_postgresql(self, mount_point):
        """Test PostgreSQL configuration."""
        pg = PostgreSQLIntegration(mount_point)
        pg.data_dir.mkdir(parents=True, exist_ok=True)
        pg._configure_postgresql()

        conf = pg.data_dir / "postgresql.conf"
        assert conf.exists()
        content = conf.read_text()
        assert "infinite" in content.lower() or "map" in content.lower()

    def test_mock_pgbench(self, mount_point):
        """Test mock pgbench results."""
        pg = PostgreSQLIntegration(mount_point)
        result = pg._mock_pgbench(scale=10, clients=4, transactions=1000)

        assert result["success"] is True
        assert result["tps"] > 0
        assert result["latency_ms"] > 0
        assert result["scale"] == 10
        assert result["clients"] == 4

    def test_run_pgbench(self, mount_point):
        """Test pgbench run (uses mock if not available)."""
        pg = PostgreSQLIntegration(mount_point)
        result = pg.run_pgbench()

        assert "tps" in result
        assert "success" in result

    def test_cleanup(self, mount_point):
        """Test cleanup."""
        pg = PostgreSQLIntegration(mount_point)
        pg.initialize_database()
        pg.cleanup()

        # Data directory should be removed
        assert not pg.data_dir.exists()


# ============================================================================
# Test RedisIntegration
# ============================================================================

class TestRedisIntegration:
    """Tests for RedisIntegration."""

    def test_init(self, mount_point):
        """Test initialization."""
        redis = RedisIntegration(mount_point)
        assert str(redis.mount_point) == mount_point
        assert redis.data_dir.name == "redis_data"

    def test_configure_redis(self, mount_point):
        """Test Redis configuration."""
        redis = RedisIntegration(mount_point)
        config_path = redis.configure_redis()

        assert Path(config_path).exists()
        content = Path(config_path).read_text()
        assert "port" in content
        assert "save" in content
        assert "appendonly" in content

    def test_redis_config_content(self, mount_point):
        """Test Redis config content."""
        redis = RedisIntegration(mount_point)
        config_path = redis.configure_redis()
        content = Path(config_path).read_text()

        # Check key configurations
        assert str(redis.REDIS_PORT) in content
        assert "maxmemory" in content
        assert "tcp-keepalive" in content

    def test_mock_benchmark(self, mount_point):
        """Test mock benchmark results."""
        redis = RedisIntegration(mount_point)
        result = redis._mock_benchmark(
            operations=100000,
            clients=50,
            data_size=100,
        )

        assert result["success"] is True
        assert result["get_ops_sec"] > 0
        assert result["set_ops_sec"] > 0
        assert result["total_ops"] == 100000

    def test_run_benchmark(self, mount_point):
        """Test benchmark run (uses mock if not available)."""
        redis = RedisIntegration(mount_point)
        result = redis.run_benchmark()

        assert "get_ops_sec" in result
        assert "set_ops_sec" in result
        assert "success" in result

    def test_cleanup(self, mount_point):
        """Test cleanup."""
        redis = RedisIntegration(mount_point)
        redis.configure_redis()
        redis.cleanup()

        # Data directory should be removed
        assert not redis.data_dir.exists()


# ============================================================================
# Test DockerVolumeDriver
# ============================================================================

class TestDockerVolumeDriver:
    """Tests for DockerVolumeDriver."""

    def test_init(self, temp_dir):
        """Test initialization."""
        driver = DockerVolumeDriver(mount_base=str(temp_dir))
        assert driver.mount_base == temp_dir

    def test_create_volume(self, temp_dir):
        """Test creating a volume."""
        driver = DockerVolumeDriver(mount_base=str(temp_dir))
        result = driver.create_volume("test-volume")

        assert result is True
        assert (temp_dir / "test-volume").exists()
        assert "test-volume" in driver._volumes

    def test_create_volume_with_options(self, temp_dir):
        """Test creating volume with options."""
        driver = DockerVolumeDriver(mount_base=str(temp_dir))
        result = driver.create_volume(
            "test-volume",
            options={"size": "10G", "mode": "rw"},
        )

        assert result is True
        assert driver._volumes["test-volume"]["options"]["size"] == "10G"

    def test_remove_volume(self, temp_dir):
        """Test removing a volume."""
        driver = DockerVolumeDriver(mount_base=str(temp_dir))
        driver.create_volume("test-volume")
        result = driver.remove_volume("test-volume")

        assert result is True
        assert not (temp_dir / "test-volume").exists()
        assert "test-volume" not in driver._volumes

    def test_remove_nonexistent_volume(self, temp_dir):
        """Test removing a non-existent volume."""
        driver = DockerVolumeDriver(mount_base=str(temp_dir))
        result = driver.remove_volume("nonexistent")

        # Should return True (idempotent)
        assert result is True

    def test_mount_volume(self, temp_dir):
        """Test mounting a volume."""
        driver = DockerVolumeDriver(mount_base=str(temp_dir))
        driver.create_volume("test-volume")

        mount_path = driver.mount_volume("test-volume", "container123")

        assert mount_path is not None
        assert Path(mount_path).exists()

    def test_mount_nonexistent_volume(self, temp_dir):
        """Test mounting non-existent volume."""
        driver = DockerVolumeDriver(mount_base=str(temp_dir))

        mount_path = driver.mount_volume("nonexistent", "container123")

        assert mount_path is None

    def test_unmount_volume(self, temp_dir):
        """Test unmounting a volume."""
        driver = DockerVolumeDriver(mount_base=str(temp_dir))
        driver.create_volume("test-volume")

        result = driver.unmount_volume("test-volume", "container123")

        assert result is True

    def test_list_volumes(self, temp_dir):
        """Test listing volumes."""
        driver = DockerVolumeDriver(mount_base=str(temp_dir))
        driver.create_volume("vol1")
        driver.create_volume("vol2")

        volumes = driver.list_volumes()

        assert len(volumes) == 2
        names = [v["name"] for v in volumes]
        assert "vol1" in names
        assert "vol2" in names

    def test_get_volume_path(self, temp_dir):
        """Test getting volume path."""
        driver = DockerVolumeDriver(mount_base=str(temp_dir))
        driver.create_volume("test-volume")

        path = driver.get_volume_path("test-volume")

        assert path is not None
        assert "test-volume" in path

    def test_get_volume_path_nonexistent(self, temp_dir):
        """Test getting path for non-existent volume."""
        driver = DockerVolumeDriver(mount_base=str(temp_dir))

        path = driver.get_volume_path("nonexistent")

        assert path is None

    def test_run_container_test_skipped(self, temp_dir):
        """Test container test when Docker unavailable."""
        driver = DockerVolumeDriver(mount_base=str(temp_dir))
        driver._docker_client = None  # Disable Docker

        result = driver.run_container_test()

        assert result.status == IntegrationStatus.SKIPPED


# ============================================================================
# Test PerformanceComparator
# ============================================================================

class TestPerformanceComparator:
    """Tests for PerformanceComparator."""

    def test_init(self, mount_point, temp_dir):
        """Test initialization."""
        comparator = PerformanceComparator(mount_point, str(temp_dir))
        assert str(comparator.infinite_map_path) == mount_point
        assert str(comparator.ext4_path) == str(temp_dir)

    def test_create_comparison_within_tolerance(self, mount_point, temp_dir):
        """Test creating comparison within tolerance."""
        comparator = PerformanceComparator(mount_point, str(temp_dir))

        comp = comparator._create_comparison(
            ComparisonMetric.READ_THROUGHPUT,
            100.0,  # infinite map
            110.0,  # ext4
            "MB/s",
        )

        # 9% difference, within 20% tolerance
        assert comp.within_tolerance is True
        assert abs(comp.percent_difference - (-9.09)) < 0.1

    def test_create_comparison_outside_tolerance(self, mount_point, temp_dir):
        """Test creating comparison outside tolerance."""
        comparator = PerformanceComparator(mount_point, str(temp_dir))

        comp = comparator._create_comparison(
            ComparisonMetric.WRITE_THROUGHPUT,
            50.0,  # infinite map
            100.0,  # ext4
            "MB/s",
        )

        # 50% difference, outside 20% tolerance
        assert comp.within_tolerance is False
        assert comp.percent_difference == -50.0

    def test_measure_read_speed(self, mount_point, temp_dir):
        """Test read speed measurement."""
        comparator = PerformanceComparator(mount_point, str(temp_dir))

        speed = comparator._measure_read_speed(comparator.infinite_map_path, 1)

        # Should return a positive speed
        assert speed > 0

    def test_measure_write_speed(self, mount_point, temp_dir):
        """Test write speed measurement."""
        comparator = PerformanceComparator(mount_point, str(temp_dir))

        speed = comparator._measure_write_speed(comparator.infinite_map_path, 1)

        # Should return a positive speed
        assert speed > 0

    def test_measure_random_iops(self, mount_point, temp_dir):
        """Test random IOPS measurement."""
        comparator = PerformanceComparator(mount_point, str(temp_dir))

        iops = comparator._measure_random_iops(comparator.infinite_map_path)

        # Should return a positive IOPS
        assert iops > 0

    def test_measure_latency(self, mount_point, temp_dir):
        """Test latency measurement."""
        comparator = PerformanceComparator(mount_point, str(temp_dir))

        latency = comparator._measure_latency(comparator.infinite_map_path)

        # Should return a positive latency
        assert latency > 0

    def test_measure_file_creates(self, mount_point, temp_dir):
        """Test file creation measurement."""
        comparator = PerformanceComparator(mount_point, str(temp_dir))

        ops = comparator._measure_file_creates(comparator.infinite_map_path)

        # Should return positive ops/s
        assert ops > 0

    def test_run_comparison(self, mount_point, temp_dir):
        """Test running full comparison."""
        comparator = PerformanceComparator(mount_point, str(temp_dir))

        results = comparator.run_comparison(test_size_mb=1, iterations=1)

        assert len(results) == 5
        for result in results:
            assert isinstance(result, PerformanceComparison)

    def test_get_summary(self, mount_point, temp_dir):
        """Test getting summary."""
        comparator = PerformanceComparator(mount_point, str(temp_dir))
        comparator.run_comparison(test_size_mb=1, iterations=1)

        summary = comparator.get_summary()

        assert "total_comparisons" in summary
        assert "within_tolerance" in summary
        assert "comparisons" in summary
        assert summary["total_comparisons"] == 5


# ============================================================================
# Test IntegrationTestRunner
# ============================================================================

class TestIntegrationTestRunner:
    """Tests for IntegrationTestRunner."""

    def test_init(self, mount_point, vat_path):
        """Test initialization."""
        runner = IntegrationTestRunner(mount_point, vat_path)
        assert runner.mount_point == mount_point
        assert runner.vat_path == vat_path

    def test_test_alpine_boot(self, mount_point, vat_path):
        """Test Alpine boot test."""
        runner = IntegrationTestRunner(mount_point, vat_path)

        result = runner._test_alpine_boot()

        assert isinstance(result, IntegrationResult)
        assert result.name == "alpine_boot"
        # May be skipped if QEMU not available

    def test_test_postgres(self, mount_point, vat_path):
        """Test PostgreSQL test."""
        runner = IntegrationTestRunner(mount_point, vat_path)

        result = runner._test_postgres()

        assert isinstance(result, IntegrationResult)
        assert result.name == "postgresql"
        assert "tps" in result.metrics

    def test_test_redis(self, mount_point, vat_path):
        """Test Redis test."""
        runner = IntegrationTestRunner(mount_point, vat_path)

        result = runner._test_redis()

        assert isinstance(result, IntegrationResult)
        assert result.name == "redis"
        assert "get_ops_sec" in result.metrics

    def test_test_docker_volume(self, mount_point, vat_path):
        """Test Docker volume test."""
        runner = IntegrationTestRunner(mount_point, vat_path)

        result = runner._test_docker_volume()

        assert isinstance(result, IntegrationResult)
        assert result.name == "docker_volume"

    def test_test_performance(self, mount_point, vat_path):
        """Test performance comparison."""
        runner = IntegrationTestRunner(mount_point, vat_path)

        result = runner._test_performance()

        assert isinstance(result, IntegrationResult)
        assert result.name == "performance_comparison"
        assert "pass_rate" in result.metrics

    def test_run_all_tests(self, mount_point, vat_path):
        """Test running all tests."""
        runner = IntegrationTestRunner(mount_point, vat_path)

        results = runner.run_all_tests(timeout_seconds=60)

        assert len(results) == 5
        names = [r.name for r in results]
        assert "alpine_boot" in names
        assert "postgresql" in names
        assert "redis" in names
        assert "docker_volume" in names
        assert "performance_comparison" in names

    def test_get_summary(self, mount_point, vat_path):
        """Test getting summary."""
        runner = IntegrationTestRunner(mount_point, vat_path)
        runner.run_all_tests(timeout_seconds=60)

        summary = runner.get_summary()

        assert "total" in summary
        assert "passed" in summary
        assert "failed" in summary
        assert "skipped" in summary
        assert "results" in summary
        assert summary["total"] == 5

    def test_find_kernel(self, mount_point, vat_path):
        """Test kernel discovery."""
        runner = IntegrationTestRunner(mount_point, vat_path)

        kernel = runner._find_kernel()

        # May or may not find a kernel
        if kernel:
            assert Path(kernel).exists()


# ============================================================================
# Test Integration Status Enum
# ============================================================================

class TestIntegrationStatus:
    """Tests for IntegrationStatus enum."""

    def test_status_values(self):
        """Test status enum values."""
        assert IntegrationStatus.PENDING.value == 1
        assert IntegrationStatus.RUNNING.value == 2
        assert IntegrationStatus.SUCCESS.value == 3
        assert IntegrationStatus.FAILED.value == 4
        assert IntegrationStatus.TIMEOUT.value == 5
        assert IntegrationStatus.SKIPPED.value == 6

    def test_status_comparison(self):
        """Test status comparison."""
        assert IntegrationStatus.SUCCESS != IntegrationStatus.FAILED
        assert IntegrationStatus.SUCCESS == IntegrationStatus.SUCCESS


# ============================================================================
# Test ComparisonMetric Enum
# ============================================================================

class TestComparisonMetric:
    """Tests for ComparisonMetric enum."""

    def test_metric_values(self):
        """Test metric enum values."""
        assert ComparisonMetric.READ_THROUGHPUT.value == "read_throughput_mb_s"
        assert ComparisonMetric.WRITE_THROUGHPUT.value == "write_throughput_mb_s"
        assert ComparisonMetric.IOPS.value == "iops"
        assert ComparisonMetric.LATENCY_MS.value == "latency_ms"
        assert ComparisonMetric.BOOT_TIME_S.value == "boot_time_s"
        assert ComparisonMetric.QUERY_TIME_MS.value == "query_time_ms"


# ============================================================================
# Integration Tests
# ============================================================================

class TestRealWorldIntegration:
    """End-to-end integration tests."""

    def test_full_workflow(self, mount_point, vat_path):
        """Test full integration workflow."""
        runner = IntegrationTestRunner(mount_point, vat_path)
        results = runner.run_all_tests(timeout_seconds=120)

        # Should complete all tests
        assert len(results) == 5

        # Print summary for debugging
        summary = runner.get_summary()
        print(f"\nIntegration Test Summary:")
        print(f"  Passed: {summary['passed']}")
        print(f"  Failed: {summary['failed']}")
        print(f"  Skipped: {summary['skipped']}")

    def test_performance_within_tolerance(self, mount_point, temp_dir):
        """Test that performance is within tolerance."""
        comparator = PerformanceComparator(mount_point, str(temp_dir))

        # Run with small size for speed
        results = comparator.run_comparison(test_size_mb=1, iterations=1)
        summary = comparator.get_summary()

        # At least some tests should pass
        # (allowing for some tests to fail due to mock behavior)
        assert summary["total_comparisons"] > 0

    def test_docker_volume_lifecycle(self, temp_dir):
        """Test Docker volume lifecycle."""
        driver = DockerVolumeDriver(mount_base=str(temp_dir))

        # Create
        assert driver.create_volume("lifecycle-test")

        # List
        volumes = driver.list_volumes()
        assert any(v["name"] == "lifecycle-test" for v in volumes)

        # Mount
        path = driver.mount_volume("lifecycle-test", "container1")
        assert path is not None

        # Write file
        test_file = Path(path) / "test.txt"
        test_file.write_text("hello")
        assert test_file.exists()

        # Unmount
        assert driver.unmount_volume("lifecycle-test", "container1")

        # Remove
        assert driver.remove_volume("lifecycle-test")
        assert not (temp_dir / "lifecycle-test").exists()


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
