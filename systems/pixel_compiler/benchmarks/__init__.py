"""
Benchmarking suite for PixelRTS operations.

Provides performance benchmarking tools for measuring:
- Pattern detection (CPU vs GPU performance, memory usage, throughput)
- Blueprint layer (analysis, encoding/decoding, serialization, overlay rendering)
- Regression detection (historical storage, threshold-based detection, alerts)
- WASM GPU execution (latency, throughput, speedup metrics)
"""

from .pattern_benchmark import (
    BenchmarkResult as PatternBenchmarkResult,
    PatternBenchmark,
    main as pattern_benchmark_main
)

from .wasm_gpu_benchmark import (
    BenchmarkResult,
    ComparisonResult,
    WASMGPUBenchmark,
    ADD_WASM,
    FIBONACCI_WASM,
    MULTIPLY_WASM,
)

from .blueprint_benchmark import (
    BlueprintBenchmarkResult,
    BlueprintBenchmark,
    BenchmarkSuite,
    main as blueprint_benchmark_main
)

from .regression import (
    # Storage
    ResultStorage,
    StoredBenchmarkResult,
    # Detection
    RegressionThreshold,
    Regression,
    TrendAnalysis,
    TrendDirection,
    RegressionDetector,
    # Alerts
    AlertLevel,
    Alert,
    AlertManager,
    # Bisect
    BisectHelper,
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
