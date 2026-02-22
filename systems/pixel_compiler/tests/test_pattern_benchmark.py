"""
Tests for pattern detection benchmark suite.

Tests the benchmark infrastructure including:
- BenchmarkResult dataclass
- PatternBenchmark class
- Performance measurement methods
- Report generation
"""

import pytest
import numpy as np
import tempfile
from pathlib import Path
from benchmarks.pattern_benchmark import (
    BenchmarkResult,
    BenchmarkSuite,
    PatternBenchmark
)


class TestBenchmarkResult:
    """Tests for BenchmarkResult dataclass."""

    def test_benchmark_result_creation(self):
        """Test that BenchmarkResult can be created with all fields."""
        result = BenchmarkResult(
            algorithm='sobel',
            image_size=(256, 256),
            iterations=10,
            total_time=1.5,
            avg_time=0.15,
            min_time=0.12,
            max_time=0.18,
            throughput_ips=6.67,
            peak_memory_mb=45.2,
            metadata={'test': 'value'}
        )

        assert result.algorithm == 'sobel'
        assert result.image_size == (256, 256)
        assert result.iterations == 10
        assert result.total_time == 1.5
        assert result.avg_time == 0.15
        assert result.throughput_ips == 6.67
        assert result.peak_memory_mb == 45.2
        assert result.metadata == {'test': 'value'}

    def test_benchmark_result_default_metadata(self):
        """Test that BenchmarkResult has default empty metadata."""
        result = BenchmarkResult(
            algorithm='canny',
            image_size=(512, 512),
            iterations=5,
            total_time=2.0,
            avg_time=0.4,
            min_time=0.35,
            max_time=0.45,
            throughput_ips=2.5,
            peak_memory_mb=50.0
        )

        assert result.metadata == {}


class TestBenchmarkSuite:
    """Tests for BenchmarkSuite class."""

    def test_suite_creation(self):
        """Test that BenchmarkSuite can be created."""
        suite = BenchmarkSuite()

        assert suite.suite_name == "Pattern Detection Benchmark"
        assert suite.results == []
        assert suite.timestamp is not None

    def test_add_result(self):
        """Test adding results to suite."""
        suite = BenchmarkSuite()
        result = BenchmarkResult(
            algorithm='sobel',
            image_size=(256, 256),
            iterations=10,
            total_time=1.0,
            avg_time=0.1,
            min_time=0.08,
            max_time=0.12,
            throughput_ips=10.0,
            peak_memory_mb=40.0
        )

        suite.add_result(result)

        assert len(suite.results) == 1
        assert suite.results[0] == result

    def test_get_results_by_algorithm(self):
        """Test filtering results by algorithm."""
        suite = BenchmarkSuite()

        # Add multiple results
        suite.add_result(BenchmarkResult(
            algorithm='sobel', image_size=(256, 256), iterations=10,
            total_time=1.0, avg_time=0.1, min_time=0.08, max_time=0.12,
            throughput_ips=10.0, peak_memory_mb=40.0
        ))
        suite.add_result(BenchmarkResult(
            algorithm='canny', image_size=(256, 256), iterations=10,
            total_time=1.5, avg_time=0.15, min_time=0.12, max_time=0.18,
            throughput_ips=6.67, peak_memory_mb=45.0
        ))
        suite.add_result(BenchmarkResult(
            algorithm='sobel', image_size=(512, 512), iterations=5,
            total_time=2.0, avg_time=0.4, min_time=0.35, max_time=0.45,
            throughput_ips=2.5, peak_memory_mb=80.0
        ))

        sobel_results = suite.get_results_by_algorithm('sobel')
        canny_results = suite.get_results_by_algorithm('canny')

        assert len(sobel_results) == 2
        assert len(canny_results) == 1
        assert all(r.algorithm == 'sobel' for r in sobel_results)

    def test_get_results_by_size(self):
        """Test filtering results by image size."""
        suite = BenchmarkSuite()

        # Add multiple results
        suite.add_result(BenchmarkResult(
            algorithm='sobel', image_size=(256, 256), iterations=10,
            total_time=1.0, avg_time=0.1, min_time=0.08, max_time=0.12,
            throughput_ips=10.0, peak_memory_mb=40.0
        ))
        suite.add_result(BenchmarkResult(
            algorithm='canny', image_size=(256, 256), iterations=10,
            total_time=1.5, avg_time=0.15, min_time=0.12, max_time=0.18,
            throughput_ips=6.67, peak_memory_mb=45.0
        ))
        suite.add_result(BenchmarkResult(
            algorithm='sobel', image_size=(512, 512), iterations=5,
            total_time=2.0, avg_time=0.4, min_time=0.35, max_time=0.45,
            throughput_ips=2.5, peak_memory_mb=80.0
        ))

        size_256_results = suite.get_results_by_size((256, 256))
        size_512_results = suite.get_results_by_size((512, 512))

        assert len(size_256_results) == 2
        assert len(size_512_results) == 1
        assert all(r.image_size == (256, 256) for r in size_256_results)

    def test_calculate_speedup(self):
        """Test speedup calculation between algorithms."""
        suite = BenchmarkSuite()

        # Add results: Canny is slower (higher time)
        suite.add_result(BenchmarkResult(
            algorithm='canny', image_size=(256, 256), iterations=10,
            total_time=2.0, avg_time=0.20, min_time=0.18, max_time=0.22,
            throughput_ips=5.0, peak_memory_mb=50.0
        ))
        suite.add_result(BenchmarkResult(
            algorithm='sobel', image_size=(256, 256), iterations=10,
            total_time=1.0, avg_time=0.10, min_time=0.08, max_time=0.12,
            throughput_ips=10.0, peak_memory_mb=40.0
        ))

        speedups = suite.calculate_speedup('canny', 'sobel')

        assert (256, 256) in speedups
        # Speedup = baseline (canny) / comparison (sobel) = 0.20 / 0.10 = 2.0
        assert speedups[(256, 256)] == 2.0

    def test_to_dict(self):
        """Test converting suite to dictionary."""
        suite = BenchmarkSuite()
        suite.add_result(BenchmarkResult(
            algorithm='sobel', image_size=(256, 256), iterations=10,
            total_time=1.0, avg_time=0.1, min_time=0.08, max_time=0.12,
            throughput_ips=10.0, peak_memory_mb=40.0
        ))

        data = suite.to_dict()

        assert 'suite_name' in data
        assert 'timestamp' in data
        assert 'results' in data
        assert len(data['results']) == 1
        assert data['results'][0]['algorithm'] == 'sobel'

    def test_save_json(self):
        """Test saving suite to JSON file."""
        suite = BenchmarkSuite()
        suite.add_result(BenchmarkResult(
            algorithm='sobel', image_size=(256, 256), iterations=10,
            total_time=1.0, avg_time=0.1, min_time=0.08, max_time=0.12,
            throughput_ips=10.0, peak_memory_mb=40.0
        ))

        with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
            temp_path = f.name

        try:
            suite.save_json(temp_path)

            # Verify file exists and contains valid JSON
            assert Path(temp_path).exists()

            import json
            with open(temp_path, 'r') as f:
                data = json.load(f)

            assert 'results' in data
            assert len(data['results']) == 1
        finally:
            Path(temp_path).unlink(missing_ok=True)


class TestPatternBenchmark:
    """Tests for PatternBenchmark class."""

    def test_benchmark_creation(self):
        """Test that PatternBenchmark can be created."""
        benchmark = PatternBenchmark()

        assert benchmark.suite is not None
        assert len(benchmark.suite.results) == 0

    def test_benchmark_with_output_dir(self):
        """Test creating benchmark with output directory."""
        with tempfile.TemporaryDirectory() as tmpdir:
            benchmark = PatternBenchmark(output_dir=tmpdir)
            assert benchmark.output_dir == Path(tmpdir)

    def test_create_test_image_checkerboard(self):
        """Test creating checkerboard test image."""
        benchmark = PatternBenchmark()
        image_path = benchmark._create_test_image((64, 64), pattern="checkerboard")

        try:
            assert Path(image_path).exists()

            # Verify image can be loaded
            from PIL import Image
            img = Image.open(image_path)
            assert img.size == (64, 64)
        finally:
            Path(image_path).unlink(missing_ok=True)

    def test_create_test_image_gradient(self):
        """Test creating gradient test image."""
        benchmark = PatternBenchmark()
        image_path = benchmark._create_test_image((64, 64), pattern="gradient")

        try:
            assert Path(image_path).exists()

            from PIL import Image
            img = Image.open(image_path)
            assert img.size == (64, 64)
        finally:
            Path(image_path).unlink(missing_ok=True)

    def test_create_test_image_noise(self):
        """Test creating noise test image."""
        benchmark = PatternBenchmark()
        image_path = benchmark._create_test_image((64, 64), pattern="noise")

        try:
            assert Path(image_path).exists()

            from PIL import Image
            img = Image.open(image_path)
            assert img.size == (64, 64)
        finally:
            Path(image_path).unlink(missing_ok=True)

    def test_create_test_image_stripes(self):
        """Test creating stripes test image."""
        benchmark = PatternBenchmark()
        image_path = benchmark._create_test_image((64, 64), pattern="stripes")

        try:
            assert Path(image_path).exists()

            from PIL import Image
            img = Image.open(image_path)
            assert img.size == (64, 64)
        finally:
            Path(image_path).unlink(missing_ok=True)

    def test_measure_performance_simple_function(self):
        """Test measuring performance of a simple function."""
        benchmark = PatternBenchmark()

        def simple_function():
            return sum(range(1000))

        total, avg, min_t, max_t = benchmark._measure_performance(
            simple_function, iterations=5, warmup_iterations=1
        )

        assert total > 0
        assert avg > 0
        assert min_t > 0
        assert max_t >= min_t
        assert max_t <= avg * 10  # Sanity check

    def test_measure_memory_simple_function(self):
        """Test measuring memory usage of a function."""
        benchmark = PatternBenchmark()

        def allocate_memory():
            # Create a large numpy array
            arr = np.zeros((1000, 1000), dtype=np.float64)
            return arr

        memory_mb = benchmark._measure_memory(allocate_memory)

        # Should use at least some memory
        assert memory_mb > 0
        # 1000x1000 float64 array is about 8 MB
        assert memory_mb > 5  # At least ~8 MB for the array

    def test_benchmark_sobel_single_size(self):
        """Test running Sobel benchmark for a single size."""
        benchmark = PatternBenchmark()
        results = benchmark.benchmark_sobel(sizes=[(64, 64)], iterations=3)

        assert len(results.results) == 1
        result = results.results[0]
        assert result.algorithm == 'sobel'
        assert result.image_size == (64, 64)
        assert result.iterations == 3
        assert result.total_time > 0
        assert result.throughput_ips > 0

    def test_benchmark_sobel_multiple_sizes(self):
        """Test running Sobel benchmark for multiple sizes."""
        benchmark = PatternBenchmark()
        results = benchmark.benchmark_sobel(
            sizes=[(64, 64), (128, 128)],
            iterations=2
        )

        assert len(results.results) == 2
        assert results.results[0].image_size == (64, 64)
        assert results.results[1].image_size == (128, 128)

    def test_benchmark_canny_single_size(self):
        """Test running Canny benchmark for a single size."""
        benchmark = PatternBenchmark()
        results = benchmark.benchmark_canny(sizes=[(64, 64)], iterations=3)

        assert len(results.results) == 1
        result = results.results[0]
        assert result.algorithm == 'canny'
        assert result.image_size == (64, 64)
        assert result.iterations == 3

    def test_benchmark_fourier_single_size(self):
        """Test running Fourier benchmark for a single size."""
        benchmark = PatternBenchmark()
        results = benchmark.benchmark_fourier(sizes=[(64, 64)], iterations=3)

        assert len(results.results) == 1
        result = results.results[0]
        assert result.algorithm == 'fourier'
        assert result.image_size == (64, 64)
        assert result.iterations == 3

    def test_benchmark_all(self):
        """Test running all benchmarks."""
        benchmark = PatternBenchmark()
        results = benchmark.benchmark_all(sizes=[(64, 64)], iterations=2)

        # Should have 3 results (sobel, canny, fourier)
        assert len(results.results) == 3
        algorithms = {r.algorithm for r in results.results}
        assert algorithms == {'sobel', 'canny', 'fourier'}

    def test_print_benchmark_report(self, capsys):
        """Test printing benchmark report."""
        benchmark = PatternBenchmark()
        benchmark.benchmark_sobel(sizes=[(64, 64)], iterations=2)

        # Should not raise exception
        benchmark.print_benchmark_report()

        captured = capsys.readouterr()
        # Check for key elements in the report
        assert "Pattern Detection Benchmark" in captured.out
        assert "SOBEL" in captured.out
        # The size format might be "64" with padding, just check for 64
        assert "64" in captured.out

    def test_save_results(self):
        """Test saving benchmark results."""
        benchmark = PatternBenchmark()
        benchmark.benchmark_sobel(sizes=[(64, 64)], iterations=2)

        with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
            temp_path = f.name

        try:
            output_path = benchmark.save_results(temp_path)

            assert Path(output_path).exists()

            import json
            with open(output_path, 'r') as f:
                data = json.load(f)

            assert 'results' in data
            assert len(data['results']) == 1
        finally:
            Path(temp_path).unlink(missing_ok=True)

    def test_save_results_auto_filename(self):
        """Test saving results with auto-generated filename."""
        with tempfile.TemporaryDirectory() as tmpdir:
            benchmark = PatternBenchmark(output_dir=tmpdir)
            benchmark.benchmark_sobel(sizes=[(64, 64)], iterations=2)

            output_path = benchmark.save_results()

            assert Path(output_path).exists()
            assert Path(output_path).parent == Path(tmpdir)
            assert output_path.endswith('.json')

    def test_benchmark_sobeL_default_sizes(self):
        """Test Sobel benchmark with default sizes (smoke test)."""
        benchmark = PatternBenchmark()

        # Use small sizes for quick test
        results = benchmark.benchmark_sobel(
            sizes=[(32, 32), (64, 64)],
            iterations=2
        )

        assert len(results.results) == 2
        # Results should be ordered by size
        assert results.results[0].image_size == (32, 32)
        assert results.results[1].image_size == (64, 64)

        # Larger image should take longer
        assert results.results[1].avg_time > results.results[0].avg_time
