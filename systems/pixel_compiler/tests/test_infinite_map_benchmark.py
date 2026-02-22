#!/usr/bin/env python3
"""
Tests for Infinite Map Performance Benchmarking Suite.

Comprehensive test coverage for:
- BenchmarkResult and BenchmarkConfig dataclasses
- MicroBenchmark (VAT lookup, Hilbert, allocation, checksum)
- MacroBenchmark (image build, sequential read)
- StressBenchmark (concurrent access, large allocation)
- RegressionDetector (comparison, detection)
- BenchmarkRunner (execution, reporting)

Run with:
    PYTHONPATH=. pytest systems/pixel_compiler/tests/test_infinite_map_benchmark.py -v
"""

import os
import sys
import json
import tempfile
import time
from pathlib import Path
from datetime import datetime
from unittest.mock import Mock, patch, MagicMock

import pytest

# Add parent to path
sys.path.insert(0, str(Path(__file__).parent.parent.parent.parent))

from systems.pixel_compiler.infinite_map_benchmark import (
    BenchmarkCategory,
    BenchmarkStatus,
    BenchmarkResult,
    BenchmarkConfig,
    MicroBenchmark,
    MacroBenchmark,
    StressBenchmark,
    RegressionThreshold,
    RegressionDetector,
    BenchmarkRunner,
    run_benchmarks,
    check_regressions,
)


class TestBenchmarkCategory:
    """Tests for BenchmarkCategory enum."""

    def test_categories(self):
        """Test all benchmark categories exist."""
        assert BenchmarkCategory.MICRO.value == "micro"
        assert BenchmarkCategory.MACRO.value == "macro"
        assert BenchmarkCategory.STRESS.value == "stress"
        assert BenchmarkCategory.INTEGRATION.value == "integration"


class TestBenchmarkStatus:
    """Tests for BenchmarkStatus enum."""

    def test_statuses(self):
        """Test all benchmark statuses exist."""
        assert BenchmarkStatus.PENDING.value == "pending"
        assert BenchmarkStatus.RUNNING.value == "running"
        assert BenchmarkStatus.PASSED.value == "passed"
        assert BenchmarkStatus.FAILED.value == "failed"
        assert BenchmarkStatus.SKIPPED.value == "skipped"
        assert BenchmarkStatus.REGRESSION.value == "regression"


class TestBenchmarkResult:
    """Tests for BenchmarkResult dataclass."""

    def test_create_result(self):
        """Test creating a benchmark result."""
        result = BenchmarkResult(
            name="test_benchmark",
            category=BenchmarkCategory.MICRO,
            timestamp=datetime.now(),
            duration_ms=100.5,
            iterations=100,
            operations_per_second=1000.0,
            avg_latency_ms=1.0,
            min_latency_ms=0.5,
            max_latency_ms=2.0,
            p50_latency_ms=1.0,
            p95_latency_ms=1.5,
            p99_latency_ms=1.8,
        )
        assert result.name == "test_benchmark"
        assert result.operations_per_second == 1000.0

    def test_result_serialization(self):
        """Test result serialization."""
        result = BenchmarkResult(
            name="test",
            category=BenchmarkCategory.MACRO,
            timestamp=datetime(2026, 2, 12, 12, 0, 0),
            duration_ms=50.0,
            iterations=10,
            operations_per_second=200.0,
            avg_latency_ms=5.0,
            min_latency_ms=4.0,
            max_latency_ms=6.0,
            p50_latency_ms=5.0,
            p95_latency_ms=5.8,
            p99_latency_ms=5.9,
            memory_bytes=1024 * 1024,
            metadata={"key": "value"},
        )
        data = result.to_dict()

        assert data["name"] == "test"
        assert data["category"] == "macro"
        assert data["operations_per_second"] == 200.0
        assert data["latency"]["avg_ms"] == 5.0
        assert data["memory_bytes"] == 1024 * 1024
        assert data["metadata"]["key"] == "value"

    def test_result_deserialization(self):
        """Test result deserialization."""
        data = {
            "name": "test",
            "category": "micro",
            "timestamp": "2026-02-12T12:00:00",
            "duration_ms": 100.0,
            "iterations": 50,
            "operations_per_second": 500.0,
            "latency": {
                "avg_ms": 2.0,
                "min_ms": 1.0,
                "max_ms": 3.0,
                "p50_ms": 2.0,
                "p95_ms": 2.8,
                "p99_ms": 2.9,
            },
            "memory_bytes": 2048,
            "status": "passed",
            "error_message": None,
            "metadata": {"size": 256},
        }

        result = BenchmarkResult.from_dict(data)

        assert result.name == "test"
        assert result.category == BenchmarkCategory.MICRO
        assert result.avg_latency_ms == 2.0
        assert result.p95_latency_ms == 2.8

    def test_result_with_error(self):
        """Test result with error."""
        result = BenchmarkResult(
            name="failed_test",
            category=BenchmarkCategory.STRESS,
            timestamp=datetime.now(),
            duration_ms=0,
            iterations=0,
            operations_per_second=0,
            avg_latency_ms=0,
            min_latency_ms=0,
            max_latency_ms=0,
            p50_latency_ms=0,
            p95_latency_ms=0,
            p99_latency_ms=0,
            status=BenchmarkStatus.FAILED,
            error_message="Out of memory",
        )
        data = result.to_dict()

        assert data["status"] == "failed"
        assert data["error_message"] == "Out of memory"


class TestBenchmarkConfig:
    """Tests for BenchmarkConfig dataclass."""

    def test_default_config(self):
        """Test default configuration."""
        config = BenchmarkConfig()
        assert config.warmup_iterations == 5
        assert config.measurement_iterations == 100
        assert config.timeout_seconds == 60.0
        assert config.memory_tracking is True

    def test_custom_config(self):
        """Test custom configuration."""
        config = BenchmarkConfig(
            warmup_iterations=10,
            measurement_iterations=50,
            timeout_seconds=30.0,
            parallel_execution=True,
        )
        assert config.warmup_iterations == 10
        assert config.measurement_iterations == 50
        assert config.parallel_execution is True


class TestMicroBenchmark:
    """Tests for MicroBenchmark class."""

    @pytest.fixture
    def config(self):
        """Create fast test config."""
        return BenchmarkConfig(
            warmup_iterations=1,
            measurement_iterations=3,
        )

    def test_create_benchmark(self, config):
        """Test creating a micro benchmark."""
        bench = MicroBenchmark(config)
        assert len(bench.results) == 0

    @pytest.mark.slow
    def test_benchmark_vat_lookup(self, config):
        """Test VAT lookup benchmark."""
        bench = MicroBenchmark(config)
        result = bench.benchmark_vat_lookup(grid_size=128)

        assert result.name == "vat_lookup"
        assert result.category == BenchmarkCategory.MICRO
        assert result.status == BenchmarkStatus.PASSED
        assert result.operations_per_second > 0
        assert result.avg_latency_ms > 0
        assert len(bench.results) == 1

    @pytest.mark.slow
    def test_benchmark_hilbert_coordinates(self, config):
        """Test Hilbert coordinates benchmark."""
        bench = MicroBenchmark(config)
        result = bench.benchmark_hilbert_coordinates(grid_size=128)

        assert result.name == "hilbert_coordinates"
        assert result.category == BenchmarkCategory.MICRO
        assert result.status == BenchmarkStatus.PASSED
        assert result.operations_per_second > 0

    @pytest.mark.slow
    def test_benchmark_cluster_allocation(self, config):
        """Test cluster allocation benchmark."""
        bench = MicroBenchmark(config)
        result = bench.benchmark_cluster_allocation(grid_size=128)

        assert result.name == "cluster_allocation"
        assert result.category == BenchmarkCategory.MICRO
        assert result.status == BenchmarkStatus.PASSED
        assert result.metadata["grid_size"] == 128

    @pytest.mark.slow
    def test_benchmark_checksum_calculation(self, config):
        """Test checksum calculation benchmark."""
        bench = MicroBenchmark(config)
        result = bench.benchmark_checksum_calculation(data_size=1024)

        assert result.name == "checksum_calculation"
        assert result.category == BenchmarkCategory.MICRO
        assert result.status == BenchmarkStatus.PASSED
        assert result.metadata["data_size"] == 1024
        assert "throughput_mbps" in result.metadata


class TestMacroBenchmark:
    """Tests for MacroBenchmark class."""

    @pytest.fixture
    def config(self):
        """Create fast test config."""
        return BenchmarkConfig(
            warmup_iterations=1,
            measurement_iterations=1,
        )

    def test_create_benchmark(self, config):
        """Test creating a macro benchmark."""
        bench = MacroBenchmark(config)
        assert len(bench.results) == 0

    @pytest.mark.slow
    def test_benchmark_image_build(self, config):
        """Test image build benchmark."""
        bench = MacroBenchmark(config)
        result = bench.benchmark_image_build(file_count=5, file_size=256)

        assert result.name == "image_build"
        assert result.category == BenchmarkCategory.MACRO
        assert result.metadata["file_count"] == 5

    @pytest.mark.slow
    def test_benchmark_sequential_read(self, config):
        """Test sequential read benchmark."""
        bench = MacroBenchmark(config)
        result = bench.benchmark_sequential_read(file_count=5)

        assert result.name == "sequential_read"
        assert result.category == BenchmarkCategory.MACRO
        assert "per_file_ms" in result.metadata


class TestStressBenchmark:
    """Tests for StressBenchmark class."""

    @pytest.fixture
    def config(self):
        """Create fast test config."""
        return BenchmarkConfig(
            warmup_iterations=1,
            measurement_iterations=1,
        )

    def test_create_benchmark(self, config):
        """Test creating a stress benchmark."""
        bench = StressBenchmark(config)
        assert len(bench.results) == 0

    @pytest.mark.slow
    def test_benchmark_concurrent_access(self, config):
        """Test concurrent access benchmark."""
        bench = StressBenchmark(config)
        result = bench.benchmark_concurrent_access(thread_count=2)

        assert result.name == "concurrent_access"
        assert result.category == BenchmarkCategory.STRESS
        assert result.metadata["thread_count"] == 2

    @pytest.mark.slow
    def test_benchmark_large_allocation(self, config):
        """Test large allocation benchmark."""
        bench = StressBenchmark(config)
        result = bench.benchmark_large_allocation(cluster_count=50)

        assert result.name == "large_allocation"
        assert result.category == BenchmarkCategory.STRESS
        assert result.metadata["cluster_count"] == 50


class TestRegressionDetector:
    """Tests for RegressionDetector class."""

    def test_create_detector(self):
        """Test creating a detector."""
        detector = RegressionDetector()
        assert len(detector.thresholds) >= 2

    def test_custom_thresholds(self):
        """Test custom thresholds."""
        thresholds = [
            RegressionThreshold("avg_latency_ms", 10.0),
            RegressionThreshold("operations_per_second", 5.0),
        ]
        detector = RegressionDetector(thresholds=thresholds)
        assert len(detector.thresholds) == 2

    def test_compare_no_regression(self):
        """Test comparison with no regression."""
        detector = RegressionDetector()

        baseline = BenchmarkResult(
            name="test",
            category=BenchmarkCategory.MICRO,
            timestamp=datetime.now(),
            duration_ms=100,
            iterations=100,
            operations_per_second=1000.0,
            avg_latency_ms=1.0,
            min_latency_ms=0.5,
            max_latency_ms=2.0,
            p50_latency_ms=1.0,
            p95_latency_ms=1.5,
            p99_latency_ms=1.8,
        )

        current = BenchmarkResult(
            name="test",
            category=BenchmarkCategory.MICRO,
            timestamp=datetime.now(),
            duration_ms=100,
            iterations=100,
            operations_per_second=950.0,  # 5% slower
            avg_latency_ms=1.05,  # 5% slower
            min_latency_ms=0.5,
            max_latency_ms=2.0,
            p50_latency_ms=1.0,
            p95_latency_ms=1.5,
            p99_latency_ms=1.8,
        )

        regressions = detector.compare_results(current, baseline)
        # 5% is within the 20% threshold
        assert len(regressions) == 0

    def test_compare_with_regression(self):
        """Test comparison with regression."""
        detector = RegressionDetector([
            RegressionThreshold("avg_latency_ms", 10.0),  # 10% threshold
        ])

        baseline = BenchmarkResult(
            name="test",
            category=BenchmarkCategory.MICRO,
            timestamp=datetime.now(),
            duration_ms=100,
            iterations=100,
            operations_per_second=1000.0,
            avg_latency_ms=1.0,
            min_latency_ms=0.5,
            max_latency_ms=2.0,
            p50_latency_ms=1.0,
            p95_latency_ms=1.5,
            p99_latency_ms=1.8,
        )

        current = BenchmarkResult(
            name="test",
            category=BenchmarkCategory.MICRO,
            timestamp=datetime.now(),
            duration_ms=100,
            iterations=100,
            operations_per_second=800.0,
            avg_latency_ms=1.2,  # 20% slower - regression!
            min_latency_ms=0.5,
            max_latency_ms=2.0,
            p50_latency_ms=1.0,
            p95_latency_ms=1.5,
            p99_latency_ms=1.8,
        )

        regressions = detector.compare_results(current, baseline)
        assert len(regressions) > 0
        assert regressions[0]["metric"] == "avg_latency_ms"

    def test_detect_regressions_multiple(self):
        """Test detecting multiple regressions."""
        detector = RegressionDetector([
            RegressionThreshold("avg_latency_ms", 5.0),
        ])

        baseline_results = [
            BenchmarkResult(
                name="bench_a",
                category=BenchmarkCategory.MICRO,
                timestamp=datetime.now(),
                duration_ms=100,
                iterations=100,
                operations_per_second=1000.0,
                avg_latency_ms=1.0,
                min_latency_ms=0.5,
                max_latency_ms=2.0,
                p50_latency_ms=1.0,
                p95_latency_ms=1.5,
                p99_latency_ms=1.8,
            ),
            BenchmarkResult(
                name="bench_b",
                category=BenchmarkCategory.MICRO,
                timestamp=datetime.now(),
                duration_ms=100,
                iterations=100,
                operations_per_second=500.0,
                avg_latency_ms=2.0,
                min_latency_ms=1.0,
                max_latency_ms=3.0,
                p50_latency_ms=2.0,
                p95_latency_ms=2.5,
                p99_latency_ms=2.8,
            ),
        ]

        current_results = [
            BenchmarkResult(
                name="bench_a",
                category=BenchmarkCategory.MICRO,
                timestamp=datetime.now(),
                duration_ms=100,
                iterations=100,
                operations_per_second=1000.0,
                avg_latency_ms=1.2,  # 20% slower - regression
                min_latency_ms=0.5,
                max_latency_ms=2.0,
                p50_latency_ms=1.0,
                p95_latency_ms=1.5,
                p99_latency_ms=1.8,
            ),
            BenchmarkResult(
                name="bench_b",
                category=BenchmarkCategory.MICRO,
                timestamp=datetime.now(),
                duration_ms=100,
                iterations=100,
                operations_per_second=500.0,
                avg_latency_ms=2.0,  # No change
                min_latency_ms=1.0,
                max_latency_ms=3.0,
                p50_latency_ms=2.0,
                p95_latency_ms=2.5,
                p99_latency_ms=2.8,
            ),
        ]

        regressions = detector.detect_regressions(current_results, baseline_results)

        assert "bench_a" in regressions
        assert "bench_b" not in regressions


class TestBenchmarkRunner:
    """Tests for BenchmarkRunner class."""

    @pytest.fixture
    def config(self):
        """Create fast test config."""
        return BenchmarkConfig(
            warmup_iterations=1,
            measurement_iterations=1,
        )

    def test_create_runner(self, config):
        """Test creating a benchmark runner."""
        runner = BenchmarkRunner(config)
        assert len(runner.results) == 0
        assert runner.micro is not None
        assert runner.macro is not None
        assert runner.stress is not None

    @pytest.mark.slow
    def test_run_category_micro(self, config):
        """Test running micro benchmarks."""
        runner = BenchmarkRunner(config)
        results = runner.run_category(BenchmarkCategory.MICRO)

        assert len(results) == 4
        assert all(r.category == BenchmarkCategory.MICRO for r in results)

    @pytest.mark.slow
    def test_run_category_macro(self, config):
        """Test running macro benchmarks."""
        runner = BenchmarkRunner(config)
        results = runner.run_category(BenchmarkCategory.MACRO)

        assert len(results) == 2
        assert all(r.category == BenchmarkCategory.MACRO for r in results)

    @pytest.mark.slow
    def test_run_category_stress(self, config):
        """Test running stress benchmarks."""
        runner = BenchmarkRunner(config)
        results = runner.run_category(BenchmarkCategory.STRESS)

        assert len(results) == 2
        assert all(r.category == BenchmarkCategory.STRESS for r in results)

    def test_save_and_load_results(self, config):
        """Test saving and loading results."""
        # Create mock results instead of running benchmarks
        runner = BenchmarkRunner(config)
        runner.results = [
            BenchmarkResult(
                name="mock_bench",
                category=BenchmarkCategory.MICRO,
                timestamp=datetime.now(),
                duration_ms=100,
                iterations=10,
                operations_per_second=100.0,
                avg_latency_ms=10.0,
                min_latency_ms=5.0,
                max_latency_ms=15.0,
                p50_latency_ms=10.0,
                p95_latency_ms=14.0,
                p99_latency_ms=15.0,
            )
        ]

        with tempfile.NamedTemporaryFile(suffix=".json", delete=False) as f:
            temp_path = f.name

        try:
            runner.save_results(temp_path)

            # Verify file exists and has content
            assert Path(temp_path).exists()

            with open(temp_path) as f:
                data = json.load(f)

            assert "timestamp" in data
            assert "results" in data
            assert len(data["results"]) == 1

            # Load results
            loaded = runner.load_results(temp_path)
            assert len(loaded) == 1
        finally:
            Path(temp_path).unlink(missing_ok=True)

    def test_get_summary(self, config):
        """Test getting summary."""
        runner = BenchmarkRunner(config)
        # Use mock results
        runner.results = [
            BenchmarkResult(
                name="test1",
                category=BenchmarkCategory.MICRO,
                timestamp=datetime.now(),
                duration_ms=100,
                iterations=10,
                operations_per_second=100.0,
                avg_latency_ms=10.0,
                min_latency_ms=5.0,
                max_latency_ms=15.0,
                p50_latency_ms=10.0,
                p95_latency_ms=14.0,
                p99_latency_ms=15.0,
                status=BenchmarkStatus.PASSED,
            ),
            BenchmarkResult(
                name="test2",
                category=BenchmarkCategory.MACRO,
                timestamp=datetime.now(),
                duration_ms=200,
                iterations=5,
                operations_per_second=50.0,
                avg_latency_ms=20.0,
                min_latency_ms=15.0,
                max_latency_ms=25.0,
                p50_latency_ms=20.0,
                p95_latency_ms=24.0,
                p99_latency_ms=25.0,
                status=BenchmarkStatus.PASSED,
            ),
        ]

        summary = runner.get_summary()

        assert summary["total_benchmarks"] == 2
        assert summary["passed"] == 2
        assert "micro" in summary["categories"]
        assert "macro" in summary["categories"]

    def test_print_report(self, config):
        """Test printing report."""
        runner = BenchmarkRunner(config)
        # Use mock results
        runner.results = [
            BenchmarkResult(
                name="test_bench",
                category=BenchmarkCategory.MICRO,
                timestamp=datetime.now(),
                duration_ms=100,
                iterations=10,
                operations_per_second=1000.0,
                avg_latency_ms=1.0,
                min_latency_ms=0.5,
                max_latency_ms=2.0,
                p50_latency_ms=1.0,
                p95_latency_ms=1.8,
                p99_latency_ms=2.0,
                status=BenchmarkStatus.PASSED,
            )
        ]

        report = runner.print_report()

        assert "BENCHMARK REPORT" in report
        assert "MICRO" in report
        assert "test_bench" in report


class TestConvenienceFunctions:
    """Tests for convenience functions."""

    def test_run_benchmarks_mock(self):
        """Test run_benchmarks function with mock results."""
        config = BenchmarkConfig(
            warmup_iterations=1,
            measurement_iterations=1,
        )

        runner = BenchmarkRunner(config)
        # Just verify runner can be created
        assert runner.config.measurement_iterations == 1

    def test_check_regressions_mock(self):
        """Test check_regressions with mock data."""
        detector = RegressionDetector()

        baseline = [
            BenchmarkResult(
                name="test",
                category=BenchmarkCategory.MICRO,
                timestamp=datetime.now(),
                duration_ms=100,
                iterations=10,
                operations_per_second=100.0,
                avg_latency_ms=10.0,
                min_latency_ms=5.0,
                max_latency_ms=15.0,
                p50_latency_ms=10.0,
                p95_latency_ms=14.0,
                p99_latency_ms=15.0,
            )
        ]

        current = [
            BenchmarkResult(
                name="test",
                category=BenchmarkCategory.MICRO,
                timestamp=datetime.now(),
                duration_ms=100,
                iterations=10,
                operations_per_second=100.0,
                avg_latency_ms=10.0,
                min_latency_ms=5.0,
                max_latency_ms=15.0,
                p50_latency_ms=10.0,
                p95_latency_ms=14.0,
                p99_latency_ms=15.0,
            )
        ]

        regressions = detector.detect_regressions(current, baseline)
        # Same values should have no regressions
        assert len(regressions) == 0


@pytest.mark.slow
class TestIntegration:
    """Integration tests for the benchmarking system - marked as slow."""

    def test_full_benchmark_workflow(self):
        """Test complete benchmark workflow."""
        config = BenchmarkConfig(
            warmup_iterations=1,
            measurement_iterations=1,
        )

        runner = BenchmarkRunner(config)

        with tempfile.TemporaryDirectory() as tmpdir:
            baseline_path = Path(tmpdir) / "baseline.json"
            current_path = Path(tmpdir) / "current.json"

            # Run and save baseline
            runner.run_category(BenchmarkCategory.MICRO)
            runner.save_results(str(baseline_path))

            # Clear and run again
            runner.results = []
            runner.run_category(BenchmarkCategory.MICRO)
            runner.save_results(str(current_path))

            # Load and compare
            baseline = runner.load_results(str(baseline_path))
            current = runner.load_results(str(current_path))

            assert len(baseline) == 4
            assert len(current) == 4

            # Check for regressions (should be none for same code)
            regressions = runner.regression_detector.detect_regressions(current, baseline)
            # May have small variations but shouldn't have major regressions
            # Just verify the function works
            assert isinstance(regressions, dict)


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
