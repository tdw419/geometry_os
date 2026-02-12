#!/usr/bin/env python3
"""
Infinite Map Performance Benchmarking Suite.

Provides comprehensive benchmarking infrastructure with:
- Micro-benchmarks (individual operations)
- Macro-benchmarks (real workloads)
- Regression detection
- CI/CD pipeline integration
- Performance dashboard data
- Historical trend tracking

Usage:
    from infinite_map_perf_suite import BenchmarkSuite

    suite = BenchmarkSuite()
    results = suite.run_all()
    suite.save_results("results.json")

    # Check for regressions
    regressions = suite.check_regressions("baseline.json")
"""

import os
import sys
import json
import time
import statistics
import tempfile
import shutil
from pathlib import Path
from dataclasses import dataclass, field, asdict
from typing import Dict, List, Optional, Any, Callable, Tuple, Union
from datetime import datetime
from enum import Enum, auto
from collections import defaultdict
import logging
import platform
import hashlib

# Set up logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


# ============================================================================
# Enums
# ============================================================================

class BenchmarkCategory(Enum):
    """Categories of benchmarks."""
    MICRO = "micro"           # Individual operations
    MACRO = "macro"           # Real workloads
    STRESS = "stress"         # Stress tests
    INTEGRATION = "integration"  # End-to-end


class BenchmarkStatus(Enum):
    """Status of a benchmark."""
    PENDING = "pending"
    RUNNING = "running"
    PASSED = "passed"
    FAILED = "failed"
    REGRESSION = "regression"


class Severity(Enum):
    """Regression severity levels."""
    NONE = "none"
    MINOR = "minor"     # <10% slower
    MODERATE = "moderate"  # 10-25% slower
    MAJOR = "major"     # 25-50% slower
    CRITICAL = "critical"  # >50% slower


# ============================================================================
# Dataclasses
# ============================================================================

@dataclass
class SystemInfo:
    """System information for benchmark context."""
    platform: str = ""
    python_version: str = ""
    cpu_count: int = 0
    hostname: str = ""
    timestamp: str = ""

    @classmethod
    def collect(cls) -> "SystemInfo":
        """Collect current system information."""
        return cls(
            platform=platform.platform(),
            python_version=platform.python_version(),
            cpu_count=os.cpu_count() or 1,
            hostname=platform.node(),
            timestamp=datetime.now().isoformat(),
        )

    def to_dict(self) -> Dict[str, Any]:
        return asdict(self)


@dataclass
class BenchmarkMetric:
    """Single benchmark metric."""
    name: str
    value: float
    unit: str
    lower_is_better: bool = True

    def to_dict(self) -> Dict[str, Any]:
        return asdict(self)


@dataclass
class BenchmarkResult:
    """Result of a single benchmark run."""
    name: str
    category: BenchmarkCategory
    status: BenchmarkStatus
    duration_ms: float
    iterations: int
    metrics: List[BenchmarkMetric] = field(default_factory=list)
    message: str = ""
    timestamp: str = field(default_factory=lambda: datetime.now().isoformat())

    # Statistical data
    min_ms: float = 0.0
    max_ms: float = 0.0
    avg_ms: float = 0.0
    median_ms: float = 0.0
    std_dev: float = 0.0
    p95_ms: float = 0.0
    p99_ms: float = 0.0

    # Memory usage
    memory_before_mb: float = 0.0
    memory_after_mb: float = 0.0
    memory_peak_mb: float = 0.0

    def to_dict(self) -> Dict[str, Any]:
        d = asdict(self)
        d["category"] = self.category.value
        d["status"] = self.status.value
        d["metrics"] = [m.to_dict() for m in self.metrics]
        return d

    def get_primary_metric(self) -> Optional[BenchmarkMetric]:
        """Get the primary metric (first one)."""
        return self.metrics[0] if self.metrics else None


@dataclass
class RegressionReport:
    """Report of detected regressions."""
    benchmark_name: str
    baseline_value: float
    current_value: float
    change_percent: float
    severity: Severity
    message: str

    def to_dict(self) -> Dict[str, Any]:
        return {
            "benchmark_name": self.benchmark_name,
            "baseline_value": self.baseline_value,
            "current_value": self.current_value,
            "change_percent": self.change_percent,
            "severity": self.severity.value,
            "message": self.message,
        }


@dataclass
class BenchmarkReport:
    """Complete benchmark report."""
    system_info: SystemInfo
    results: List[BenchmarkResult]
    regressions: List[RegressionReport]
    summary: Dict[str, Any]
    timestamp: str = field(default_factory=lambda: datetime.now().isoformat())

    def to_dict(self) -> Dict[str, Any]:
        return {
            "system_info": self.system_info.to_dict(),
            "results": [r.to_dict() for r in self.results],
            "regressions": [r.to_dict() for r in self.regressions],
            "summary": self.summary,
            "timestamp": self.timestamp,
        }


# ============================================================================
# Benchmark Base Class
# ============================================================================

class Benchmark:
    """Base class for benchmarks."""

    name: str = "base"
    category: BenchmarkCategory = BenchmarkCategory.MICRO
    description: str = ""
    default_iterations: int = 100

    def __init__(self):
        self.result: Optional[BenchmarkResult] = None
        self._timings: List[float] = []

    def setup(self) -> bool:
        """Set up the benchmark. Return True if successful."""
        return True

    def teardown(self):
        """Clean up after the benchmark."""
        pass

    def run_iteration(self) -> Tuple[bool, Dict[str, Any]]:
        """Run a single iteration. Return (success, metrics)."""
        raise NotImplementedError

    def run(self, iterations: Optional[int] = None) -> BenchmarkResult:
        """Run the benchmark."""
        iterations = iterations or self.default_iterations
        self._timings = []
        metrics_list: List[Dict[str, Any]] = []

        status = BenchmarkStatus.RUNNING

        try:
            if not self.setup():
                return BenchmarkResult(
                    name=self.name,
                    category=self.category,
                    status=BenchmarkStatus.FAILED,
                    duration_ms=0,
                    iterations=0,
                    message="Setup failed",
                )

            for _ in range(iterations):
                start = time.perf_counter()
                success, metrics = self.run_iteration()
                duration_ms = (time.perf_counter() - start) * 1000

                if not success:
                    status = BenchmarkStatus.FAILED
                    break

                self._timings.append(duration_ms)
                metrics_list.append(metrics)

            self.teardown()

        except Exception as e:
            status = BenchmarkStatus.FAILED
            logger.error(f"Benchmark {self.name} failed: {e}")

        # Calculate statistics
        if self._timings:
            stats = self._calculate_stats()
        else:
            stats = {}

        # Aggregate metrics
        aggregated = self._aggregate_metrics(metrics_list)

        self.result = BenchmarkResult(
            name=self.name,
            category=self.category,
            status=status if status == BenchmarkStatus.FAILED else BenchmarkStatus.PASSED,
            duration_ms=sum(self._timings) if self._timings else 0,
            iterations=len(self._timings),
            metrics=aggregated,
            **stats,
        )

        return self.result

    def _calculate_stats(self) -> Dict[str, float]:
        """Calculate statistical measures."""
        if not self._timings:
            return {}

        sorted_timings = sorted(self._timings)
        n = len(sorted_timings)

        return {
            "min_ms": min(self._timings),
            "max_ms": max(self._timings),
            "avg_ms": statistics.mean(self._timings),
            "median_ms": statistics.median(self._timings),
            "std_dev": statistics.stdev(self._timings) if n > 1 else 0,
            "p95_ms": sorted_timings[int(n * 0.95)] if n > 0 else 0,
            "p99_ms": sorted_timings[int(n * 0.99)] if n > 0 else 0,
        }

    def _aggregate_metrics(self, metrics_list: List[Dict[str, Any]]) -> List[BenchmarkMetric]:
        """Aggregate metrics from all iterations."""
        if not metrics_list:
            return []

        # Get all metric names
        all_names = set()
        for m in metrics_list:
            all_names.update(m.keys())

        aggregated = []
        for name in all_names:
            values = [m.get(name, 0) for m in metrics_list if name in m]
            if values:
                aggregated.append(BenchmarkMetric(
                    name=name,
                    value=statistics.mean(values),
                    unit="ms",
                ))

        return aggregated


# ============================================================================
# Micro-Benchmarks
# ============================================================================

class VATLookupBenchmark(Benchmark):
    """Benchmark VAT lookup operations."""

    name = "vat_lookup"
    category = BenchmarkCategory.MICRO
    description = "VAT file lookup performance"
    default_iterations = 1000

    def setup(self) -> bool:
        """Set up test data."""
        self.test_files = [f"file_{i}.txt" for i in range(100)]
        self.vat_data = {f: {"x": i * 10, "y": i * 10} for i, f in enumerate(self.test_files)}
        return True

    def run_iteration(self) -> Tuple[bool, Dict[str, Any]]:
        """Run single lookup iteration."""
        filename = self.test_files[hash(str(time.time())) % len(self.test_files)]
        _ = self.vat_data.get(filename)
        return True, {}


class XAttrBenchmark(Benchmark):
    """Benchmark extended attribute operations."""

    name = "xattr_ops"
    category = BenchmarkCategory.MICRO
    description = "Extended attribute set/get performance"
    default_iterations = 500

    def setup(self) -> bool:
        """Set up xattr manager."""
        from systems.pixel_compiler.infinite_map_fuse_advanced import ExtendedAttributes
        self.xattr = ExtendedAttributes()
        self.test_path = "/benchmark/file"
        return True

    def run_iteration(self) -> Tuple[bool, Dict[str, Any]]:
        """Run xattr iteration."""
        self.xattr.set(self.test_path, "user.bench", b"test value")
        _ = self.xattr.get(self.test_path, "user.bench")
        self.xattr.remove(self.test_path, "user.bench")
        return True, {}


class FileLockBenchmark(Benchmark):
    """Benchmark file locking operations."""

    name = "file_lock"
    category = BenchmarkCategory.MICRO
    description = "File lock acquire/release performance"
    default_iterations = 500

    def setup(self) -> bool:
        """Set up lock manager."""
        from systems.pixel_compiler.infinite_map_fuse_advanced import FileLockManager, LockType
        self.lock_manager = FileLockManager()
        self.lock_type = LockType.EXCLUSIVE
        self.test_path = "/benchmark/locked"
        self.pid = 1234
        return True

    def run_iteration(self) -> Tuple[bool, Dict[str, Any]]:
        """Run lock iteration."""
        self.lock_manager.acquire(self.test_path, self.lock_type, self.pid)
        self.lock_manager.release_all(self.pid)
        return True, {}


class SymlinkBenchmark(Benchmark):
    """Benchmark symbolic link operations."""

    name = "symlink_ops"
    category = BenchmarkCategory.MICRO
    description = "Symlink create/resolve performance"
    default_iterations = 500

    def setup(self) -> bool:
        """Set up symlink manager."""
        from systems.pixel_compiler.infinite_map_fuse_advanced import SymbolicLinkManager
        self.manager = SymbolicLinkManager()
        self.counter = 0
        return True

    def run_iteration(self) -> Tuple[bool, Dict[str, Any]]:
        """Run symlink iteration."""
        source = f"/link_{self.counter}"
        target = f"/target_{self.counter}"
        self.counter += 1

        self.manager.create(source, target)
        self.manager.read(source)
        self.manager.remove(source)
        return True, {}


class ACLBenchmark(Benchmark):
    """Benchmark ACL permission checks."""

    name = "acl_check"
    category = BenchmarkCategory.MICRO
    description = "ACL permission check performance"
    default_iterations = 1000

    def setup(self) -> bool:
        """Set up ACL manager."""
        from systems.pixel_compiler.infinite_map_fuse_advanced import (
            POSIXACLManager, ACLEntry, ACLType, Permission
        )
        self.manager = POSIXACLManager()
        self.manager.set_acl("/secure", [
            ACLEntry(ACLType.USER, 1000, 6),
            ACLEntry(ACLType.GROUP, 100, 4),
            ACLEntry(ACLType.OTHER, None, 0),
        ])
        self.Permission = Permission
        return True

    def run_iteration(self) -> Tuple[bool, Dict[str, Any]]:
        """Run ACL check iteration."""
        self.manager.check_permission("/secure", 1000, 100, self.Permission.READ)
        self.manager.check_permission("/secure", 2000, 200, self.Permission.WRITE)
        return True, {}


# ============================================================================
# Macro-Benchmarks
# ============================================================================

class FilesystemTraversalBenchmark(Benchmark):
    """Benchmark filesystem traversal."""

    name = "fs_traversal"
    category = BenchmarkCategory.MACRO
    description = "Filesystem tree traversal performance"
    default_iterations = 10

    def setup(self) -> bool:
        """Set up test directory structure."""
        self.test_dir = tempfile.mkdtemp(prefix="benchmark_")

        # Create directory structure
        for i in range(10):
            subdir = Path(self.test_dir) / f"dir_{i}"
            subdir.mkdir()
            for j in range(10):
                (subdir / f"file_{j}.txt").write_text(f"content {j}")

        return True

    def run_iteration(self) -> Tuple[bool, Dict[str, Any]]:
        """Run traversal iteration."""
        file_count = 0
        for root, dirs, files in os.walk(self.test_dir):
            file_count += len(files)
        return True, {"files_traversed": file_count}

    def teardown(self):
        """Clean up test directory."""
        if hasattr(self, "test_dir"):
            shutil.rmtree(self.test_dir, ignore_errors=True)


class BulkXAttrBenchmark(Benchmark):
    """Benchmark bulk xattr operations."""

    name = "bulk_xattr"
    category = BenchmarkCategory.MACRO
    description = "Bulk extended attribute operations"
    default_iterations = 10

    def setup(self) -> bool:
        """Set up xattr manager."""
        from systems.pixel_compiler.infinite_map_fuse_advanced import ExtendedAttributes
        self.xattr = ExtendedAttributes()
        self.file_count = 100
        self.attr_count = 10
        return True

    def run_iteration(self) -> Tuple[bool, Dict[str, Any]]:
        """Run bulk iteration."""
        # Set attributes for many files
        for i in range(self.file_count):
            path = f"/file_{i}"
            for j in range(self.attr_count):
                self.xattr.set(path, f"user.attr_{j}", f"value_{j}".encode())

        # Read all attributes
        for i in range(self.file_count):
            path = f"/file_{i}"
            self.xattr.list(path)

        return True, {
            "total_attrs": self.file_count * self.attr_count,
        }


class ConcurrentLockBenchmark(Benchmark):
    """Benchmark concurrent lock operations."""

    name = "concurrent_lock"
    category = BenchmarkCategory.MACRO
    description = "Concurrent file locking performance"
    default_iterations = 10

    def setup(self) -> bool:
        """Set up lock manager."""
        from systems.pixel_compiler.infinite_map_fuse_advanced import FileLockManager, LockType
        self.lock_manager = FileLockManager()
        self.LockType = LockType
        self.file_count = 50
        return True

    def run_iteration(self) -> Tuple[bool, Dict[str, Any]]:
        """Run concurrent lock iteration."""
        # Simulate concurrent access pattern
        pids = [1000 + i for i in range(10)]

        for pid in pids:
            for i in range(self.file_count):
                path = f"/file_{i}"
                self.lock_manager.acquire(path, self.LockType.SHARED, pid, blocking=False)

        # Release all
        for pid in pids:
            self.lock_manager.release_all(pid)

        return True, {"locks_acquired": self.file_count * len(pids)}


class NotificationFloodBenchmark(Benchmark):
    """Benchmark notification system under load."""

    name = "notification_flood"
    category = BenchmarkCategory.MACRO
    description = "Directory notification performance under load"
    default_iterations = 10

    def setup(self) -> bool:
        """Set up notifier."""
        from systems.pixel_compiler.infinite_map_fuse_advanced import (
            DirectoryNotifier, NotificationType
        )
        self.notifier = DirectoryNotifier()
        self.NotificationType = NotificationType
        self.event_count = 100
        return True

    def run_iteration(self) -> Tuple[bool, Dict[str, Any]]:
        """Run notification flood iteration."""
        self.notifier.add_watch("/test", 1234)

        for i in range(self.event_count):
            self.notifier.notify(
                "/test",
                self.NotificationType.CREATE,
                f"file_{i}.txt",
            )

        events = self.notifier.get_events("/test")
        self.notifier.clear_events("/test")

        return True, {"events_sent": self.event_count}


# ============================================================================
# Stress Benchmarks
# ============================================================================

class MemoryStressBenchmark(Benchmark):
    """Benchmark memory usage under stress."""

    name = "memory_stress"
    category = BenchmarkCategory.STRESS
    description = "Memory usage under heavy load"
    default_iterations = 5

    def setup(self) -> bool:
        """Set up stress test."""
        try:
            import psutil
            self.process = psutil.Process()
            self.has_psutil = True
        except ImportError:
            self.has_psutil = False
        return True

    def run_iteration(self) -> Tuple[bool, Dict[str, Any]]:
        """Run memory stress iteration."""
        from systems.pixel_compiler.infinite_map_fuse_advanced import ExtendedAttributes

        xattr = ExtendedAttributes()

        memory_before = 0
        memory_after = 0

        if self.has_psutil:
            memory_before = self.process.memory_info().rss / 1024 / 1024

        # Create many attributes
        for i in range(1000):
            for j in range(10):
                xattr.set(f"/file_{i}", f"user.attr_{j}", b"x" * 100)

        if self.has_psutil:
            memory_after = self.process.memory_info().rss / 1024 / 1024

        return True, {
            "memory_before_mb": memory_before,
            "memory_after_mb": memory_after,
            "delta_mb": memory_after - memory_before,
        }


class LockContentionBenchmark(Benchmark):
    """Benchmark lock contention handling."""

    name = "lock_contention"
    category = BenchmarkCategory.STRESS
    description = "Lock contention under high load"
    default_iterations = 5

    def setup(self) -> bool:
        """Set up contention test."""
        from systems.pixel_compiler.infinite_map_fuse_advanced import FileLockManager, LockType
        self.lock_manager = FileLockManager()
        self.LockType = LockType
        return True

    def run_iteration(self) -> Tuple[bool, Dict[str, Any]]:
        """Run contention iteration."""
        conflicts = 0
        successes = 0

        # Many processes trying to lock same file
        for i in range(100):
            pid = 1000 + i
            success, _ = self.lock_manager.acquire(
                "/contended_file",
                self.LockType.EXCLUSIVE,
                pid,
                blocking=False,
            )
            if success:
                successes += 1
            else:
                conflicts += 1
            self.lock_manager.release_all(pid)

        return True, {
            "successes": successes,
            "conflicts": conflicts,
        }


# ============================================================================
# Regression Detector
# ============================================================================

class RegressionDetector:
    """
    Detects performance regressions by comparing against baselines.
    """

    # Thresholds for regression severity
    THRESHOLDS = {
        Severity.MINOR: 0.05,      # 5%
        Severity.MODERATE: 0.10,   # 10%
        Severity.MAJOR: 0.25,      # 25%
        Severity.CRITICAL: 0.50,   # 50%
    }

    def __init__(self, baseline_path: Optional[str] = None):
        self.baseline_path = baseline_path
        self.baseline: Dict[str, Any] = {}

        if baseline_path:
            self.load_baseline(baseline_path)

    def load_baseline(self, path: str) -> bool:
        """Load baseline results from file."""
        try:
            with open(path) as f:
                data = json.load(f)

            # Index by benchmark name
            self.baseline = {}
            for result in data.get("results", []):
                self.baseline[result["name"]] = result

            return True
        except Exception as e:
            logger.error(f"Failed to load baseline: {e}")
            return False

    def compare(
        self,
        current: BenchmarkResult,
        metric_name: str = "avg_ms"
    ) -> Optional[RegressionReport]:
        """Compare current result against baseline."""
        if current.name not in self.baseline:
            return None

        baseline_result = self.baseline[current.name]
        baseline_value = baseline_result.get(metric_name, 0)
        current_value = getattr(current, metric_name, 0)

        if baseline_value == 0:
            return None

        change = (current_value - baseline_value) / baseline_value
        change_percent = change * 100

        # Determine severity
        if change < 0:
            # Improvement, not a regression
            severity = Severity.NONE
        else:
            severity = Severity.NONE
            for sev, threshold in sorted(
                self.THRESHOLDS.items(),
                key=lambda x: x[1],
                reverse=True
            ):
                if change >= threshold:
                    severity = sev
                    break

        if severity == Severity.NONE:
            return None

        return RegressionReport(
            benchmark_name=current.name,
            baseline_value=baseline_value,
            current_value=current_value,
            change_percent=change_percent,
            severity=severity,
            message=f"{current.name} is {change_percent:.1f}% slower than baseline",
        )

    def compare_all(
        self,
        results: List[BenchmarkResult],
        metric_name: str = "avg_ms"
    ) -> List[RegressionReport]:
        """Compare all results against baseline."""
        regressions = []

        for result in results:
            report = self.compare(result, metric_name)
            if report:
                regressions.append(report)

        return regressions


# ============================================================================
# Benchmark Suite
# ============================================================================

class BenchmarkSuite:
    """
    Complete benchmark suite with all benchmarks and utilities.
    """

    # All available benchmarks
    MICRO_BENCHMARKS = [
        VATLookupBenchmark,
        XAttrBenchmark,
        FileLockBenchmark,
        SymlinkBenchmark,
        ACLBenchmark,
    ]

    MACRO_BENCHMARKS = [
        FilesystemTraversalBenchmark,
        BulkXAttrBenchmark,
        ConcurrentLockBenchmark,
        NotificationFloodBenchmark,
    ]

    STRESS_BENCHMARKS = [
        MemoryStressBenchmark,
        LockContentionBenchmark,
    ]

    def __init__(
        self,
        baseline_path: Optional[str] = None,
        iterations: Optional[int] = None
    ):
        self.baseline_path = baseline_path
        self.iterations = iterations
        self.results: List[BenchmarkResult] = []
        self.regressions: List[RegressionReport] = []
        self.system_info = SystemInfo.collect()
        self.detector = RegressionDetector(baseline_path)

    def run_benchmark(
        self,
        benchmark_class: type,
        iterations: Optional[int] = None
    ) -> BenchmarkResult:
        """Run a single benchmark."""
        benchmark = benchmark_class()
        return benchmark.run(iterations or self.iterations)

    def run_category(
        self,
        category: BenchmarkCategory,
        iterations: Optional[int] = None
    ) -> List[BenchmarkResult]:
        """Run all benchmarks in a category."""
        if category == BenchmarkCategory.MICRO:
            benchmarks = self.MICRO_BENCHMARKS
        elif category == BenchmarkCategory.MACRO:
            benchmarks = self.MACRO_BENCHMARKS
        elif category == BenchmarkCategory.STRESS:
            benchmarks = self.STRESS_BENCHMARKS
        else:
            benchmarks = []

        results = []
        for bench_class in benchmarks:
            logger.info(f"Running benchmark: {bench_class.name}")
            result = self.run_benchmark(bench_class, iterations)
            results.append(result)

        return results

    def run_all(self, iterations: Optional[int] = None) -> BenchmarkReport:
        """Run all benchmarks and return report."""
        self.results = []

        # Run all categories
        for category in [
            BenchmarkCategory.MICRO,
            BenchmarkCategory.MACRO,
            BenchmarkCategory.STRESS,
        ]:
            logger.info(f"Running {category.value} benchmarks...")
            self.results.extend(self.run_category(category, iterations))

        # Check for regressions
        if self.baseline_path:
            self.regressions = self.detector.compare_all(self.results)

        # Generate summary
        summary = self._generate_summary()

        return BenchmarkReport(
            system_info=self.system_info,
            results=self.results,
            regressions=self.regressions,
            summary=summary,
        )

    def _generate_summary(self) -> Dict[str, Any]:
        """Generate benchmark summary."""
        by_category = defaultdict(list)
        for r in self.results:
            by_category[r.category.value].append(r)

        summary = {
            "total_benchmarks": len(self.results),
            "passed": sum(1 for r in self.results if r.status == BenchmarkStatus.PASSED),
            "failed": sum(1 for r in self.results if r.status == BenchmarkStatus.FAILED),
            "regressions": len(self.regressions),
            "by_category": {},
        }

        for cat, results in by_category.items():
            summary["by_category"][cat] = {
                "count": len(results),
                "avg_duration_ms": statistics.mean(r.duration_ms for r in results) if results else 0,
            }

        return summary

    def save_results(self, path: str) -> bool:
        """Save results to JSON file."""
        try:
            report = BenchmarkReport(
                system_info=self.system_info,
                results=self.results,
                regressions=self.regressions,
                summary=self._generate_summary(),
            )

            with open(path, "w") as f:
                json.dump(report.to_dict(), f, indent=2)

            logger.info(f"Results saved to {path}")
            return True
        except Exception as e:
            logger.error(f"Failed to save results: {e}")
            return False

    def check_regressions(self, baseline_path: str) -> List[RegressionReport]:
        """Check for regressions against a baseline file."""
        detector = RegressionDetector(baseline_path)
        return detector.compare_all(self.results)

    def print_report(self, report: Optional[BenchmarkReport] = None):
        """Print benchmark report to console."""
        report = report or BenchmarkReport(
            system_info=self.system_info,
            results=self.results,
            regressions=self.regressions,
            summary=self._generate_summary(),
        )

        print("\n" + "=" * 70)
        print("INFINITE MAP PERFORMANCE BENCHMARK REPORT")
        print("=" * 70)

        print(f"\nSystem: {report.system_info.hostname}")
        print(f"Platform: {report.system_info.platform}")
        print(f"Python: {report.system_info.python_version}")
        print(f"CPUs: {report.system_info.cpu_count}")

        # Results by category
        for category in ["micro", "macro", "stress"]:
            cat_results = [r for r in report.results if r.category.value == category]
            if cat_results:
                print(f"\n{category.upper()} BENCHMARKS")
                print("-" * 50)

                for result in cat_results:
                    status = "✓" if result.status == BenchmarkStatus.PASSED else "✗"
                    print(f"  {status} {result.name}")
                    print(f"      iterations: {result.iterations}")
                    print(f"      avg: {result.avg_ms:.3f}ms, "
                          f"min: {result.min_ms:.3f}ms, "
                          f"max: {result.max_ms:.3f}ms")
                    if result.p95_ms > 0:
                        print(f"      p95: {result.p95_ms:.3f}ms, "
                              f"p99: {result.p99_ms:.3f}ms")

        # Regressions
        if report.regressions:
            print(f"\n{'='*70}")
            print("REGRESSIONS DETECTED")
            print("=" * 70)

            for reg in report.regressions:
                print(f"  ⚠ {reg.benchmark_name}: {reg.severity.value.upper()}")
                print(f"      baseline: {reg.baseline_value:.3f}ms")
                print(f"      current: {reg.current_value:.3f}ms")
                print(f"      change: +{reg.change_percent:.1f}%")

        # Summary
        print(f"\n{'='*70}")
        print("SUMMARY")
        print("=" * 70)
        print(f"  Total benchmarks: {report.summary['total_benchmarks']}")
        print(f"  Passed: {report.summary['passed']}")
        print(f"  Failed: {report.summary['failed']}")
        print(f"  Regressions: {report.summary['regressions']}")
        print("=" * 70)


# ============================================================================
# CI/CD Integration
# ============================================================================

class CIPipeline:
    """
    CI/CD pipeline integration for automated benchmarking.
    """

    def __init__(
        self,
        results_dir: str = ".benchmarks",
        baseline_branch: str = "main"
    ):
        self.results_dir = Path(results_dir)
        self.results_dir.mkdir(exist_ok=True)
        self.baseline_branch = baseline_branch

    def run_ci_benchmark(
        self,
        fail_on_regression: bool = True,
        regression_threshold: Severity = Severity.MODERATE
    ) -> Tuple[bool, BenchmarkReport]:
        """
        Run CI benchmark and check for regressions.

        Returns:
            (success, report)
        """
        suite = BenchmarkSuite()
        report = suite.run_all()

        # Save results with commit hash
        commit_hash = self._get_commit_hash()
        results_file = self.results_dir / f"results_{commit_hash}.json"
        suite.save_results(str(results_file))

        # Check for regressions above threshold
        has_blocking_regression = False

        for reg in report.regressions:
            severity_order = [Severity.NONE, Severity.MINOR, Severity.MODERATE, Severity.MAJOR, Severity.CRITICAL]
            if severity_order.index(reg.severity) >= severity_order.index(regression_threshold):
                has_blocking_regression = True
                logger.error(f"Blocking regression: {reg.benchmark_name} ({reg.severity.value})")

        success = not has_blocking_regression if fail_on_regression else True

        return success, report

    def _get_commit_hash(self) -> str:
        """Get current git commit hash."""
        import subprocess
        try:
            result = subprocess.run(
                ["git", "rev-parse", "HEAD"],
                capture_output=True,
                text=True
            )
            return result.stdout.strip()[:8]
        except Exception:
            return "unknown"

    def generate_badge_data(self, report: BenchmarkReport) -> Dict[str, Any]:
        """Generate data for CI badge."""
        return {
            "schemaVersion": 1,
            "label": "performance",
            "message": f"{report.summary['passed']}/{report.summary['total_benchmarks']} passed",
            "color": "brightgreen" if not report.regressions else "red",
        }


# ============================================================================
# CLI Entry Point
# ============================================================================

def main():
    """Main CLI entry point."""
    import argparse

    parser = argparse.ArgumentParser(description="Infinite Map Performance Benchmark Suite")
    parser.add_argument(
        "--category", "-c",
        choices=["micro", "macro", "stress", "all"],
        default="all",
        help="Benchmark category to run"
    )
    parser.add_argument(
        "--iterations", "-i",
        type=int,
        help="Number of iterations per benchmark"
    )
    parser.add_argument(
        "--output", "-o",
        help="Output file for results (JSON)"
    )
    parser.add_argument(
        "--baseline", "-b",
        help="Baseline file for regression detection"
    )
    parser.add_argument(
        "--ci",
        action="store_true",
        help="Run in CI mode (exit with error on regression)"
    )
    parser.add_argument(
        "--fail-on",
        choices=["minor", "moderate", "major", "critical"],
        default="moderate",
        help="Regression threshold for CI failure"
    )

    args = parser.parse_args()

    if args.ci:
        # CI mode
        pipeline = CIPipeline()
        threshold = {
            "minor": Severity.MINOR,
            "moderate": Severity.MODERATE,
            "major": Severity.MAJOR,
            "critical": Severity.CRITICAL,
        }[args.fail_on]

        success, report = pipeline.run_ci_benchmark(
            fail_on_regression=True,
            regression_threshold=threshold
        )

        # Print report
        suite = BenchmarkSuite()
        suite.results = report.results
        suite.regressions = report.regressions
        suite.print_report(report)

        return 0 if success else 1

    # Normal mode
    suite = BenchmarkSuite(
        baseline_path=args.baseline,
        iterations=args.iterations
    )

    if args.category == "all":
        report = suite.run_all(args.iterations)
    else:
        category_map = {
            "micro": BenchmarkCategory.MICRO,
            "macro": BenchmarkCategory.MACRO,
            "stress": BenchmarkCategory.STRESS,
        }
        results = suite.run_category(category_map[args.category], args.iterations)
        suite.results = results

        if args.baseline:
            suite.regressions = suite.check_regressions(args.baseline)

        report = BenchmarkReport(
            system_info=suite.system_info,
            results=results,
            regressions=suite.regressions,
            summary=suite._generate_summary(),
        )

    suite.print_report(report)

    if args.output:
        suite.save_results(args.output)

    return 0


if __name__ == "__main__":
    sys.exit(main())
