"""
Pattern Detection Benchmark Suite

Provides performance benchmarking tools for measuring pattern detection
performance across different image sizes, algorithms, and hardware backends.

Features:
- CPU vs GPU performance comparison
- Memory usage tracking
- Throughput measurements
- Speedup calculations
- Formatted report generation
"""

import time
import gc
import tracemalloc
from pathlib import Path
from typing import List, Dict, Any, Optional, Tuple
from dataclasses import dataclass, field
import json

import numpy as np
from PIL import Image


@dataclass
class BenchmarkResult:
    """Result of a single benchmark run."""
    algorithm: str
    image_size: Tuple[int, int]
    iterations: int
    total_time: float
    avg_time: float
    min_time: float
    max_time: float
    throughput_ips: float  # Images per second
    peak_memory_mb: float
    metadata: Dict[str, Any] = field(default_factory=dict)


@dataclass
class BenchmarkSuite:
    """Container for multiple benchmark results."""
    results: List[BenchmarkResult] = field(default_factory=list)
    suite_name: str = "Pattern Detection Benchmark"
    timestamp: str = field(default_factory=lambda: time.strftime("%Y-%m-%d %H:%M:%S"))

    def add_result(self, result: BenchmarkResult) -> None:
        """Add a benchmark result to the suite."""
        self.results.append(result)

    def get_results_by_algorithm(self, algorithm: str) -> List[BenchmarkResult]:
        """Get all results for a specific algorithm."""
        return [r for r in self.results if r.algorithm == algorithm]

    def get_results_by_size(self, size: Tuple[int, int]) -> List[BenchmarkResult]:
        """Get all results for a specific image size."""
        return [r for r in self.results if r.image_size == size]

    def calculate_speedup(
        self,
        baseline_algorithm: str,
        comparison_algorithm: str
    ) -> Dict[Tuple[int, int], float]:
        """
        Calculate speedup of comparison_algorithm over baseline_algorithm.

        Returns dict mapping image sizes to speedup factors.
        """
        baseline_results = {r.image_size: r for r in self.get_results_by_algorithm(baseline_algorithm)}
        comparison_results = {r.image_size: r for r in self.get_results_by_algorithm(comparison_algorithm)}

        speedups = {}
        for size, baseline in baseline_results.items():
            if size in comparison_results:
                comparison = comparison_results[size]
                # Speedup = baseline_time / comparison_time
                speedup = baseline.avg_time / comparison.avg_time
                speedups[size] = speedup

        return speedups

    def to_dict(self) -> Dict[str, Any]:
        """Convert suite to dictionary for serialization."""
        return {
            'suite_name': self.suite_name,
            'timestamp': self.timestamp,
            'results': [
                {
                    'algorithm': r.algorithm,
                    'image_size': r.image_size,
                    'iterations': r.iterations,
                    'total_time': r.total_time,
                    'avg_time': r.avg_time,
                    'min_time': r.min_time,
                    'max_time': r.max_time,
                    'throughput_ips': r.throughput_ips,
                    'peak_memory_mb': r.peak_memory_mb,
                    'metadata': r.metadata
                }
                for r in self.results
            ]
        }

    def save_json(self, filepath: str) -> None:
        """Save benchmark results to JSON file."""
        with open(filepath, 'w') as f:
            json.dump(self.to_dict(), f, indent=2)


class PatternBenchmark:
    """
    Benchmark runner for pattern detection algorithms.

    Supports benchmarking of:
    - Sobel edge detection
    - Canny edge detection
    - Fourier analysis
    - Clustering algorithms
    """

    def __init__(self, output_dir: Optional[str] = None):
        """
        Initialize benchmark runner.

        Args:
            output_dir: Directory to save benchmark output files (optional)
        """
        self.output_dir = Path(output_dir) if output_dir else None
        self.suite = BenchmarkSuite()

    def _create_test_image(
        self,
        size: Tuple[int, int],
        pattern: str = "checkerboard"
    ) -> str:
        """
        Create a test image for benchmarking.

        Args:
            size: Image size as (width, height)
            pattern: Pattern type ("checkerboard", "gradient", "noise", "stripes")

        Returns:
            Path to the created image file
        """
        width, height = size

        if pattern == "checkerboard":
            # Create checkerboard pattern
            img_array = np.zeros((height, width, 4), dtype=np.uint8)
            square_size = max(8, width // 32)
            for i in range(0, height, square_size):
                for j in range(0, width, square_size):
                    if ((i // square_size) + (j // square_size)) % 2 == 0:
                        img_array[i:i+square_size, j:j+square_size, :] = [255, 255, 255, 255]

        elif pattern == "gradient":
            # Create horizontal gradient
            img_array = np.zeros((height, width, 4), dtype=np.uint8)
            for x in range(width):
                value = int((x / width) * 255)
                img_array[:, x, :] = [value, value, value, 255]

        elif pattern == "noise":
            # Create random noise
            img_array = np.random.randint(0, 256, (height, width, 4), dtype=np.uint8)
            img_array[:, :, 3] = 255  # Alpha channel

        elif pattern == "stripes":
            # Create vertical stripes
            img_array = np.zeros((height, width, 4), dtype=np.uint8)
            stripe_width = max(4, width // 64)
            for x in range(0, width, stripe_width * 2):
                img_array[:, x:x+stripe_width, :] = [255, 255, 255, 255]

        else:
            # Default to uniform gray
            img_array = np.full((height, width, 4), 128, dtype=np.uint8)
            img_array[:, :, 3] = 255

        # Save to temp file
        import tempfile
        fd, path = tempfile.mkstemp(suffix='.png')
        img = Image.fromarray(img_array, 'RGBA')
        img.save(path)
        import os
        os.close(fd)

        return path

    def _measure_performance(
        self,
        func,
        iterations: int = 10,
        warmup_iterations: int = 2
    ) -> Tuple[float, float, float, float]:
        """
        Measure performance of a function.

        Args:
            func: Function to benchmark (should return immediately)
            iterations: Number of iterations to run
            warmup_iterations: Number of warmup iterations (not counted)

        Returns:
            Tuple of (total_time, avg_time, min_time, max_time)
        """
        # Warmup
        for _ in range(warmup_iterations):
            func()

        # Force garbage collection before benchmarking
        gc.collect()

        # Measure
        times = []
        for _ in range(iterations):
            start = time.perf_counter()
            func()
            end = time.perf_counter()
            times.append(end - start)

        total_time = sum(times)
        avg_time = total_time / iterations
        min_time = min(times)
        max_time = max(times)

        return total_time, avg_time, min_time, max_time

    def _measure_memory(self, func) -> float:
        """
        Measure peak memory usage of a function.

        Args:
            func: Function to measure

        Returns:
            Peak memory usage in MB
        """
        tracemalloc.start()
        func()
        current, peak = tracemalloc.get_traced_memory()
        tracemalloc.stop()
        return peak / (1024 * 1024)  # Convert to MB

    def benchmark_sobel(
        self,
        sizes: List[Tuple[int, int]] = None,
        iterations: int = 10,
        pattern: str = "checkerboard"
    ) -> BenchmarkSuite:
        """
        Benchmark Sobel edge detection across different image sizes.

        Args:
            sizes: List of (width, height) tuples to benchmark
            iterations: Number of iterations per size
            pattern: Test pattern to use

        Returns:
            BenchmarkSuite with results
        """
        if sizes is None:
            sizes = [
                (256, 256),
                (512, 512),
                (1024, 1024),
                (2048, 2048)
            ]

        from pattern_detector import PatternDetector

        for size in sizes:
            # Create test image
            image_path = self._create_test_image(size, pattern)

            try:
                detector = PatternDetector(image_path)

                # Measure performance
                def run_sobel():
                    return detector.detect_edges_sobel()

                total_time, avg_time, min_time, max_time = self._measure_performance(
                    run_sobel, iterations=iterations
                )

                # Measure memory separately (single run)
                detector_mem = PatternDetector(image_path)
                peak_memory = self._measure_memory(
                    lambda: detector_mem.detect_edges_sobel()
                )

                # Calculate throughput
                throughput = iterations / total_time if total_time > 0 else 0

                result = BenchmarkResult(
                    algorithm='sobel',
                    image_size=size,
                    iterations=iterations,
                    total_time=total_time,
                    avg_time=avg_time,
                    min_time=min_time,
                    max_time=max_time,
                    throughput_ips=throughput,
                    peak_memory_mb=peak_memory,
                    metadata={'pattern': pattern}
                )

                self.suite.add_result(result)

            finally:
                # Cleanup temp file
                Path(image_path).unlink(missing_ok=True)

        return self.suite

    def benchmark_canny(
        self,
        sizes: List[Tuple[int, int]] = None,
        iterations: int = 10,
        low_threshold: float = 50,
        high_threshold: float = 150,
        pattern: str = "checkerboard"
    ) -> BenchmarkSuite:
        """
        Benchmark Canny edge detection across different image sizes.

        Args:
            sizes: List of (width, height) tuples to benchmark
            iterations: Number of iterations per size
            low_threshold: Canny low threshold
            high_threshold: Canny high threshold
            pattern: Test pattern to use

        Returns:
            BenchmarkSuite with results
        """
        if sizes is None:
            sizes = [
                (256, 256),
                (512, 512),
                (1024, 1024),
                (2048, 2048)
            ]

        from pattern_detector import PatternDetector

        for size in sizes:
            # Create test image
            image_path = self._create_test_image(size, pattern)

            try:
                detector = PatternDetector(image_path)

                # Measure performance
                def run_canny():
                    return detector.detect_edges_canny(low_threshold, high_threshold)

                total_time, avg_time, min_time, max_time = self._measure_performance(
                    run_canny, iterations=iterations
                )

                # Measure memory separately
                detector_mem = PatternDetector(image_path)
                peak_memory = self._measure_memory(
                    lambda: detector_mem.detect_edges_canny(low_threshold, high_threshold)
                )

                # Calculate throughput
                throughput = iterations / total_time if total_time > 0 else 0

                result = BenchmarkResult(
                    algorithm='canny',
                    image_size=size,
                    iterations=iterations,
                    total_time=total_time,
                    avg_time=avg_time,
                    min_time=min_time,
                    max_time=max_time,
                    throughput_ips=throughput,
                    peak_memory_mb=peak_memory,
                    metadata={
                        'pattern': pattern,
                        'low_threshold': low_threshold,
                        'high_threshold': high_threshold
                    }
                )

                self.suite.add_result(result)

            finally:
                # Cleanup temp file
                Path(image_path).unlink(missing_ok=True)

        return self.suite

    def benchmark_fourier(
        self,
        sizes: List[Tuple[int, int]] = None,
        iterations: int = 10,
        pattern: str = "stripes"
    ) -> BenchmarkSuite:
        """
        Benchmark Fourier analysis across different image sizes.

        Args:
            sizes: List of (width, height) tuples to benchmark
            iterations: Number of iterations per size
            pattern: Test pattern to use (stripes work well for Fourier)

        Returns:
            BenchmarkSuite with results
        """
        if sizes is None:
            sizes = [
                (256, 256),
                (512, 512),
                (1024, 1024),
                (2048, 2048)
            ]

        from pattern_detector import PatternDetector

        for size in sizes:
            # Create test image
            image_path = self._create_test_image(size, pattern)

            try:
                detector = PatternDetector(image_path)

                # Measure performance
                def run_fourier():
                    return detector.analyze_fourier()

                total_time, avg_time, min_time, max_time = self._measure_performance(
                    run_fourier, iterations=iterations
                )

                # Measure memory separately
                detector_mem = PatternDetector(image_path)
                peak_memory = self._measure_memory(
                    lambda: detector_mem.analyze_fourier()
                )

                # Calculate throughput
                throughput = iterations / total_time if total_time > 0 else 0

                result = BenchmarkResult(
                    algorithm='fourier',
                    image_size=size,
                    iterations=iterations,
                    total_time=total_time,
                    avg_time=avg_time,
                    min_time=min_time,
                    max_time=max_time,
                    throughput_ips=throughput,
                    peak_memory_mb=peak_memory,
                    metadata={'pattern': pattern}
                )

                self.suite.add_result(result)

            finally:
                # Cleanup temp file
                Path(image_path).unlink(missing_ok=True)

        return self.suite

    def benchmark_all(
        self,
        sizes: List[Tuple[int, int]] = None,
        iterations: int = 10
    ) -> BenchmarkSuite:
        """
        Run all benchmarks across different image sizes.

        Args:
            sizes: List of (width, height) tuples to benchmark
            iterations: Number of iterations per size

        Returns:
            BenchmarkSuite with all results
        """
        if sizes is None:
            sizes = [
                (256, 256),
                (512, 512),
                (1024, 1024),
                (2048, 2048)
            ]

        self.benchmark_sobel(sizes=sizes, iterations=iterations)
        self.benchmark_canny(sizes=sizes, iterations=iterations)
        self.benchmark_fourier(sizes=sizes, iterations=iterations)

        return self.suite

    def print_benchmark_report(self, results: Optional[BenchmarkSuite] = None) -> None:
        """
        Print a formatted benchmark report.

        Args:
            results: BenchmarkSuite to report (default: use internal suite)
        """
        if results is None:
            results = self.suite

        print("\n" + "=" * 80)
        print(f" {results.suite_name}")
        print(f" Timestamp: {results.timestamp}")
        print("=" * 80)

        # Group results by algorithm
        algorithms = {}
        for result in results.results:
            if result.algorithm not in algorithms:
                algorithms[result.algorithm] = []
            algorithms[result.algorithm].append(result)

        # Print results for each algorithm
        for algorithm, alg_results in sorted(algorithms.items()):
            print(f"\n{algorithm.upper()} Edge Detection")
            print("-" * 80)
            print(f"{'Size':>12} {'Avg (ms)':>12} {'Min (ms)':>12} {'Max (ms)':>12} "
                  f"{'IPS':>12} {'Memory (MB)':>12}")
            print("-" * 80)

            for result in sorted(alg_results, key=lambda r: r.image_size[0]):
                w, h = result.image_size
                print(f"{w}x{h:>7} "
                      f"{result.avg_time*1000:>12.3f} "
                      f"{result.min_time*1000:>12.3f} "
                      f"{result.max_time*1000:>12.3f} "
                      f"{result.throughput_ips:>12.2f} "
                      f"{result.peak_memory_mb:>12.2f}")

        # Print speedup comparison (Sobel vs Canny)
        if 'sobel' in algorithms and 'canny' in algorithms:
            speedups = results.calculate_speedup('canny', 'sobel')
            if speedups:
                print("\n" + "=" * 80)
                print(" SPEEDUP COMPARISON (Sobel vs Canny)")
                print(" Values > 1.0 indicate Sobel is faster")
                print("=" * 80)
                for size, speedup in sorted(speedups.items()):
                    w, h = size
                    print(f"{w}x{h:>7}: {speedup:>6.2f}x")

        print("\n" + "=" * 80)

    def save_results(self, filepath: Optional[str] = None) -> str:
        """
        Save benchmark results to JSON file.

        Args:
            filepath: Path to save results (default: auto-generated)

        Returns:
            Path to saved file
        """
        if filepath is None:
            if self.output_dir:
                self.output_dir.mkdir(parents=True, exist_ok=True)
                timestamp = time.strftime("%Y%m%d_%H%M%S")
                filepath = self.output_dir / f"benchmark_results_{timestamp}.json"
            else:
                timestamp = time.strftime("%Y%m%d_%H%M%S")
                filepath = f"benchmark_results_{timestamp}.json"

        self.suite.save_json(str(filepath))
        return str(filepath)


def main():
    """Main entry point for CLI benchmark execution."""
    import argparse

    parser = argparse.ArgumentParser(
        description='Pattern Detection Benchmark Suite',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  # Run all benchmarks with default settings
  python -m benchmarks.pattern_benchmark

  # Run only Sobel benchmarks
  python -m benchmarks.pattern_benchmark --algorithm sobel

  # Run benchmarks for specific sizes
  python -m benchmarks.pattern_benchmark --sizes 256 512 1024

  # Run with more iterations for accuracy
  python -m benchmarks.pattern_benchmark --iterations 20

  # Save results to specific file
  python -m benchmarks.pattern_benchmark --output results.json
        """
    )

    parser.add_argument(
        '--algorithm', '-a',
        choices=['sobel', 'canny', 'fourier', 'all'],
        default='all',
        help='Algorithm to benchmark (default: all)'
    )

    parser.add_argument(
        '--sizes', '-s',
        type=int,
        nargs='+',
        default=[256, 512, 1024, 2048],
        help='Image sizes to benchmark (default: 256 512 1024 2048)'
    )

    parser.add_argument(
        '--iterations', '-i',
        type=int,
        default=10,
        help='Number of iterations per benchmark (default: 10)'
    )

    parser.add_argument(
        '--output', '-o',
        type=str,
        help='Output JSON file for results'
    )

    parser.add_argument(
        '--verbose', '-v',
        action='store_true',
        help='Enable verbose output'
    )

    args = parser.parse_args()

    # Convert size list to tuples
    sizes = [(s, s) for s in args.sizes]

    # Create benchmark runner
    benchmark = PatternBenchmark()

    if args.verbose:
        print(f"Running {args.algorithm} benchmark for sizes: {sizes}")
        print(f"Iterations: {args.iterations}")

    # Run benchmarks
    if args.algorithm == 'sobel':
        benchmark.benchmark_sobel(sizes=sizes, iterations=args.iterations)
    elif args.algorithm == 'canny':
        benchmark.benchmark_canny(sizes=sizes, iterations=args.iterations)
    elif args.algorithm == 'fourier':
        benchmark.benchmark_fourier(sizes=sizes, iterations=args.iterations)
    else:  # all
        benchmark.benchmark_all(sizes=sizes, iterations=args.iterations)

    # Print report
    benchmark.print_benchmark_report()

    # Save results if output specified
    if args.output:
        output_path = benchmark.save_results(args.output)
        print(f"\nResults saved to: {output_path}")

    return 0


if __name__ == '__main__':
    import sys
    sys.exit(main())
