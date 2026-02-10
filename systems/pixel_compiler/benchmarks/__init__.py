"""
Benchmarking suite for PixelRTS operations.

Provides performance benchmarking tools for measuring:
- Pattern detection (CPU vs GPU performance, memory usage, throughput)
- Blueprint layer (analysis, encoding/decoding, serialization, overlay rendering)
"""

from .pattern_benchmark import (
    BenchmarkResult,
    PatternBenchmark,
    main as pattern_benchmark_main
)

from .blueprint_benchmark import (
    BlueprintBenchmarkResult,
    BlueprintBenchmark,
    BenchmarkSuite,
    main as blueprint_benchmark_main
)

__all__ = [
    # Pattern detection benchmarks
    'BenchmarkResult',
    'PatternBenchmark',
    'pattern_benchmark_main',
    # Blueprint layer benchmarks
    'BlueprintBenchmarkResult',
    'BlueprintBenchmark',
    'BenchmarkSuite',
    'blueprint_benchmark_main'
]
