#!/usr/bin/env python3
"""
Tests for Infinite Map Performance Benchmarking Suite.

Tests benchmark framework, micro/macro benchmarks, regression detection,
and CI/CD pipeline integration.
"""

import pytest
import json
import tempfile
import time
from pathlib import Path
from unittest.mock import Mock, patch, MagicMock
from datetime import datetime
from collections import defaultdict

from systems.pixel_compiler.infinite_map_perf_suite import (
    # Enums
    BenchmarkCategory,
    BenchmarkStatus,
    Severity,
    # Dataclasses
    SystemInfo,
    BenchmarkMetric,
    BenchmarkResult,
    RegressionReport,
    BenchmarkReport,
    # Classes
    Benchmark,
    VATLookupBenchmark,
    XAttrBenchmark,
    FileLockBenchmark,
    SymlinkBenchmark,
    ACLBenchmark,
    FilesystemTraversalBenchmark,
    BulkXAttrBenchmark,
    ConcurrentLockBenchmark,
    NotificationFloodBenchmark,
    MemoryStressBenchmark,
    LockContentionBenchmark,
    RegressionDetector,
    BenchmarkSuite,
    CIPipeline,
)


# ============================================================================
# Test Enums
# ============================================================================

class TestEnums:
    """Tests for enums."""

    def test_benchmark_categories(self):
        """Test BenchmarkCategory enum values."""
        assert BenchmarkCategory.MICRO.value == "micro"
        assert BenchmarkCategory.MACRO.value == "macro"
        assert BenchmarkCategory.STRESS.value == "stress"
        assert BenchmarkCategory.INTEGRATION.value == "integration"

    def test_benchmark_status(self):
        """Test BenchmarkStatus enum values."""
        assert BenchmarkStatus.PENDING.value == "pending"
        assert BenchmarkStatus.RUNNING.value == "running"
        assert BenchmarkStatus.PASSED.value == "passed"
        assert BenchmarkStatus.FAILED.value == "failed"
        assert BenchmarkStatus.REGRESSION.value == "regression"

    def test_severity(self):
        """Test Severity enum values."""
        assert Severity.NONE.value == "none"
        assert Severity.MINOR.value == "minor"
        assert Severity.MODERATE.value == "moderate"
        assert Severity.MAJOR.value == "major"
        assert Severity.CRITICAL.value == "critical"


# ============================================================================
# Test Dataclasses
# ============================================================================

class TestSystemInfo:
    """Tests for SystemInfo dataclass."""

    def test_creation(self):
        """Test SystemInfo creation."""
        info = SystemInfo(
            platform="Linux",
            python_version="3.12.0",
            cpu_count=8,
            hostname="test",
            timestamp="2025-01-01T00:00:00",
        )
        assert info.platform == "Linux"
        assert info.cpu_count == 8

    def test_collect(self):
        """Test SystemInfo.collect()."""
        info = SystemInfo.collect()
        assert info.platform != ""
        assert info.cpu_count > 0
        assert info.timestamp != ""

    def test_to_dict(self):
        """Test to_dict conversion."""
        info = SystemInfo(
            platform="Linux",
            python_version="3.12.0",
            cpu_count=8,
            hostname="test",
            timestamp="2025-01-01T00:00:00",
        )
        d = info.to_dict()
        assert d["platform"] == "Linux"
        assert d["cpu_count"] == 8


class TestBenchmarkMetric:
    """Tests for BenchmarkMetric dataclass."""

    def test_creation(self):
        """Test BenchmarkMetric creation."""
        metric = BenchmarkMetric(
            name="duration",
            value=100.5,
            unit="ms",
            lower_is_better=True,
        )
        assert metric.name == "duration"
        assert metric.value == 100.5
        assert metric.unit == "ms"
        assert metric.lower_is_better is True

    def test_to_dict(self):
        """Test to_dict conversion."""
        metric = BenchmarkMetric(name="ops", value=1000, unit="ops/s")
        d = metric.to_dict()
        assert d["name"] == "ops"
        assert d["value"] == 1000
        assert d["unit"] == "ops/s"


class TestBenchmarkResult:
    """Tests for BenchmarkResult dataclass."""

    def test_creation(self):
        """Test BenchmarkResult creation."""
        result = BenchmarkResult(
            name="test_bench",
            category=BenchmarkCategory.MICRO,
            status=BenchmarkStatus.PASSED,
            duration_ms=100.0,
            iterations=10,
        )
        assert result.name == "test_bench"
        assert result.category == BenchmarkCategory.MICRO
        assert result.status == BenchmarkStatus.PASSED
        assert result.duration_ms == 100.0
        assert result.iterations == 10

    def test_to_dict(self):
        """Test to_dict conversion."""
        result = BenchmarkResult(
            name="test_bench",
            category=BenchmarkCategory.MICRO,
            status=BenchmarkStatus.PASSED,
            duration_ms=100.0,
            iterations=10,
            avg_ms=10.0,
        )
        d = result.to_dict()
        assert d["name"] == "test_bench"
        assert d["category"] == "micro"
        assert d["status"] == "passed"
        assert d["avg_ms"] == 10.0

    def test_get_primary_metric(self):
        """Test get_primary_metric."""
        result = BenchmarkResult(
            name="test",
            category=BenchmarkCategory.MICRO,
            status=BenchmarkStatus.PASSED,
            duration_ms=100.0,
            iterations=10,
            metrics=[
                BenchmarkMetric("m1", 1.0, "ms"),
                BenchmarkMetric("m2", 2.0, "ms"),
            ],
        )

        primary = result.get_primary_metric()
        assert primary is not None
        assert primary.name == "m1"

    def test_get_primary_metric_empty(self):
        """Test get_primary_metric with no metrics."""
        result = BenchmarkResult(
            name="test",
            category=BenchmarkCategory.MICRO,
            status=BenchmarkStatus.PASSED,
            duration_ms=100.0,
            iterations=10,
        )

        assert result.get_primary_metric() is None


class TestRegressionReport:
    """Tests for RegressionReport dataclass."""

    def test_creation(self):
        """Test RegressionReport creation."""
        report = RegressionReport(
            benchmark_name="test",
            baseline_value=100.0,
            current_value=120.0,
            change_percent=20.0,
            severity=Severity.MODERATE,
            message="20% slower",
        )
        assert report.benchmark_name == "test"
        assert report.change_percent == 20.0
        assert report.severity == Severity.MODERATE

    def test_to_dict(self):
        """Test to_dict conversion."""
        report = RegressionReport(
            benchmark_name="test",
            baseline_value=100.0,
            current_value=120.0,
            change_percent=20.0,
            severity=Severity.MODERATE,
            message="20% slower",
        )
        d = report.to_dict()
        assert d["benchmark_name"] == "test"
        assert d["severity"] == "moderate"


class TestBenchmarkReport:
    """Tests for BenchmarkReport dataclass."""

    def test_creation(self):
        """Test BenchmarkReport creation."""
        report = BenchmarkReport(
            system_info=SystemInfo.collect(),
            results=[],
            regressions=[],
            summary={"total": 0},
        )
        assert len(report.results) == 0
        assert len(report.regressions) == 0

    def test_to_dict(self):
        """Test to_dict conversion."""
        result = BenchmarkResult(
            name="test",
            category=BenchmarkCategory.MICRO,
            status=BenchmarkStatus.PASSED,
            duration_ms=100.0,
            iterations=10,
        )

        report = BenchmarkReport(
            system_info=SystemInfo.collect(),
            results=[result],
            regressions=[],
            summary={"total": 1},
        )

        d = report.to_dict()
        assert "system_info" in d
        assert len(d["results"]) == 1
        assert d["summary"]["total"] == 1


# ============================================================================
# Test Benchmark Base Class
# ============================================================================

class TestBenchmark:
    """Tests for Benchmark base class."""

    def test_init(self):
        """Test Benchmark initialization."""
        bench = VATLookupBenchmark()
        assert bench.result is None
        assert bench._timings == []

    def test_run(self):
        """Test running a benchmark."""
        bench = VATLookupBenchmark()
        result = bench.run(iterations=10)

        assert result.status == BenchmarkStatus.PASSED
        assert result.iterations == 10
        assert result.duration_ms > 0

    def test_calculate_stats(self):
        """Test statistics calculation."""
        bench = VATLookupBenchmark()
        bench.run(iterations=10)

        stats = bench._calculate_stats()

        assert "min_ms" in stats
        assert "max_ms" in stats
        assert "avg_ms" in stats
        assert "median_ms" in stats

    def test_failed_benchmark(self):
        """Test handling of failed benchmark."""
        class FailingBenchmark(Benchmark):
            name = "fail"
            category = BenchmarkCategory.MICRO

            def run_iteration(self):
                return False, {}

        bench = FailingBenchmark()
        result = bench.run(iterations=10)

        assert result.status == BenchmarkStatus.FAILED


# ============================================================================
# Test Micro-Benchmarks
# ============================================================================

class TestMicroBenchmarks:
    """Tests for micro-benchmarks."""

    def test_vat_lookup(self):
        """Test VAT lookup benchmark."""
        bench = VATLookupBenchmark()
        result = bench.run(iterations=10)

        assert result.status == BenchmarkStatus.PASSED
        assert result.category == BenchmarkCategory.MICRO

    def test_xattr(self):
        """Test xattr benchmark."""
        bench = XAttrBenchmark()
        result = bench.run(iterations=10)

        assert result.status == BenchmarkStatus.PASSED
        assert result.category == BenchmarkCategory.MICRO

    def test_file_lock(self):
        """Test file lock benchmark."""
        bench = FileLockBenchmark()
        result = bench.run(iterations=10)

        assert result.status == BenchmarkStatus.PASSED
        assert result.category == BenchmarkCategory.MICRO

    def test_symlink(self):
        """Test symlink benchmark."""
        bench = SymlinkBenchmark()
        result = bench.run(iterations=10)

        assert result.status == BenchmarkStatus.PASSED
        assert result.category == BenchmarkCategory.MICRO

    def test_acl(self):
        """Test ACL benchmark."""
        bench = ACLBenchmark()
        result = bench.run(iterations=10)

        assert result.status == BenchmarkStatus.PASSED
        assert result.category == BenchmarkCategory.MICRO


# ============================================================================
# Test Macro-Benchmarks
# ============================================================================

class TestMacroBenchmarks:
    """Tests for macro-benchmarks."""

    def test_filesystem_traversal(self):
        """Test filesystem traversal benchmark."""
        bench = FilesystemTraversalBenchmark()
        result = bench.run(iterations=2)

        assert result.status == BenchmarkStatus.PASSED
        assert result.category == BenchmarkCategory.MACRO
        assert len(result.metrics) > 0

    def test_bulk_xattr(self):
        """Test bulk xattr benchmark."""
        bench = BulkXAttrBenchmark()
        result = bench.run(iterations=2)

        assert result.status == BenchmarkStatus.PASSED
        assert result.category == BenchmarkCategory.MACRO

    def test_concurrent_lock(self):
        """Test concurrent lock benchmark."""
        bench = ConcurrentLockBenchmark()
        result = bench.run(iterations=2)

        assert result.status == BenchmarkStatus.PASSED
        assert result.category == BenchmarkCategory.MACRO

    def test_notification_flood(self):
        """Test notification flood benchmark."""
        bench = NotificationFloodBenchmark()
        result = bench.run(iterations=2)

        assert result.status == BenchmarkStatus.PASSED
        assert result.category == BenchmarkCategory.MACRO


# ============================================================================
# Test Stress Benchmarks
# ============================================================================

class TestStressBenchmarks:
    """Tests for stress benchmarks."""

    def test_memory_stress(self):
        """Test memory stress benchmark."""
        bench = MemoryStressBenchmark()
        result = bench.run(iterations=1)

        assert result.status == BenchmarkStatus.PASSED
        assert result.category == BenchmarkCategory.STRESS

    def test_lock_contention(self):
        """Test lock contention benchmark."""
        bench = LockContentionBenchmark()
        result = bench.run(iterations=1)

        assert result.status == BenchmarkStatus.PASSED
        assert result.category == BenchmarkCategory.STRESS


# ============================================================================
# Test RegressionDetector
# ============================================================================

class TestRegressionDetector:
    """Tests for RegressionDetector class."""

    def test_init(self):
        """Test initialization."""
        detector = RegressionDetector()
        assert detector.baseline == {}

    def test_load_baseline(self, tmp_path):
        """Test loading baseline from file."""
        baseline = {
            "results": [
                {"name": "test", "avg_ms": 100.0}
            ]
        }

        baseline_file = tmp_path / "baseline.json"
        baseline_file.write_text(json.dumps(baseline))

        detector = RegressionDetector(str(baseline_file))
        assert "test" in detector.baseline

    def test_load_baseline_missing(self):
        """Test loading missing baseline file."""
        detector = RegressionDetector()
        success = detector.load_baseline("/nonexistent/file.json")
        assert success is False

    def test_compare_improvement(self, tmp_path):
        """Test comparison with improvement."""
        baseline = {"results": [{"name": "test", "avg_ms": 100.0}]}
        baseline_file = tmp_path / "baseline.json"
        baseline_file.write_text(json.dumps(baseline))

        detector = RegressionDetector(str(baseline_file))

        result = BenchmarkResult(
            name="test",
            category=BenchmarkCategory.MICRO,
            status=BenchmarkStatus.PASSED,
            duration_ms=90.0,
            iterations=10,
            avg_ms=90.0,  # 10% faster
        )

        report = detector.compare(result)
        # Improvement is not a regression
        assert report is None

    def test_compare_minor_regression(self, tmp_path):
        """Test comparison with minor regression."""
        baseline = {"results": [{"name": "test", "avg_ms": 100.0}]}
        baseline_file = tmp_path / "baseline.json"
        baseline_file.write_text(json.dumps(baseline))

        detector = RegressionDetector(str(baseline_file))

        result = BenchmarkResult(
            name="test",
            category=BenchmarkCategory.MICRO,
            status=BenchmarkStatus.PASSED,
            duration_ms=105.0,
            iterations=10,
            avg_ms=105.0,  # 5% slower
        )

        report = detector.compare(result)
        assert report is not None
        assert report.severity == Severity.MINOR

    def test_compare_moderate_regression(self, tmp_path):
        """Test comparison with moderate regression."""
        baseline = {"results": [{"name": "test", "avg_ms": 100.0}]}
        baseline_file = tmp_path / "baseline.json"
        baseline_file.write_text(json.dumps(baseline))

        detector = RegressionDetector(str(baseline_file))

        result = BenchmarkResult(
            name="test",
            category=BenchmarkCategory.MICRO,
            status=BenchmarkStatus.PASSED,
            duration_ms=120.0,
            iterations=10,
            avg_ms=120.0,  # 20% slower
        )

        report = detector.compare(result)
        assert report is not None
        assert report.severity == Severity.MODERATE

    def test_compare_major_regression(self, tmp_path):
        """Test comparison with major regression."""
        baseline = {"results": [{"name": "test", "avg_ms": 100.0}]}
        baseline_file = tmp_path / "baseline.json"
        baseline_file.write_text(json.dumps(baseline))

        detector = RegressionDetector(str(baseline_file))

        result = BenchmarkResult(
            name="test",
            category=BenchmarkCategory.MICRO,
            status=BenchmarkStatus.PASSED,
            duration_ms=140.0,
            iterations=10,
            avg_ms=140.0,  # 40% slower
        )

        report = detector.compare(result)
        assert report is not None
        assert report.severity == Severity.MAJOR

    def test_compare_critical_regression(self, tmp_path):
        """Test comparison with critical regression."""
        baseline = {"results": [{"name": "test", "avg_ms": 100.0}]}
        baseline_file = tmp_path / "baseline.json"
        baseline_file.write_text(json.dumps(baseline))

        detector = RegressionDetector(str(baseline_file))

        result = BenchmarkResult(
            name="test",
            category=BenchmarkCategory.MICRO,
            status=BenchmarkStatus.PASSED,
            duration_ms=200.0,
            iterations=10,
            avg_ms=200.0,  # 100% slower
        )

        report = detector.compare(result)
        assert report is not None
        assert report.severity == Severity.CRITICAL

    def test_compare_missing_baseline(self):
        """Test comparison with missing baseline."""
        detector = RegressionDetector()

        result = BenchmarkResult(
            name="test",
            category=BenchmarkCategory.MICRO,
            status=BenchmarkStatus.PASSED,
            duration_ms=100.0,
            iterations=10,
            avg_ms=100.0,
        )

        report = detector.compare(result)
        assert report is None

    def test_compare_all(self, tmp_path):
        """Test comparing all results."""
        baseline = {
            "results": [
                {"name": "test1", "avg_ms": 100.0},
                {"name": "test2", "avg_ms": 100.0},
            ]
        }
        baseline_file = tmp_path / "baseline.json"
        baseline_file.write_text(json.dumps(baseline))

        detector = RegressionDetector(str(baseline_file))

        results = [
            BenchmarkResult(
                name="test1",
                category=BenchmarkCategory.MICRO,
                status=BenchmarkStatus.PASSED,
                duration_ms=100.0,
                iterations=10,
                avg_ms=100.0,  # No change
            ),
            BenchmarkResult(
                name="test2",
                category=BenchmarkCategory.MICRO,
                status=BenchmarkStatus.PASSED,
                duration_ms=150.0,
                iterations=10,
                avg_ms=150.0,  # 50% slower
            ),
        ]

        regressions = detector.compare_all(results)
        assert len(regressions) == 1
        assert regressions[0].benchmark_name == "test2"


# ============================================================================
# Test BenchmarkSuite
# ============================================================================

class TestBenchmarkSuite:
    """Tests for BenchmarkSuite class."""

    def test_init(self):
        """Test initialization."""
        suite = BenchmarkSuite()
        assert len(suite.results) == 0
        assert suite.system_info is not None

    def test_run_benchmark(self):
        """Test running a single benchmark."""
        suite = BenchmarkSuite()
        result = suite.run_benchmark(VATLookupBenchmark, iterations=5)

        assert result.status == BenchmarkStatus.PASSED
        assert result.iterations == 5

    def test_run_category(self):
        """Test running a category."""
        suite = BenchmarkSuite()
        results = suite.run_category(BenchmarkCategory.MICRO, iterations=5)

        assert len(results) > 0
        assert all(r.category == BenchmarkCategory.MICRO for r in results)

    def test_run_all(self):
        """Test running all benchmarks."""
        suite = BenchmarkSuite(iterations=3)
        report = suite.run_all()

        assert report.summary["total_benchmarks"] > 0
        assert len(report.results) > 0

    def test_save_results(self, tmp_path):
        """Test saving results to file."""
        suite = BenchmarkSuite(iterations=3)
        suite.run_all()

        output_file = tmp_path / "results.json"
        success = suite.save_results(str(output_file))

        assert success is True
        assert output_file.exists()

        # Verify content
        data = json.loads(output_file.read_text())
        assert "results" in data
        assert "summary" in data

    def test_check_regressions(self, tmp_path):
        """Test checking regressions."""
        # Create baseline
        baseline = {
            "results": [
                {"name": "vat_lookup", "avg_ms": 0.001}
            ]
        }
        baseline_file = tmp_path / "baseline.json"
        baseline_file.write_text(json.dumps(baseline))

        suite = BenchmarkSuite(iterations=3)
        suite.run_category(BenchmarkCategory.MICRO)

        regressions = suite.check_regressions(str(baseline_file))
        # May or may not have regressions depending on performance
        assert isinstance(regressions, list)

    def test_print_report(self, capsys):
        """Test printing report."""
        suite = BenchmarkSuite(iterations=2)
        report = suite.run_all()

        suite.print_report(report)

        captured = capsys.readouterr()
        assert "BENCHMARK REPORT" in captured.out

    def test_generate_summary(self):
        """Test summary generation."""
        suite = BenchmarkSuite()
        suite.results = [
            BenchmarkResult(
                name="test1",
                category=BenchmarkCategory.MICRO,
                status=BenchmarkStatus.PASSED,
                duration_ms=100.0,
                iterations=10,
            ),
            BenchmarkResult(
                name="test2",
                category=BenchmarkCategory.MACRO,
                status=BenchmarkStatus.FAILED,
                duration_ms=200.0,
                iterations=10,
            ),
        ]

        summary = suite._generate_summary()

        assert summary["total_benchmarks"] == 2
        assert summary["passed"] == 1
        assert summary["failed"] == 1


# ============================================================================
# Test CIPipeline
# ============================================================================

class TestCIPipeline:
    """Tests for CIPipeline class."""

    def test_init(self, tmp_path):
        """Test initialization."""
        pipeline = CIPipeline(results_dir=str(tmp_path / "benchmarks"))
        assert pipeline.results_dir.exists()

    def test_run_ci_benchmark(self, tmp_path):
        """Test running CI benchmark."""
        pipeline = CIPipeline(results_dir=str(tmp_path / "benchmarks"))
        success, report = pipeline.run_ci_benchmark(
            fail_on_regression=False
        )

        assert isinstance(success, bool)
        assert isinstance(report, BenchmarkReport)
        assert report.summary["total_benchmarks"] > 0

    def test_get_commit_hash(self, tmp_path):
        """Test getting commit hash."""
        pipeline = CIPipeline(results_dir=str(tmp_path))
        commit_hash = pipeline._get_commit_hash()

        assert isinstance(commit_hash, str)
        # Should be either 8 chars or "unknown"
        assert len(commit_hash) in [8, 7] or commit_hash == "unknown"

    def test_generate_badge_data(self, tmp_path):
        """Test generating badge data."""
        pipeline = CIPipeline(results_dir=str(tmp_path))

        report = BenchmarkReport(
            system_info=SystemInfo.collect(),
            results=[],
            regressions=[],
            summary={"passed": 10, "total_benchmarks": 10},
        )

        badge = pipeline.generate_badge_data(report)

        assert badge["schemaVersion"] == 1
        assert "message" in badge
        assert "color" in badge


# ============================================================================
# Integration Tests
# ============================================================================

class TestIntegration:
    """Integration tests for benchmark suite."""

    def test_full_workflow(self, tmp_path):
        """Test full benchmark workflow."""
        # Run benchmarks
        suite = BenchmarkSuite(iterations=5)
        report = suite.run_all()

        # Save results
        results_file = tmp_path / "results.json"
        suite.save_results(str(results_file))

        # Load as baseline
        detector = RegressionDetector(str(results_file))

        # Run again and compare
        suite2 = BenchmarkSuite(iterations=5)
        suite2.run_all()

        regressions = detector.compare_all(suite2.results)
        # Should be minimal regressions (same code)
        assert isinstance(regressions, list)

    def test_category_workflow(self):
        """Test running specific category."""
        suite = BenchmarkSuite(iterations=3)

        # Run only micro benchmarks
        results = suite.run_category(BenchmarkCategory.MICRO)

        assert all(r.category == BenchmarkCategory.MICRO for r in results)
        assert len(results) == len(BenchmarkSuite.MICRO_BENCHMARKS)

    def test_report_serialization(self, tmp_path):
        """Test report serialization/deserialization."""
        suite = BenchmarkSuite(iterations=2)
        report = suite.run_all()

        # Serialize
        report_file = tmp_path / "report.json"
        report_file.write_text(json.dumps(report.to_dict()))

        # Deserialize
        data = json.loads(report_file.read_text())

        assert "system_info" in data
        assert "results" in data
        assert "regressions" in data
        assert "summary" in data


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
