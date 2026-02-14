# systems/pixel_compiler/benchmarks/wasm_gpu_benchmark.py
"""
WASM GPU Performance Benchmark Suite

Measures execution latency, throughput, and identifies bottlenecks
for WASM code running on GPU via WebGPU.

Features:
- Warmup iterations to stabilize performance
- Precise timing with perf_counter_ns
- P50/P95/P99 percentile statistics
- Comparison between baseline and optimized implementations
- Markdown report generation
- JSON result export
"""
import time
import statistics
from dataclasses import dataclass, field
from typing import List, Dict, Any, Optional, Callable
from pathlib import Path
import json


@dataclass
class BenchmarkResult:
    """Result of a single benchmark run."""
    name: str
    iterations: int
    total_time_ms: float
    avg_time_ms: float
    min_time_ms: float
    max_time_ms: float
    p50_ms: float
    p95_ms: float
    p99_ms: float
    throughput_ops_per_sec: float
    metadata: Dict[str, Any] = field(default_factory=dict)


@dataclass
class ComparisonResult:
    """Comparison between baseline and optimized results."""
    baseline: BenchmarkResult
    optimized: BenchmarkResult
    speedup: float
    improvement_pct: float


class WASMGPUBenchmark:
    """
    Benchmark suite for WASM GPU execution.

    Measures performance characteristics of WASM code execution
    on GPU, providing detailed statistics for optimization analysis.
    """

    def __init__(self, warmup_iterations: int = 5):
        """
        Initialize benchmark suite.

        Args:
            warmup_iterations: Number of warmup iterations before actual benchmarking
        """
        self.warmup_iterations = warmup_iterations
        self.results: List[BenchmarkResult] = []

    def benchmark_execution(
        self,
        name: str,
        execution_fn: Callable[[], Any],
        iterations: int = 100
    ) -> BenchmarkResult:
        """
        Benchmark a WASM execution function.

        Args:
            name: Benchmark name
            execution_fn: Function to benchmark (should execute WASM)
            iterations: Number of iterations

        Returns:
            BenchmarkResult with timing statistics
        """
        # Warmup
        for _ in range(self.warmup_iterations):
            try:
                execution_fn()
            except Exception:
                # Allow warmup to fail gracefully
                pass

        # Actual benchmark
        times_ms: List[float] = []
        for _ in range(iterations):
            start = time.perf_counter_ns()
            execution_fn()
            end = time.perf_counter_ns()
            times_ms.append((end - start) / 1_000_000)  # ns to ms

        total_time = sum(times_ms)
        sorted_times = sorted(times_ms)

        # Calculate percentiles
        p50_idx = len(sorted_times) // 2
        p95_idx = int(len(sorted_times) * 0.95)
        p99_idx = int(len(sorted_times) * 0.99)

        result = BenchmarkResult(
            name=name,
            iterations=iterations,
            total_time_ms=total_time,
            avg_time_ms=statistics.mean(times_ms),
            min_time_ms=min(times_ms),
            max_time_ms=max(times_ms),
            p50_ms=sorted_times[p50_idx],
            p95_ms=sorted_times[p95_idx] if p95_idx < len(sorted_times) else sorted_times[-1],
            p99_ms=sorted_times[p99_idx] if p99_idx < len(sorted_times) else sorted_times[-1],
            throughput_ops_per_sec=1000 / (total_time / iterations) if total_time > 0 else 0,
        )
        self.results.append(result)
        return result

    def compare(
        self,
        baseline_name: str,
        optimized_name: str
    ) -> Optional[ComparisonResult]:
        """
        Compare two benchmark results.

        Args:
            baseline_name: Name of baseline benchmark
            optimized_name: Name of optimized benchmark

        Returns:
            ComparisonResult with speedup metrics, or None if not found
        """
        baseline = next((r for r in self.results if r.name == baseline_name), None)
        optimized = next((r for r in self.results if r.name == optimized_name), None)

        if not baseline or not optimized:
            return None

        # Calculate speedup (baseline / optimized)
        # Higher is better: 2.0 means optimized is 2x faster
        speedup = baseline.avg_time_ms / optimized.avg_time_ms if optimized.avg_time_ms > 0 else 0

        # Calculate improvement percentage
        # Positive means optimized is faster
        improvement = ((baseline.avg_time_ms - optimized.avg_time_ms) / baseline.avg_time_ms * 100) if baseline.avg_time_ms > 0 else 0

        return ComparisonResult(
            baseline=baseline,
            optimized=optimized,
            speedup=speedup,
            improvement_pct=improvement
        )

    def generate_report(self) -> str:
        """
        Generate markdown report of all results.

        Returns:
            Markdown formatted report string
        """
        lines = ["# WASM GPU Benchmark Report\n"]
        lines.append(f"Generated: {time.strftime('%Y-%m-%d %H:%M:%S')}\n")
        lines.append("## Results\n")
        lines.append("| Benchmark | Iterations | Avg (ms) | P50 (ms) | P95 (ms) | P99 (ms) | Throughput (ops/s) |")
        lines.append("|-----------|------------|----------|----------|----------|----------|-------------------|")

        for r in self.results:
            lines.append(
                f"| {r.name} | {r.iterations} | {r.avg_time_ms:.3f} | "
                f"{r.p50_ms:.3f} | {r.p95_ms:.3f} | {r.p99_ms:.3f} | "
                f"{r.throughput_ops_per_sec:.1f} |"
            )

        # Add comparison section if we have pairs
        lines.append("\n## Comparisons")
        comparison_pairs = []
        for i, baseline in enumerate(self.results):
            for optimized in self.results[i+1:]:
                comparison = self.compare(baseline.name, optimized.name)
                if comparison:
                    comparison_pairs.append(comparison)

        if comparison_pairs:
            lines.append("| Baseline | Optimized | Speedup | Improvement |")
            lines.append("|----------|-----------|---------|-------------|")
            for c in comparison_pairs:
                lines.append(
                    f"| {c.baseline.name} | {c.optimized.name} | "
                    f"{c.speedup:.2f}x | {c.improvement_pct:.1f}% |"
                )

        return "\n".join(lines)

    def save_results(self, path: str) -> None:
        """
        Save results to JSON file.

        Args:
            path: Path to save JSON file
        """
        data = {
            "timestamp": time.strftime('%Y-%m-%d %H:%M:%S'),
            "results": [
                {
                    "name": r.name,
                    "iterations": r.iterations,
                    "total_time_ms": r.total_time_ms,
                    "avg_time_ms": r.avg_time_ms,
                    "min_time_ms": r.min_time_ms,
                    "max_time_ms": r.max_time_ms,
                    "p50_ms": r.p50_ms,
                    "p95_ms": r.p95_ms,
                    "p99_ms": r.p99_ms,
                    "throughput_ops_per_sec": r.throughput_ops_per_sec,
                    "metadata": r.metadata,
                }
                for r in self.results
            ]
        }
        with open(path, 'w') as f:
            json.dump(data, f, indent=2)

    def clear_results(self) -> None:
        """Clear all stored results."""
        self.results.clear()


# Standard benchmark programs
# Minimal valid WASM binaries for testing

FIBONACCI_WASM = bytes([
    0x00, 0x61, 0x73, 0x6d, 0x01, 0x00, 0x00, 0x00,  # magic + version
    # Type section (i32 -> i32)
    0x01, 0x07, 0x01, 0x60, 0x01, 0x7f, 0x01, 0x7f,
    # Function section
    0x03, 0x02, 0x01, 0x00,
    # Export section
    0x07, 0x10, 0x01, 0x09, 0x66, 0x69, 0x62, 0x6f, 0x6e, 0x61, 0x63, 0x63, 0x69, 0x00, 0x00,
    # Code section (simple return arg)
    0x0a, 0x06, 0x01, 0x04, 0x00, 0x20, 0x00, 0x0f, 0x0b,
])

ADD_WASM = bytes([
    0x00, 0x61, 0x73, 0x6d, 0x01, 0x00, 0x00, 0x00,
    # Type: (i32, i32) -> i32
    0x01, 0x08, 0x01, 0x60, 0x02, 0x7f, 0x7f, 0x01, 0x7f,
    # Function
    0x03, 0x02, 0x01, 0x00,
    # Export
    0x07, 0x07, 0x01, 0x03, 0x61, 0x64, 0x64, 0x00, 0x00,
    # Code: local.get 0, local.get 1, i32.add
    0x0a, 0x09, 0x01, 0x07, 0x00, 0x20, 0x00, 0x20, 0x01, 0x6a, 0x0b,
])

MULTIPLY_WASM = bytes([
    0x00, 0x61, 0x73, 0x6d, 0x01, 0x00, 0x00, 0x00,
    # Type: (i32, i32) -> i32
    0x01, 0x08, 0x01, 0x60, 0x02, 0x7f, 0x7f, 0x01, 0x7f,
    # Function
    0x03, 0x02, 0x01, 0x00,
    # Export
    0x07, 0x09, 0x01, 0x04, 0x6d, 0x75, 0x6c, 0x00, 0x00,
    # Code: local.get 0, local.get 1, i32.mul
    0x0a, 0x09, 0x01, 0x07, 0x00, 0x20, 0x00, 0x20, 0x01, 0x6c, 0x0b,
])


if __name__ == "__main__":
    from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge

    benchmark = WASMGPUBenchmark(warmup_iterations=3)
    bridge = WASMGPUBridge()

    # Benchmark simple addition
    result = benchmark.benchmark_execution(
        "simple_add_baseline",
        lambda: bridge.execute(ADD_WASM, entry_point=0, arguments=[5, 7]),
        iterations=50
    )

    print(benchmark.generate_report())
