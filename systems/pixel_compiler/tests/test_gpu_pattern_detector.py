# tests/test_gpu_pattern_detector.py
"""
Tests for GPU-accelerated pattern detection.

Follows TDD approach: tests written first, then implementation.
"""
import pytest
import numpy as np
from PIL import Image
import tempfile
from pathlib import Path
from unittest.mock import patch, MagicMock


def test_gpu_pattern_detector_initializes_with_auto_device():
    """Test that GpuPatternDetector can be initialized with auto device selection."""
    # Create a simple test image
    img_array = np.zeros((64, 64, 4), dtype=np.uint8)
    img_array[:, :] = [128, 64, 32, 255]
    img = Image.fromarray(img_array, 'RGBA')

    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        img.save(f)
        temp_path = f.name

    try:
        from gpu_pattern_detector import GpuPatternDetector

        # Auto device should work (falls back to CPU if no CUDA)
        detector = GpuPatternDetector(temp_path, device='auto')
        assert detector.image is not None
        assert detector.width == 64
        assert detector.height == 64
        assert detector.device is not None
    finally:
        Path(temp_path).unlink()


def test_gpu_pattern_detector_cpu_fallback():
    """Test that GpuPatternDetector falls back to CPU when CUDA is unavailable."""
    img_array = np.zeros((64, 64, 4), dtype=np.uint8)
    img_array[:, :] = [128, 64, 32, 255]
    img = Image.fromarray(img_array, 'RGBA')

    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        img.save(f)
        temp_path = f.name

    try:
        from gpu_pattern_detector import GpuPatternDetector

        # Explicitly request CPU
        detector = GpuPatternDetector(temp_path, device='cpu')
        assert detector.device.type == 'cpu'
        assert hasattr(detector, 'timing_metrics')
    finally:
        Path(temp_path).unlink()


def test_get_optimal_device():
    """Test that get_optimal_device returns a valid torch device."""
    from gpu_pattern_detector import GpuPatternDetector

    device = GpuPatternDetector.get_optimal_device()
    assert device is not None
    assert hasattr(device, 'type')
    assert device.type in ('cuda', 'cpu', 'mps')


def test_detect_edges_sobel_gpu_returns_result():
    """Test that GPU Sobel edge detection returns proper result structure."""
    img_array = np.zeros((64, 64, 4), dtype=np.uint8)
    # Create edge pattern
    img_array[:, :32, :] = [0, 0, 0, 255]
    img_array[:, 32:, :] = [255, 255, 255, 255]

    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        Image.fromarray(img_array).save(f)
        temp_path = f.name

    try:
        from gpu_pattern_detector import GpuPatternDetector

        detector = GpuPatternDetector(temp_path, device='cpu')
        result = detector.detect_edges_sobel_gpu()

        assert hasattr(result, 'edges')
        assert isinstance(result.edges, np.ndarray)
        assert result.edges.shape == (64, 64)
        assert hasattr(result, 'edge_count')
        assert hasattr(result, 'edge_density')
        assert hasattr(result, 'timing_info')
        assert 'execution_time_ms' in result.timing_info
    finally:
        Path(temp_path).unlink()


def test_detect_edges_sobel_gpu_with_threshold():
    """Test GPU Sobel with threshold parameter."""
    img_array = np.zeros((64, 64, 4), dtype=np.uint8)
    img_array[:, :32, :] = [0, 0, 0, 255]
    img_array[:, 32:, :] = [255, 255, 255, 255]

    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        Image.fromarray(img_array).save(f)
        temp_path = f.name

    try:
        from gpu_pattern_detector import GpuPatternDetector

        detector = GpuPatternDetector(temp_path, device='cpu')
        result = detector.detect_edges_sobel_gpu(threshold=50)

        assert result.edges.shape == (64, 64)
        # With threshold, should have fewer edge pixels
        assert result.edge_count < detector.width * detector.height
    finally:
        Path(temp_path).unlink()


def test_detect_edges_canny_gpu():
    """Test GPU Canny edge detection."""
    img_array = np.zeros((64, 64, 4), dtype=np.uint8)
    # Create rectangle
    img_array[16:48, 16:48, :] = [255, 255, 255, 255]

    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        Image.fromarray(img_array).save(f)
        temp_path = f.name

    try:
        from gpu_pattern_detector import GpuPatternDetector

        detector = GpuPatternDetector(temp_path, device='cpu')
        result = detector.detect_edges_canny_gpu(low_threshold=50, high_threshold=150)

        assert hasattr(result, 'edges')
        assert result.method == 'canny_gpu'
        assert result.edges.shape == (64, 64)
        assert result.edge_count > 0
        assert 'execution_time_ms' in result.timing_info
    finally:
        Path(temp_path).unlink()


def test_analyze_fourier_gpu():
    """Test GPU Fourier analysis."""
    img_array = np.zeros((64, 64, 4), dtype=np.uint8)
    # Create periodic stripes
    for i in range(64):
        if (i // 8) % 2 == 0:
            img_array[i, :, :] = [255, 255, 255, 255]
        else:
            img_array[i, :, :] = [0, 0, 0, 255]

    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        Image.fromarray(img_array).save(f)
        temp_path = f.name

    try:
        from gpu_pattern_detector import GpuPatternDetector

        detector = GpuPatternDetector(temp_path, device='cpu')
        result = detector.analyze_fourier_gpu(max_frequencies=5)

        assert hasattr(result, 'frequencies')
        assert hasattr(result, 'magnitude')
        assert hasattr(result, 'dominant_frequency')
        assert len(result.dominant_frequency) == 2
        # Should detect periodicity
        assert result.has_periodic_patterns
        assert 'execution_time_ms' in result.timing_info
    finally:
        Path(temp_path).unlink()


def test_timing_metrics_tracking():
    """Test that timing metrics are properly tracked."""
    img_array = np.zeros((64, 64, 4), dtype=np.uint8)
    img_array[:, :] = [128, 64, 32, 255]

    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        Image.fromarray(img_array).save(f)
        temp_path = f.name

    try:
        from gpu_pattern_detector import GpuPatternDetector

        detector = GpuPatternDetector(temp_path, device='cpu')

        # Run multiple operations
        detector.detect_edges_sobel_gpu()
        detector.analyze_fourier_gpu()

        # Check timing metrics
        assert hasattr(detector, 'timing_metrics')
        assert len(detector.timing_metrics) > 0
        assert 'sobel_gpu' in detector.timing_metrics
        assert 'fourier_gpu' in detector.timing_metrics
    finally:
        Path(temp_path).unlink()


def test_memory_tracking():
    """Test that memory usage is tracked."""
    img_array = np.zeros((64, 64, 4), dtype=np.uint8)
    img_array[:, :] = [128, 64, 32, 255]

    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        Image.fromarray(img_array).save(f)
        temp_path = f.name

    try:
        from gpu_pattern_detector import GpuPatternDetector

        detector = GpuPatternDetector(temp_path, device='cpu')
        result = detector.detect_edges_sobel_gpu()

        # Check memory tracking in timing info
        assert 'peak_memory_mb' in result.timing_info
    finally:
        Path(temp_path).unlink()


def test_get_performance_summary():
    """Test that performance summary is generated correctly."""
    img_array = np.zeros((64, 64, 4), dtype=np.uint8)
    img_array[:, :] = [128, 64, 32, 255]

    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        Image.fromarray(img_array).save(f)
        temp_path = f.name

    try:
        from gpu_pattern_detector import GpuPatternDetector

        detector = GpuPatternDetector(temp_path, device='cpu')
        detector.detect_edges_sobel_gpu()
        detector.analyze_fourier_gpu()

        summary = detector.get_performance_summary()

        assert isinstance(summary, dict)
        assert 'device' in summary
        assert 'operations' in summary
        assert 'total_time_ms' in summary
        assert len(summary['operations']) >= 2
    finally:
        Path(temp_path).unlink()


def test_invalid_device_raises_error():
    """Test that invalid device specification raises an error."""
    img_array = np.zeros((64, 64, 4), dtype=np.uint8)
    img_array[:, :] = [128, 64, 32, 255]

    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        Image.fromarray(img_array).save(f)
        temp_path = f.name

    try:
        from gpu_pattern_detector import GpuPatternDetector

        with pytest.raises(ValueError):
            GpuPatternDetector(temp_path, device='invalid_device')
    finally:
        Path(temp_path).unlink()


def test_checkerboard_pattern_gpu_sobel():
    """Test GPU Sobel on checkerboard pattern (should have many edges)."""
    img_array = np.zeros((64, 64, 4), dtype=np.uint8)
    for i in range(8):
        for j in range(8):
            if (i + j) % 2 == 0:
                img_array[i*8:(i+1)*8, j*8:(j+1)*8, :] = [255, 255, 255, 255]
            else:
                img_array[i*8:(i+1)*8, j*8:(j+1)*8, :] = [0, 0, 0, 255]

    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        Image.fromarray(img_array).save(f)
        temp_path = f.name

    try:
        from gpu_pattern_detector import GpuPatternDetector

        detector = GpuPatternDetector(temp_path, device='cpu')
        result = detector.detect_edges_sobel_gpu()

        # Checkerboard should have many edges
        assert result.edge_count > 100
        assert 0 < result.edge_density < 1
    finally:
        Path(temp_path).unlink()


def test_fourier_gpu_max_frequencies_parameter():
    """Test that max_frequencies parameter limits returned frequencies."""
    img_array = np.zeros((64, 64, 4), dtype=np.uint8)
    # Create multiple stripes
    for i in range(64):
        if (i // 4) % 2 == 0:
            img_array[i, :, :] = [255, 255, 255, 255]
        else:
            img_array[i, :, :] = [0, 0, 0, 255]

    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        Image.fromarray(img_array).save(f)
        temp_path = f.name

    try:
        from gpu_pattern_detector import GpuPatternDetector

        detector = GpuPatternDetector(temp_path, device='cpu')
        result = detector.analyze_fourier_gpu(max_frequencies=3)

        # Should limit to requested number
        assert len(result.periodic_regions) <= 3
    finally:
        Path(temp_path).unlink()
