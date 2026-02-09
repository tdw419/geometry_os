"""
Benchmarking suite for PixelRTS pattern detection.

Provides performance benchmarking tools for measuring CPU vs GPU
performance, memory usage, and throughput across different image sizes.
"""

from .pattern_benchmark import (
    BenchmarkResult,
    PatternBenchmark,
    main as benchmark_main
)

__all__ = [
    'BenchmarkResult',
    'PatternBenchmark',
    'benchmark_main'
]
