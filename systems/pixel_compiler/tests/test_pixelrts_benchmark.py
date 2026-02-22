# systems/pixel_compiler/tests/test_pixelrts_benchmark.py
"""
Test suite for PixelRTS benchmarking framework.
"""

import pytest
from pathlib import Path


def test_benchmark_framework_exists():
    """Test that benchmark framework is available."""
    from systems.pixel_compiler.benchmark_pixelrts import PixelRTSBenchmark
    bench = PixelRTSBenchmark()
    assert bench is not None


def test_benchmark_small_file():
    """Test benchmark with 1MB file."""
    from systems.pixel_compiler.benchmark_pixelrts import PixelRTSBenchmark

    bench = PixelRTSBenchmark()
    results = bench.benchmark_encode_decode(
        data_size=1024*1024,  # 1MB
        iterations=3
    )
    assert 'encode_time' in results
    assert 'decode_time' in results
    assert 'throughput_mb_sec' in results
    assert results['throughput_mb_sec'] > 0
