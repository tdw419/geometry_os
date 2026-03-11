"""
Benchmarking suite for PixelRTS operations.

Provides performance benchmarking tools for measuring:
- Pattern detection (CPU vs GPU performance, memory usage, throughput)
- Blueprint layer (analysis, encoding/decoding, serialization, overlay rendering)
- Regression detection (historical storage, threshold-based detection, alerts)
- WASM GPU execution (latency, throughput, speedup metrics)
"""

from .blueprint_benchmark import BenchmarkSuite, BlueprintBenchmark, BlueprintBenchmarkResult
from .blueprint_benchmark import main as blueprint_benchmark_main
from .pattern_benchmark import BenchmarkResult as PatternBenchmarkResult
from .pattern_benchmark import PatternBenchmark
from .pattern_benchmark import main as pattern_benchmark_main
from .regression import (
    Alert,
    # Alerts
    AlertLevel,
    AlertManager,
    # Bisect
    BisectHelper,
    Regression,
    RegressionDetector,
    # Detection
    RegressionThreshold,
    # Storage
    ResultStorage,
    StoredBenchmarkResult,
    TrendAnalysis,
    TrendDirection,
)
from .wasm_gpu_benchmark import (
    ADD_WASM,
    FIBONACCI_WASM,
    MULTIPLY_WASM,
    BenchmarkResult,
    ComparisonResult,
    WASMGPUBenchmark,
)

__all__ = [
    # Pattern detection benchmarks
    'PatternBenchmarkResult',
    'PatternBenchmark',
    'pattern_benchmark_main',
    # Blueprint layer benchmarks
    'BlueprintBenchmarkResult',
    'BlueprintBenchmark',
    'BenchmarkSuite',
    'blueprint_benchmark_main',
    # Regression detection
    'ResultStorage',
    'StoredBenchmarkResult',
    'RegressionThreshold',
    'Regression',
    'TrendAnalysis',
    'TrendDirection',
    'RegressionDetector',
    'AlertLevel',
    'Alert',
    'AlertManager',
    'BisectHelper',
    # WASM GPU benchmarks
    'BenchmarkResult',
    'ComparisonResult',
    'WASMGPUBenchmark',
    'ADD_WASM',
    'FIBONACCI_WASM',
    'MULTIPLY_WASM',
]
