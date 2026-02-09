# tests/test_pattern_detector.py
import pytest
import numpy as np
from PIL import Image
import tempfile
from pathlib import Path


def test_pattern_detector_initializes():
    """Test that PatternDetector can be initialized with an image."""
    # Create a simple test image
    img_array = np.zeros((64, 64, 4), dtype=np.uint8)
    img_array[:, :] = [128, 64, 32, 255]
    img = Image.fromarray(img_array, 'RGBA')

    # Save to temp file
    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        img.save(f)
        temp_path = f.name

    try:
        from systems.pixel_compiler.pattern_detector import PatternDetector
        detector = PatternDetector(temp_path)
        assert detector.image is not None
        assert detector.width == 64
        assert detector.height == 64
    finally:
        Path(temp_path).unlink()


def test_sobel_edge_detection_returns_edges():
    """Test that Sobel edge detection returns edge array."""
    from systems.pixel_compiler.pattern_detector import PatternDetector
    # Create image with clear edge (left half dark, right half light)
    img_array = np.zeros((64, 64, 4), dtype=np.uint8)
    img_array[:, :32, :] = [0, 0, 0, 255]      # Left half: black
    img_array[:, 32:, :] = [255, 255, 255, 255]  # Right half: white

    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        Image.fromarray(img_array).save(f)
        temp_path = f.name

    try:
        detector = PatternDetector(temp_path)
        result = detector.detect_edges_sobel()

        assert hasattr(result, 'edges')
        assert isinstance(result.edges, np.ndarray)
        assert result.edges.shape == (64, 64)
        assert result.method == 'sobel'
    finally:
        Path(temp_path).unlink()


def test_sobel_edge_count():
    """Test that Sobel detects expected number of edges in test pattern."""
    from systems.pixel_compiler.pattern_detector import PatternDetector
    # Create checkerboard pattern (should have many edges)
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
        detector = PatternDetector(temp_path)
        result = detector.detect_edges_sobel()

        assert result.edge_count > 100  # Checkerboard has many edges
        assert 0 < result.edge_density < 1
    finally:
        Path(temp_path).unlink()


def test_canny_edge_detection():
    """Test that Canny edge detection works."""
    from systems.pixel_compiler.pattern_detector import PatternDetector
    # Create image with rectangle (should have clear edges)
    img_array = np.zeros((64, 64, 4), dtype=np.uint8)
    img_array[16:48, 16:48, :] = [255, 255, 255, 255]  # White rectangle

    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        Image.fromarray(img_array).save(f)
        temp_path = f.name

    try:
        detector = PatternDetector(temp_path)
        result = detector.detect_edges_canny()

        assert result.method == 'canny'
        assert result.edges.shape == (64, 64)
        # Rectangle should have edges
        assert result.edge_count > 0
    finally:
        Path(temp_path).unlink()
