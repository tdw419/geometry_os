#!/usr/bin/env python3
"""
Infinite Map Performance Benchmarking Suite.

Provides comprehensive benchmarking infrastructure for measuring
and tracking performance across the Infinite Map filesystem.

Key Components:
- BenchmarkResult: Single benchmark measurement
- BenchmarkSuite: Collection of related benchmarks
- MicroBenchmark: Low-level operation benchmarks
- MacroBenchmark: Real-world workload benchmarks
- RegressionDetector: Performance regression detection
- BenchmarkRunner: Unified benchmark execution

Usage:
    from infinite_map_benchmark import BenchmarkRunner

    runner = BenchmarkRunner()
    results = runner.run_all()
    runner.save_results("benchmark_results.json")

    # Check for regressions
    regressions = runner.detect_regressions(baseline_path="baseline.json")
"""

import os
import json
import time
import tempfile
import threading
import statistics
from pathlib import Path
from dataclasses import dataclass, field
from typing import Dict, List, Optional, Any, Callable, Tuple, Union
from datetime import datetime
from enum import Enum, auto
import hashlib
import logging

# Set up logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


class BenchmarkCategory(Enum):
    """Categories of benchmarks."""
    MICRO = "micro"           # Low-level operations
    MACRO = "macro"           # Real-world workloads
    STRESS = "stress"         # Stress testing
    INTEGRATION = "integration"  # End-to-end


class BenchmarkStatus(Enum):
    """Status of a benchmark."""
    PENDING = "pending"
    RUNNING = "running"
    PASSED = "passed"
    FAILED = "failed"
    SKIPPED = "skipped"
    REGRESSION = "regression"


@dataclass
class BenchmarkResult:
    """Result of a single benchmark run."""
    name: str
    category: BenchmarkCategory
    timestamp: datetime
    duration_ms: float
    iterations: int
    operations_per_second: float
    avg_latency_ms: float
    min_latency_ms: float
    max_latency_ms: float
    p50_latency_ms: float
    p95_latency_ms: float
    p99_latency_ms: float
    memory_bytes: Optional[int] = None
    status: BenchmarkStatus = BenchmarkStatus.PASSED
    error_message: Optional[str] = None
    metadata: Dict[str, Any] = field(default_factory=dict)

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary."""
        return {
            "name": self.name,
            "category": self.category.value,
            "timestamp": self.timestamp.isoformat(),
            "duration_ms": self.duration_ms,
            "iterations": self.iterations,
            "operations_per_second": round(self.operations_per_second, 2),
            "latency": {
                "avg_ms": round(self.avg_latency_ms, 4),
                "min_ms": round(self.min_latency_ms, 4),
                "max_ms": round(self.max_latency_ms, 4),
                "p50_ms": round(self.p50_latency_ms, 4),
                "p95_ms": round(self.p95_latency_ms, 4),
                "p99_ms": round(self.p99_latency_ms, 4),
            },
            "memory_bytes": self.memory_bytes,
            "status": self.status.value,
            "error_message": self.error_message,
            "metadata": self.metadata,
        }

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> 'BenchmarkResult':
        """Create from dictionary."""
        latency = data.get("latency", {})
        return cls(
            name=data["name"],
            category=BenchmarkCategory(data["category"]),
            timestamp=datetime.fromisoformat(data["timestamp"]),
            duration_ms=data["duration_ms"],
            iterations=data["iterations"],
            operations_per_second=data["operations_per_second"],
            avg_latency_ms=latency.get("avg_ms", 0),
            min_latency_ms=latency.get("min_ms", 0),
            max_latency_ms=latency.get("max_ms", 0),
            p50_latency_ms=latency.get("p50_ms", 0),
            p95_latency_ms=latency.get("p95_ms", 0),
            p99_latency_ms=latency.get("p99_ms", 0),
            memory_bytes=data.get("memory_bytes"),
            status=BenchmarkStatus(data.get("status", "passed")),
            error_message=data.get("error_message"),
            metadata=data.get("metadata", {}),
        )


@dataclass
class BenchmarkConfig:
    """Configuration for benchmark execution."""
    warmup_iterations: int = 5
    measurement_iterations: int = 100
    timeout_seconds: float = 60.0
    memory_tracking: bool = True
    gc_between_runs: bool = True
    parallel_execution: bool = False
    max_workers: int = 4


class MicroBenchmark:
    """
    Micro-benchmarks for low-level operations.

    Measures performance of individual operations like
    VAT lookups, Hilbert curve calculations, etc.
    """

    def __init__(self, config: Optional[BenchmarkConfig] = None):
        self.config = config or BenchmarkConfig()
        self.results: List[BenchmarkResult] = []

    def benchmark_vat_lookup(self, grid_size: int = 256) -> BenchmarkResult:
        """Benchmark VAT file lookup operation."""
        from systems.pixel_compiler.infinite_map_v2 import VisualAllocationTable

        vat = VisualAllocationTable(grid_size=grid_size)

        # Populate with entries
        for i in range(1000):
            vat.allocate_sequential(f"file_{i}", 4096)

        latencies = []

        def measure_lookup():
            start = time.perf_counter_ns()
            for i in range(100):
                vat.lookup(f"file_{i * 10}")
            end = time.perf_counter_ns()
            return (end - start) / 100  # ns per lookup

        # Warmup
        for _ in range(self.config.warmup_iterations):
            measure_lookup()

        # Measure
        for _ in range(self.config.measurement_iterations):
            latencies.append(measure_lookup())

        # Calculate statistics
        latencies_ms = [l / 1_000_000 for l in latencies]
        avg_latency = statistics.mean(latencies_ms)
        ops_per_sec = 1000 / avg_latency if avg_latency > 0 else 0

        result = BenchmarkResult(
            name="vat_lookup",
            category=BenchmarkCategory.MICRO,
            timestamp=datetime.now(),
            duration_ms=sum(latencies_ms),
            iterations=self.config.measurement_iterations,
            operations_per_second=ops_per_sec * 100,  # 100 lookups per iteration
            avg_latency_ms=avg_latency,
            min_latency_ms=min(latencies_ms),
            max_latency_ms=max(latencies_ms),
            p50_latency_ms=statistics.median(latencies_ms),
            p95_latency_ms=statistics.quantiles(latencies_ms, n=100)[94] if len(latencies_ms) >= 100 else max(latencies_ms),
            p99_latency_ms=statistics.quantiles(latencies_ms, n=100)[98] if len(latencies_ms) >= 100 else max(latencies_ms),
            metadata={"grid_size": grid_size, "entries": 1000},
        )

        self.results.append(result)
        return result

    def benchmark_hilbert_coordinates(self, grid_size: int = 256) -> BenchmarkResult:
        """Benchmark Hilbert curve coordinate calculation."""
        from systems.pixel_compiler.pixelrts_v2_core import HilbertCurve

        curve = HilbertCurve(grid_size)
        lut = curve.generate_lut()

        latencies = []

        def measure_coord():
            start = time.perf_counter_ns()
            for i in range(1000):
                x, y = lut[i % len(lut)]
            end = time.perf_counter_ns()
            return (end - start) / 1000  # ns per lookup

        # Warmup
        for _ in range(self.config.warmup_iterations):
            measure_coord()

        # Measure
        for _ in range(self.config.measurement_iterations):
            latencies.append(measure_coord())

        latencies_ms = [l / 1_000_000 for l in latencies]
        avg_latency = statistics.mean(latencies_ms)
        ops_per_sec = 1000 / avg_latency if avg_latency > 0 else 0

        result = BenchmarkResult(
            name="hilbert_coordinates",
            category=BenchmarkCategory.MICRO,
            timestamp=datetime.now(),
            duration_ms=sum(latencies_ms),
            iterations=self.config.measurement_iterations,
            operations_per_second=ops_per_sec * 1000,
            avg_latency_ms=avg_latency,
            min_latency_ms=min(latencies_ms),
            max_latency_ms=max(latencies_ms),
            p50_latency_ms=statistics.median(latencies_ms),
            p95_latency_ms=statistics.quantiles(latencies_ms, n=100)[94] if len(latencies_ms) >= 100 else max(latencies_ms),
            p99_latency_ms=statistics.quantiles(latencies_ms, n=100)[98] if len(latencies_ms) >= 100 else max(latencies_ms),
            metadata={"grid_size": grid_size},
        )

        self.results.append(result)
        return result

    def benchmark_cluster_allocation(self, grid_size: int = 256) -> BenchmarkResult:
        """Benchmark cluster allocation."""
        from systems.pixel_compiler.infinite_map_v2 import VisualAllocationTable

        latencies = []

        def measure_allocation():
            vat = VisualAllocationTable(grid_size=grid_size)
            start = time.perf_counter_ns()
            for i in range(100):
                vat.allocate_sequential(f"file_{i}", 4096)
            end = time.perf_counter_ns()
            return (end - start) / 100  # ns per allocation

        # Warmup
        for _ in range(self.config.warmup_iterations):
            measure_allocation()

        # Measure
        for _ in range(self.config.measurement_iterations):
            latencies.append(measure_allocation())

        latencies_ms = [l / 1_000_000 for l in latencies]
        avg_latency = statistics.mean(latencies_ms)
        ops_per_sec = 1000 / avg_latency if avg_latency > 0 else 0

        result = BenchmarkResult(
            name="cluster_allocation",
            category=BenchmarkCategory.MICRO,
            timestamp=datetime.now(),
            duration_ms=sum(latencies_ms),
            iterations=self.config.measurement_iterations,
            operations_per_second=ops_per_sec * 100,
            avg_latency_ms=avg_latency,
            min_latency_ms=min(latencies_ms),
            max_latency_ms=max(latencies_ms),
            p50_latency_ms=statistics.median(latencies_ms),
            p95_latency_ms=statistics.quantiles(latencies_ms, n=100)[94] if len(latencies_ms) >= 100 else max(latencies_ms),
            p99_latency_ms=statistics.quantiles(latencies_ms, n=100)[98] if len(latencies_ms) >= 100 else max(latencies_ms),
            metadata={"grid_size": grid_size, "clusters_per_iter": 100},
        )

        self.results.append(result)
        return result

    def benchmark_checksum_calculation(self, data_size: int = 4096) -> BenchmarkResult:
        """Benchmark checksum calculation."""
        from systems.pixel_compiler.infinite_map_integrity import ChecksumCalculator, ChecksumAlgorithm

        data = os.urandom(data_size)
        calculator = ChecksumCalculator(ChecksumAlgorithm.SHA256)

        latencies = []

        def measure_checksum():
            start = time.perf_counter_ns()
            calculator.calculate(data)
            end = time.perf_counter_ns()
            return end - start

        # Warmup
        for _ in range(self.config.warmup_iterations):
            measure_checksum()

        # Measure
        for _ in range(self.config.measurement_iterations):
            latencies.append(measure_checksum())

        latencies_ms = [l / 1_000_000 for l in latencies]
        avg_latency = statistics.mean(latencies_ms)
        throughput_mbps = (data_size / (1024 * 1024)) / (avg_latency / 1000) if avg_latency > 0 else 0

        result = BenchmarkResult(
            name="checksum_calculation",
            category=BenchmarkCategory.MICRO,
            timestamp=datetime.now(),
            duration_ms=sum(latencies_ms),
            iterations=self.config.measurement_iterations,
            operations_per_second=1000 / avg_latency if avg_latency > 0 else 0,
            avg_latency_ms=avg_latency,
            min_latency_ms=min(latencies_ms),
            max_latency_ms=max(latencies_ms),
            p50_latency_ms=statistics.median(latencies_ms),
            p95_latency_ms=statistics.quantiles(latencies_ms, n=100)[94] if len(latencies_ms) >= 100 else max(latencies_ms),
            p99_latency_ms=statistics.quantiles(latencies_ms, n=100)[98] if len(latencies_ms) >= 100 else max(latencies_ms),
            metadata={"data_size": data_size, "throughput_mbps": round(throughput_mbps, 2)},
        )

        self.results.append(result)
        return result


class MacroBenchmark:
    """
    Macro-benchmarks for real-world workloads.

    Measures performance of complete workflows like
    building an image, reading files, etc.
    """

    def __init__(self, config: Optional[BenchmarkConfig] = None):
        self.config = config or BenchmarkConfig()
        self.results: List[BenchmarkResult] = []

    def benchmark_image_build(self, file_count: int = 100, file_size: int = 1024) -> BenchmarkResult:
        """Benchmark building an infinite map image."""
        latencies = []

        with tempfile.TemporaryDirectory() as tmpdir:
            source = Path(tmpdir) / "source"
            source.mkdir()

            # Create source files
            for i in range(file_count):
                (source / f"file_{i}.bin").write_bytes(os.urandom(file_size))

            def measure_build():
                from systems.pixel_compiler.infinite_map_v2 import InfiniteMapBuilderV2

                output = Path(tmpdir) / f"test_{time.perf_counter_ns()}.rts.png"
                start = time.perf_counter_ns()
                builder = InfiniteMapBuilderV2(str(source), str(output), grid_size=256)
                builder.build()
                end = time.perf_counter_ns()
                output.unlink(missing_ok=True)
                return end - start

            # Warmup
            for _ in range(min(3, self.config.warmup_iterations)):
                try:
                    measure_build()
                except Exception:
                    pass

            # Measure
            for _ in range(min(10, self.config.measurement_iterations)):
                try:
                    latencies.append(measure_build())
                except Exception as e:
                    logger.error(f"Build failed: {e}")

        if not latencies:
            return BenchmarkResult(
                name="image_build",
                category=BenchmarkCategory.MACRO,
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
                error_message="All iterations failed",
            )

        latencies_ms = [l / 1_000_000 for l in latencies]
        avg_latency = statistics.mean(latencies_ms)
        total_size = file_count * file_size
        throughput_mbps = (total_size / (1024 * 1024)) / (avg_latency / 1000) if avg_latency > 0 else 0

        result = BenchmarkResult(
            name="image_build",
            category=BenchmarkCategory.MACRO,
            timestamp=datetime.now(),
            duration_ms=sum(latencies_ms),
            iterations=len(latencies),
            operations_per_second=1000 / avg_latency if avg_latency > 0 else 0,
            avg_latency_ms=avg_latency,
            min_latency_ms=min(latencies_ms),
            max_latency_ms=max(latencies_ms),
            p50_latency_ms=statistics.median(latencies_ms),
            p95_latency_ms=statistics.quantiles(latencies_ms, n=100)[94] if len(latencies_ms) >= 100 else max(latencies_ms),
            p99_latency_ms=statistics.quantiles(latencies_ms, n=100)[98] if len(latencies_ms) >= 100 else max(latencies_ms),
            metadata={
                "file_count": file_count,
                "file_size": file_size,
                "total_size_kb": (file_count * file_size) // 1024,
                "throughput_mbps": round(throughput_mbps, 2),
            },
        )

        self.results.append(result)
        return result

    def benchmark_sequential_read(self, file_count: int = 100) -> BenchmarkResult:
        """Benchmark sequential file reading."""
        from systems.pixel_compiler.infinite_map_v2 import InfiniteMapBuilderV2

        latencies = []

        with tempfile.TemporaryDirectory() as tmpdir:
            # Build test image
            source = Path(tmpdir) / "source"
            source.mkdir()

            for i in range(file_count):
                (source / f"file_{i}.bin").write_bytes(os.urandom(1024))

            output = Path(tmpdir) / "test.rts.png"
            builder = InfiniteMapBuilderV2(str(source), str(output), grid_size=256)
            builder.build()

            # Measure sequential read
            def measure_read():
                start = time.perf_counter_ns()
                for i in range(file_count):
                    builder.vat.lookup(f"file_{i}.bin")
                end = time.perf_counter_ns()
                return end - start

            # Warmup
            for _ in range(self.config.warmup_iterations):
                measure_read()

            # Measure
            for _ in range(self.config.measurement_iterations):
                latencies.append(measure_read())

        latencies_ms = [l / 1_000_000 for l in latencies]
        avg_latency = statistics.mean(latencies_ms)
        per_file_latency = avg_latency / file_count

        result = BenchmarkResult(
            name="sequential_read",
            category=BenchmarkCategory.MACRO,
            timestamp=datetime.now(),
            duration_ms=sum(latencies_ms),
            iterations=self.config.measurement_iterations,
            operations_per_second=1000 / per_file_latency if per_file_latency > 0 else 0,
            avg_latency_ms=avg_latency,
            min_latency_ms=min(latencies_ms),
            max_latency_ms=max(latencies_ms),
            p50_latency_ms=statistics.median(latencies_ms),
            p95_latency_ms=statistics.quantiles(latencies_ms, n=100)[94] if len(latencies_ms) >= 100 else max(latencies_ms),
            p99_latency_ms=statistics.quantiles(latencies_ms, n=100)[98] if len(latencies_ms) >= 100 else max(latencies_ms),
            metadata={"file_count": file_count, "per_file_ms": round(per_file_latency, 4)},
        )

        self.results.append(result)
        return result


class StressBenchmark:
    """
    Stress benchmarks for extreme conditions.

    Tests behavior under high load and resource constraints.
    """

    def __init__(self, config: Optional[BenchmarkConfig] = None):
        self.config = config or BenchmarkConfig()
        self.results: List[BenchmarkResult] = []

    def benchmark_concurrent_access(self, thread_count: int = 8) -> BenchmarkResult:
        """Benchmark concurrent VAT access."""
        from systems.pixel_compiler.infinite_map_v2 import VisualAllocationTable

        vat = VisualAllocationTable(grid_size=256)

        # Pre-populate
        for i in range(1000):
            vat.allocate_sequential(f"file_{i}", 4096)

        errors = []
        latencies = []

        def access_vat(thread_id: int):
            try:
                thread_latencies = []
                for i in range(100):
                    start = time.perf_counter_ns()
                    vat.lookup(f"file_{(thread_id * 100 + i) % 1000}")
                    end = time.perf_counter_ns()
                    thread_latencies.append(end - start)
                return thread_latencies
            except Exception as e:
                errors.append(str(e))
                return []

        start = time.perf_counter_ns()

        threads = []
        thread_results = []
        for i in range(thread_count):
            t = threading.Thread(target=lambda tid=i: thread_results.append(access_vat(tid)))
            threads.append(t)
            t.start()

        for t in threads:
            t.join()

        end = time.perf_counter_ns()
        total_duration_ns = end - start

        # Collect latencies
        for result in thread_results:
            latencies.extend(result)

        if not latencies:
            return BenchmarkResult(
                name="concurrent_access",
                category=BenchmarkCategory.STRESS,
                timestamp=datetime.now(),
                duration_ms=total_duration_ns / 1_000_000,
                iterations=thread_count * 100,
                operations_per_second=0,
                avg_latency_ms=0,
                min_latency_ms=0,
                max_latency_ms=0,
                p50_latency_ms=0,
                p95_latency_ms=0,
                p99_latency_ms=0,
                status=BenchmarkStatus.FAILED,
                error_message="; ".join(errors) if errors else "No latencies collected",
            )

        latencies_ms = [l / 1_000_000 for l in latencies]
        total_duration_ms = total_duration_ns / 1_000_000
        total_ops = thread_count * 100
        ops_per_sec = total_ops / (total_duration_ms / 1000)

        result = BenchmarkResult(
            name="concurrent_access",
            category=BenchmarkCategory.STRESS,
            timestamp=datetime.now(),
            duration_ms=total_duration_ms,
            iterations=total_ops,
            operations_per_second=ops_per_sec,
            avg_latency_ms=statistics.mean(latencies_ms),
            min_latency_ms=min(latencies_ms),
            max_latency_ms=max(latencies_ms),
            p50_latency_ms=statistics.median(latencies_ms),
            p95_latency_ms=statistics.quantiles(latencies_ms, n=100)[94] if len(latencies_ms) >= 100 else max(latencies_ms),
            p99_latency_ms=statistics.quantiles(latencies_ms, n=100)[98] if len(latencies_ms) >= 100 else max(latencies_ms),
            status=BenchmarkStatus.FAILED if errors else BenchmarkStatus.PASSED,
            error_message="; ".join(errors) if errors else None,
            metadata={"thread_count": thread_count, "error_count": len(errors)},
        )

        self.results.append(result)
        return result

    def benchmark_large_allocation(self, cluster_count: int = 10000) -> BenchmarkResult:
        """Benchmark allocating many clusters."""
        from systems.pixel_compiler.infinite_map_v2 import VisualAllocationTable

        latencies = []

        def measure():
            vat = VisualAllocationTable(grid_size=512)
            start = time.perf_counter_ns()
            for i in range(cluster_count):
                vat.allocate_sequential(f"file_{i}", 4096)
            end = time.perf_counter_ns()
            return end - start

        # Warmup with smaller count
        for _ in range(min(3, self.config.warmup_iterations)):
            try:
                from systems.pixel_compiler.infinite_map_v2 import VisualAllocationTable
                vat = VisualAllocationTable(grid_size=256)
                for i in range(100):
                    vat.allocate_sequential(f"warmup_{i}", 4096)
            except Exception:
                pass

        # Measure
        for _ in range(min(5, self.config.measurement_iterations)):
            try:
                latencies.append(measure())
            except Exception as e:
                logger.error(f"Large allocation failed: {e}")

        if not latencies:
            return BenchmarkResult(
                name="large_allocation",
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
                error_message="All iterations failed",
            )

        latencies_ms = [l / 1_000_000 for l in latencies]
        avg_latency = statistics.mean(latencies_ms)
        per_cluster = avg_latency / cluster_count

        result = BenchmarkResult(
            name="large_allocation",
            category=BenchmarkCategory.STRESS,
            timestamp=datetime.now(),
            duration_ms=sum(latencies_ms),
            iterations=len(latencies),
            operations_per_second=1000 / per_cluster if per_cluster > 0 else 0,
            avg_latency_ms=avg_latency,
            min_latency_ms=min(latencies_ms),
            max_latency_ms=max(latencies_ms),
            p50_latency_ms=statistics.median(latencies_ms),
            p95_latency_ms=statistics.quantiles(latencies_ms, n=100)[94] if len(latencies_ms) >= 100 else max(latencies_ms),
            p99_latency_ms=statistics.quantiles(latencies_ms, n=100)[98] if len(latencies_ms) >= 100 else max(latencies_ms),
            metadata={"cluster_count": cluster_count, "per_cluster_us": round(per_cluster * 1000, 4)},
        )

        self.results.append(result)
        return result


@dataclass
class RegressionThreshold:
    """Threshold for regression detection."""
    metric: str
    max_degradation_percent: float


class RegressionDetector:
    """
    Detects performance regressions by comparing
    current results against baseline.
    """

    def __init__(self, thresholds: Optional[List[RegressionThreshold]] = None):
        self.thresholds = thresholds or [
            RegressionThreshold("avg_latency_ms", 20.0),  # 20% degradation
            RegressionThreshold("operations_per_second", 15.0),
        ]

    def compare_results(
        self,
        current: BenchmarkResult,
        baseline: BenchmarkResult
    ) -> List[Dict[str, Any]]:
        """Compare current result against baseline."""
        regressions = []

        for threshold in self.thresholds:
            current_val = getattr(current, threshold.metric, None)
            baseline_val = getattr(baseline, threshold.metric, None)

            if current_val is None or baseline_val is None:
                continue
            if baseline_val == 0:
                continue

            # Calculate change (positive = slower, negative = faster)
            if "latency" in threshold.metric:
                # For latency, increase is bad
                change_percent = ((current_val - baseline_val) / baseline_val) * 100
                is_regression = change_percent > threshold.max_degradation_percent
            else:
                # For throughput, decrease is bad
                change_percent = ((baseline_val - current_val) / baseline_val) * 100
                is_regression = change_percent > threshold.max_degradation_percent

            if is_regression:
                regressions.append({
                    "metric": threshold.metric,
                    "baseline": baseline_val,
                    "current": current_val,
                    "change_percent": round(change_percent, 2),
                    "threshold_percent": threshold.max_degradation_percent,
                })

        return regressions

    def detect_regressions(
        self,
        current_results: List[BenchmarkResult],
        baseline_results: List[BenchmarkResult]
    ) -> Dict[str, List[Dict[str, Any]]]:
        """Detect all regressions across results."""
        regressions = {}

        baseline_by_name = {r.name: r for r in baseline_results}

        for current in current_results:
            baseline = baseline_by_name.get(current.name)
            if baseline:
                result_regressions = self.compare_results(current, baseline)
                if result_regressions:
                    regressions[current.name] = result_regressions

        return regressions


class BenchmarkRunner:
    """
    Unified benchmark execution interface.

    Runs all benchmarks and produces reports.
    """

    def __init__(self, config: Optional[BenchmarkConfig] = None):
        self.config = config or BenchmarkConfig()
        self.results: List[BenchmarkResult] = []
        self.micro = MicroBenchmark(config)
        self.macro = MacroBenchmark(config)
        self.stress = StressBenchmark(config)
        self.regression_detector = RegressionDetector()

    def run_all(self) -> List[BenchmarkResult]:
        """Run all benchmarks."""
        logger.info("Running all benchmarks...")
        self.results = []

        # Micro benchmarks
        logger.info("Running micro benchmarks...")
        try:
            self.results.append(self.micro.benchmark_vat_lookup())
        except Exception as e:
            logger.error(f"VAT lookup benchmark failed: {e}")

        try:
            self.results.append(self.micro.benchmark_hilbert_coordinates())
        except Exception as e:
            logger.error(f"Hilbert benchmark failed: {e}")

        try:
            self.results.append(self.micro.benchmark_cluster_allocation())
        except Exception as e:
            logger.error(f"Cluster allocation benchmark failed: {e}")

        try:
            self.results.append(self.micro.benchmark_checksum_calculation())
        except Exception as e:
            logger.error(f"Checksum benchmark failed: {e}")

        # Macro benchmarks
        logger.info("Running macro benchmarks...")
        try:
            self.results.append(self.macro.benchmark_image_build())
        except Exception as e:
            logger.error(f"Image build benchmark failed: {e}")

        try:
            self.results.append(self.macro.benchmark_sequential_read())
        except Exception as e:
            logger.error(f"Sequential read benchmark failed: {e}")

        # Stress benchmarks
        logger.info("Running stress benchmarks...")
        try:
            self.results.append(self.stress.benchmark_concurrent_access())
        except Exception as e:
            logger.error(f"Concurrent access benchmark failed: {e}")

        try:
            self.results.append(self.stress.benchmark_large_allocation())
        except Exception as e:
            logger.error(f"Large allocation benchmark failed: {e}")

        logger.info(f"Completed {len(self.results)} benchmarks")
        return self.results

    def run_category(self, category: BenchmarkCategory) -> List[BenchmarkResult]:
        """Run benchmarks for a specific category."""
        if category == BenchmarkCategory.MICRO:
            return [
                self.micro.benchmark_vat_lookup(),
                self.micro.benchmark_hilbert_coordinates(),
                self.micro.benchmark_cluster_allocation(),
                self.micro.benchmark_checksum_calculation(),
            ]
        elif category == BenchmarkCategory.MACRO:
            return [
                self.macro.benchmark_image_build(),
                self.macro.benchmark_sequential_read(),
            ]
        elif category == BenchmarkCategory.STRESS:
            return [
                self.stress.benchmark_concurrent_access(),
                self.stress.benchmark_large_allocation(),
            ]
        return []

    def save_results(self, path: str) -> None:
        """Save results to JSON file."""
        data = {
            "timestamp": datetime.now().isoformat(),
            "config": {
                "warmup_iterations": self.config.warmup_iterations,
                "measurement_iterations": self.config.measurement_iterations,
                "timeout_seconds": self.config.timeout_seconds,
            },
            "results": [r.to_dict() for r in self.results],
        }

        with open(path, 'w') as f:
            json.dump(data, f, indent=2)

        logger.info(f"Saved {len(self.results)} results to {path}")

    def load_results(self, path: str) -> List[BenchmarkResult]:
        """Load results from JSON file."""
        with open(path, 'r') as f:
            data = json.load(f)

        results = [BenchmarkResult.from_dict(r) for r in data.get("results", [])]
        logger.info(f"Loaded {len(results)} results from {path}")
        return results

    def detect_regressions(
        self,
        baseline_path: str
    ) -> Dict[str, List[Dict[str, Any]]]:
        """Detect regressions against baseline."""
        if not self.results:
            self.run_all()

        baseline = self.load_results(baseline_path)
        return self.regression_detector.detect_regressions(self.results, baseline)

    def get_summary(self) -> Dict[str, Any]:
        """Get summary of all results."""
        if not self.results:
            return {"error": "No results available"}

        by_category = {}
        for r in self.results:
            cat = r.category.value
            if cat not in by_category:
                by_category[cat] = []
            by_category[cat].append(r.name)

        passed = sum(1 for r in self.results if r.status == BenchmarkStatus.PASSED)
        failed = sum(1 for r in self.results if r.status == BenchmarkStatus.FAILED)

        return {
            "total_benchmarks": len(self.results),
            "passed": passed,
            "failed": failed,
            "categories": by_category,
            "timestamp": datetime.now().isoformat(),
        }

    def print_report(self) -> str:
        """Print formatted benchmark report."""
        lines = []
        lines.append("=" * 70)
        lines.append("INFINITE MAP BENCHMARK REPORT")
        lines.append("=" * 70)
        lines.append(f"Timestamp: {datetime.now().isoformat()}")
        lines.append(f"Config: iterations={self.config.measurement_iterations}")
        lines.append("")

        for category in BenchmarkCategory:
            cat_results = [r for r in self.results if r.category == category]
            if not cat_results:
                continue

            lines.append(f"\n{category.value.upper()} BENCHMARKS")
            lines.append("-" * 50)

            for r in cat_results:
                lines.append(f"\n  {r.name}:")
                lines.append(f"    Status: {r.status.value}")
                if r.status == BenchmarkStatus.FAILED:
                    lines.append(f"    Error: {r.error_message}")
                else:
                    lines.append(f"    Ops/sec: {r.operations_per_second:,.2f}")
                    lines.append(f"    Avg latency: {r.avg_latency_ms:.4f} ms")
                    lines.append(f"    P50/P95/P99: {r.p50_latency_ms:.4f}/{r.p95_latency_ms:.4f}/{r.p99_latency_ms:.4f} ms")
                    if r.metadata:
                        for k, v in r.metadata.items():
                            lines.append(f"    {k}: {v}")

        lines.append("\n" + "=" * 70)
        summary = self.get_summary()
        lines.append(f"SUMMARY: {summary['passed']}/{summary['total_benchmarks']} passed")
        lines.append("=" * 70)

        return "\n".join(lines)


# Convenience functions
def run_benchmarks(output_path: Optional[str] = None) -> List[BenchmarkResult]:
    """Run all benchmarks and optionally save results."""
    runner = BenchmarkRunner()
    results = runner.run_all()

    if output_path:
        runner.save_results(output_path)

    print(runner.print_report())
    return results


def check_regressions(baseline_path: str, current_path: Optional[str] = None) -> Dict[str, Any]:
    """Check for regressions against baseline."""
    runner = BenchmarkRunner()

    if current_path:
        runner.results = runner.load_results(current_path)
    else:
        runner.run_all()

    regressions = runner.detect_regressions(baseline_path)
    return {
        "has_regressions": len(regressions) > 0,
        "regressions": regressions,
        "summary": runner.get_summary(),
    }


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description="Infinite Map Benchmark Suite")
    parser.add_argument("--output", "-o", help="Output JSON file")
    parser.add_argument("--baseline", "-b", help="Baseline JSON for regression detection")
    parser.add_argument("--category", "-c", choices=["micro", "macro", "stress", "all"],
                        default="all", help="Category to run")

    args = parser.parse_args()

    runner = BenchmarkRunner()

    if args.category == "all":
        runner.run_all()
    else:
        category = BenchmarkCategory(args.category)
        runner.run_category(category)

    if args.output:
        runner.save_results(args.output)

    print(runner.print_report())

    if args.baseline:
        regressions = runner.detect_regressions(args.baseline)
        if regressions:
            print("\n" + "!" * 70)
            print("PERFORMANCE REGRESSIONS DETECTED")
            print("!" * 70)
            for name, details in regressions.items():
                print(f"\n{name}:")
                for d in details:
                    print(f"  {d['metric']}: {d['change_percent']}% slower")
                    print(f"    Baseline: {d['baseline']}")
                    print(f"    Current: {d['current']}")
        else:
            print("\nNo regressions detected.")
