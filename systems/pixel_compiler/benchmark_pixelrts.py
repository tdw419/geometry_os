# systems/pixel_compiler/benchmark_pixelrts.py
"""
PixelRTS Performance Benchmarking Framework
Provides baseline measurements and regression detection.
"""

import time
import hashlib
from pathlib import Path
from typing import Dict, List, Optional
from dataclasses import dataclass, asdict
import json

try:
    import numpy as np
except ImportError:
    raise ImportError("numpy required: pip install numpy")

from .pixelrts_v2_core import PixelRTSEncoder, PixelRTSDecoder, calculate_grid_size


@dataclass
class BenchmarkResult:
    """Result from a single benchmark run."""
    test_name: str
    data_size: int
    grid_size: int
    encode_time: float
    decode_time: float
    total_time: float
    throughput_mb_sec: float
    peak_memory_mb: Optional[float] = None
    metadata: Optional[dict] = None


class PixelRTSBenchmark:
    """
    Benchmark suite for PixelRTS encoding/decoding performance.

    Usage:
        bench = PixelRTSBenchmark()
        results = bench.benchmark_encode_decode(data_size=1024*1024)
        print(f"Throughput: {results['throughput_mb_sec']:.2f} MB/sec")
    """

    def __init__(self, output_dir: Optional[str] = None):
        """
        Initialize benchmark suite.

        Args:
            output_dir: Directory to save benchmark results
        """
        self.output_dir = Path(output_dir) if output_dir else Path("benchmark_results")
        self.output_dir.mkdir(parents=True, exist_ok=True)
        self.history_file = self.output_dir / "benchmark_history.jsonl"

    def generate_test_data(self, size: int, pattern: str = "random") -> bytes:
        """
        Generate test data of specified size.

        Args:
            size: Size in bytes
            pattern: "random", "zeros", "ones", "sequential"

        Returns:
            Generated test data
        """
        if pattern == "random":
            import os
            return os.urandom(size)
        elif pattern == "zeros":
            return b'\x00' * size
        elif pattern == "ones":
            return b'\xff' * size
        elif pattern == "sequential":
            return bytes(i % 256 for i in range(size))
        else:
            raise ValueError(f"Unknown pattern: {pattern}")

    def benchmark_encode_decode(
        self,
        data_size: int = 1024 * 1024,
        pattern: str = "random",
        iterations: int = 5,
        mode: str = "standard"
    ) -> Dict:
        """
        Benchmark encoding and decoding performance.

        Args:
            data_size: Size of data to encode (bytes)
            pattern: Data pattern to use
            iterations: Number of iterations to run
            mode: Encoding mode ("standard" or "code")

        Returns:
            Dictionary with benchmark results
        """
        # Generate test data
        test_data = self.generate_test_data(data_size, pattern)

        # Calculate grid size
        grid_size = calculate_grid_size(data_size)

        # Run iterations
        encode_times = []
        decode_times = []

        encoder = PixelRTSEncoder(mode=mode)

        for _ in range(iterations):
            # Benchmark encoding
            start = time.perf_counter()
            png_bytes = encoder.encode(test_data, grid_size=grid_size)
            encode_time = time.perf_counter() - start
            encode_times.append(encode_time)

            # Benchmark decoding
            decoder = PixelRTSDecoder()
            start = time.perf_counter()
            decoded_data = decoder.decode(png_bytes)
            decode_time = time.perf_counter() - start
            decode_times.append(decode_time)

            # Verify correctness
            assert decoded_data == test_data, "Decoded data doesn't match!"

        # Calculate statistics
        avg_encode = sum(encode_times) / len(encode_times)
        avg_decode = sum(decode_times) / len(decode_times)
        total_time = avg_encode + avg_decode
        throughput = (data_size / total_time) / (1024 * 1024)  # MB/sec

        result = BenchmarkResult(
            test_name=f"encode_decode_{data_size}_{mode}",
            data_size=data_size,
            grid_size=grid_size,
            encode_time=avg_encode,
            decode_time=avg_decode,
            total_time=total_time,
            throughput_mb_sec=throughput,
            metadata={"iterations": iterations, "pattern": pattern, "mode": mode}
        )

        # Save to history
        self._save_result(result)

        return asdict(result)

    def benchmark_sizes(
        self,
        sizes: List[int] = None,
        iterations: int = 3
    ) -> List[Dict]:
        """
        Benchmark multiple data sizes.

        Args:
            sizes: List of data sizes in bytes (default: standard sizes)
            iterations: Iterations per size

        Returns:
            List of benchmark results
        """
        if sizes is None:
            # Default test sizes: 1MB, 10MB, 100MB
            sizes = [
                1024 * 1024,      # 1MB
                10 * 1024 * 1024,  # 10MB
                100 * 1024 * 1024,  # 100MB
            ]

        results = []
        for size in sizes:
            print(f"Benchmarking {size / (1024*1024):.1f}MB...")
            result = self.benchmark_encode_decode(
                data_size=size,
                iterations=iterations
            )
            results.append(result)

        return results

    def _save_result(self, result: BenchmarkResult):
        """Save benchmark result to history file."""
        with open(self.history_file, 'a') as f:
            f.write(json.dumps(asdict(result)) + '\n')

    def get_history(self) -> List[Dict]:
        """Load benchmark history."""
        if not self.history_file.exists():
            return []

        results = []
        with open(self.history_file, 'r') as f:
            for line in f:
                if line.strip():
                    results.append(json.loads(line))
        return results

    def detect_regression(self, threshold: float = 0.1) -> List[Dict]:
        """
        Detect performance regressions compared to historical baseline.

        Args:
            threshold: Regression threshold (10% = 0.1)

        Returns:
            List of regressions detected
        """
        history = self.get_history()
        if len(history) < 2:
            return []

        # Group by test name
        by_test = {}
        for result in history:
            name = result['test_name']
            if name not in by_test:
                by_test[name] = []
            by_test[name].append(result)

        regressions = []
        for test_name, results in by_test.items():
            if len(results) < 2:
                continue

            # Compare latest to best historical
            latest = results[-1]['throughput_mb_sec']
            best = max(r['throughput_mb_sec'] for r in results[:-1])

            if latest < best * (1 - threshold):
                regressions.append({
                    'test_name': test_name,
                    'latest_throughput': latest,
                    'best_throughput': best,
                    'regression_percent': (1 - latest/best) * 100
                })

        return regressions


def main():
    """CLI entry point for benchmarking."""
    import argparse

    parser = argparse.ArgumentParser(description="PixelRTS Performance Benchmark")
    parser.add_argument('--sizes', nargs='+', type=int,
                       help='Data sizes in bytes (e.g., 1048576 for 1MB)')
    parser.add_argument('--iterations', type=int, default=5,
                       help='Number of iterations per test')
    parser.add_argument('--output', type=str, default='benchmark_results',
                       help='Output directory for results')
    parser.add_argument('--check-regression', action='store_true',
                       help='Check for performance regressions')

    args = parser.parse_args()

    bench = PixelRTSBenchmark(output_dir=args.output)

    if args.check_regression:
        regressions = bench.detect_regression()
        if regressions:
            print("Performance regressions detected:")
            for reg in regressions:
                print(f"  {reg['test_name']}: -{reg['regression_percent']:.1f}%")
            return 1
        else:
            print("No regressions detected")
            return 0

    # Run benchmarks
    sizes = args.sizes if args.sizes else None
    results = bench.benchmark_sizes(sizes=sizes, iterations=args.iterations)

    # Print summary
    print("\n=== Benchmark Results ===")
    for result in results:
        size_mb = result['data_size'] / (1024 * 1024)
        print(f"\nSize: {size_mb:.1f}MB")
        print(f"  Encode: {result['encode_time']:.3f}s")
        print(f"  Decode: {result['decode_time']:.3f}s")
        print(f"  Total:  {result['total_time']:.3f}s")
        print(f"  Throughput: {result['throughput_mb_sec']:.2f} MB/sec")


if __name__ == '__main__':
    main()
