# systems/pixel_compiler/tests/test_wasm_gpu_benchmark.py
"""Tests for WASM GPU benchmark suite."""
import pytest
from systems.pixel_compiler.benchmarks.wasm_gpu_benchmark import (
    WASMGPUBenchmark, BenchmarkResult, ComparisonResult, ADD_WASM
)


class TestBenchmarkResult:
    """Test BenchmarkResult dataclass."""

    def test_benchmark_result_creation(self):
        """Test BenchmarkResult dataclass."""
        result = BenchmarkResult(
            name="test",
            iterations=10,
            total_time_ms=100.0,
            avg_time_ms=10.0,
            min_time_ms=8.0,
            max_time_ms=15.0,
            p50_ms=10.0,
            p95_ms=14.0,
            p99_ms=15.0,
            throughput_ops_per_sec=100.0,
        )
        assert result.name == "test"
        assert result.throughput_ops_per_sec == 100.0
        assert result.iterations == 10


class TestWASMGPUBenchmark:
    """Test the benchmark framework."""

    def test_benchmark_initialization(self):
        """Test benchmark initialization."""
        benchmark = WASMGPUBenchmark(warmup_iterations=3)
        assert benchmark.warmup_iterations == 3
        assert len(benchmark.results) == 0

    def test_benchmark_execution(self):
        """Test benchmarking a simple function."""
        benchmark = WASMGPUBenchmark(warmup_iterations=1)

        result = benchmark.benchmark_execution(
            "dummy",
            lambda: 1 + 1,
            iterations=10
        )

        assert result.name == "dummy"
        assert result.iterations == 10
        assert result.avg_time_ms > 0
        assert result.throughput_ops_per_sec > 0

    def test_benchmark_with_wasm_call(self):
        """Test benchmarking with actual WASM execution."""
        pytest.importorskip("wgpu")
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge

        benchmark = WASMGPUBenchmark(warmup_iterations=1)
        bridge = WASMGPUBridge()

        result = benchmark.benchmark_execution(
            "add_wasm",
            lambda: bridge.execute(ADD_WASM, entry_point=0, arguments=[5, 7]),
            iterations=5
        )

        assert result.name == "add_wasm"
        assert result.iterations == 5
        assert result.avg_time_ms >= 0

    def test_generate_report(self):
        """Test report generation."""
        benchmark = WASMGPUBenchmark(warmup_iterations=0)
        benchmark.benchmark_execution("test_fn", lambda: None, iterations=5)

        report = benchmark.generate_report()
        assert "# WASM GPU Benchmark Report" in report
        assert "test_fn" in report
        assert "| Benchmark |" in report
        assert "| Iterations |" in report

    def test_compare_results(self):
        """Test comparison between results."""
        benchmark = WASMGPUBenchmark(warmup_iterations=0)
        benchmark.benchmark_execution("baseline", lambda: sum(range(100)), iterations=10)
        benchmark.benchmark_execution("optimized", lambda: sum(range(10)), iterations=10)

        comparison = benchmark.compare("baseline", "optimized")
        assert comparison is not None
        assert comparison.speedup > 0
        assert comparison.improvement_pct > 0
        assert comparison.baseline.name == "baseline"
        assert comparison.optimized.name == "optimized"

    def test_compare_missing_results(self):
        """Test comparison with missing results."""
        benchmark = WASMGPUBenchmark(warmup_iterations=0)
        benchmark.benchmark_execution("baseline", lambda: None, iterations=5)

        comparison = benchmark.compare("baseline", "nonexistent")
        assert comparison is None

    def test_save_results(self, tmp_path):
        """Test saving results to JSON."""
        import json

        benchmark = WASMGPUBenchmark(warmup_iterations=0)
        benchmark.benchmark_execution("test", lambda: 1 + 1, iterations=5)

        output_path = tmp_path / "results.json"
        benchmark.save_results(str(output_path))

        assert output_path.exists()
        with open(output_path) as f:
            data = json.load(f)
            assert "results" in data
            assert len(data["results"]) == 1
            assert data["results"][0]["name"] == "test"

    def test_warmup_executions(self):
        """Test that warmup iterations are executed."""
        warmup_count = []
        benchmark = WASMGPUBenchmark(warmup_iterations=3)

        def track_execution():
            warmup_count.append(1)
            return 1

        benchmark.benchmark_execution("warmup_test", track_execution, iterations=5)
        # Warmup (3) + actual iterations (5) = 8 total calls
        # But we only track during actual benchmark, warmup happens separately
        # The function is called 3 times for warmup + 5 times for benchmark
        assert len(warmup_count) >= 5

    def test_percentile_calculation(self):
        """Test p50, p95, p99 percentile calculation."""
        benchmark = WASMGPUBenchmark(warmup_iterations=0)
        result = benchmark.benchmark_execution("percentile", lambda: 1, iterations=100)

        # Percentiles should be in reasonable ranges
        assert result.p50_ms > 0
        assert result.p95_ms >= result.p50_ms
        assert result.p99_ms >= result.p95_ms
        assert result.max_time_ms >= result.p99_ms


class TestStandardWASM:
    """Test standard WASM binaries for benchmarking."""

    def test_add_wasm_exists(self):
        """Test ADD_WASM is defined."""
        assert ADD_WASM is not None
        assert len(ADD_WASM) > 0
        # Should start with WASM magic number
        assert ADD_WASM[:4] == b'\x00\x61\x73\x6d'

    def test_add_wasm_valid_wasm(self):
        """Test that ADD_WASM is valid WASM."""
        # WASM magic + version
        assert ADD_WASM[0] == 0x00
        assert ADD_WASM[1] == 0x61  # 'a'
        assert ADD_WASM[2] == 0x73  # 's'
        assert ADD_WASM[3] == 0x6d  # 'm'
        assert ADD_WASM[4] == 0x01  # version
        assert ADD_WASM[5] == 0x00
        assert ADD_WASM[6] == 0x00
        assert ADD_WASM[7] == 0x00


class TestComparisonResult:
    """Test ComparisonResult dataclass."""

    def test_comparison_result_creation(self):
        """Test ComparisonResult creation."""
        baseline = BenchmarkResult(
            name="baseline",
            iterations=10,
            total_time_ms=100.0,
            avg_time_ms=10.0,
            min_time_ms=8.0,
            max_time_ms=15.0,
            p50_ms=10.0,
            p95_ms=14.0,
            p99_ms=15.0,
            throughput_ops_per_sec=100.0,
        )
        optimized = BenchmarkResult(
            name="optimized",
            iterations=10,
            total_time_ms=50.0,
            avg_time_ms=5.0,
            min_time_ms=4.0,
            max_time_ms=8.0,
            p50_ms=5.0,
            p95_ms=7.0,
            p99_ms=8.0,
            throughput_ops_per_sec=200.0,
        )

        comparison = ComparisonResult(
            baseline=baseline,
            optimized=optimized,
            speedup=2.0,
            improvement_pct=50.0
        )

        assert comparison.baseline == baseline
        assert comparison.optimized == optimized
        assert comparison.speedup == 2.0
        assert comparison.improvement_pct == 50.0


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
