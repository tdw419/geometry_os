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
        from pattern_detector import PatternDetector
        detector = PatternDetector(temp_path)
        assert detector.image is not None
        assert detector.width == 64
        assert detector.height == 64
    finally:
        Path(temp_path).unlink()


def test_sobel_edge_detection_returns_edges():
    """Test that Sobel edge detection returns edge array."""
    from pattern_detector import PatternDetector
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
    from pattern_detector import PatternDetector
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
    from pattern_detector import PatternDetector
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


def test_fourier_analysis_detects_periodicity():
    """Test that Fourier analysis detects periodic patterns."""
    from pattern_detector import PatternDetector
    # Create image with horizontal stripes (periodic pattern)
    img_array = np.zeros((64, 64, 4), dtype=np.uint8)
    for i in range(64):
        if (i // 8) % 2 == 0:  # 8-pixel wide stripes
            img_array[i, :, :] = [255, 255, 255, 255]
        else:
            img_array[i, :, :] = [0, 0, 0, 255]

    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        Image.fromarray(img_array).save(f)
        temp_path = f.name

    try:
        detector = PatternDetector(temp_path)
        result = detector.analyze_fourier()

        assert hasattr(result, 'frequencies')
        assert hasattr(result, 'magnitude')
        assert hasattr(result, 'dominant_frequency')
        assert len(result.dominant_frequency) == 2
        # Should detect periodicity in y direction (stripes are horizontal)
        assert result.has_periodic_patterns
        assert len(result.periodic_regions) > 0
    finally:
        Path(temp_path).unlink()


def test_fourier_analysis_on_noise():
    """Test that Fourier analysis correctly identifies no periodicity in noise."""
    from pattern_detector import PatternDetector
    # Create random noise image
    np.random.seed(42)
    img_array = np.random.randint(0, 256, (64, 64, 4), dtype=np.uint8)

    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        Image.fromarray(img_array).save(f)
        temp_path = f.name

    try:
        detector = PatternDetector(temp_path)
        result = detector.analyze_fourier()

        # Noise should not have strong periodic components
        assert not result.has_periodic_patterns or len(result.periodic_regions) == 0
    finally:
        Path(temp_path).unlink()


def test_spatial_clustering_detects_regions():
    """Test that DBSCAN detects spatial clusters of similar pixels."""
    from pattern_detector import PatternDetector
    # Create image with two distinct bright regions
    img_array = np.zeros((64, 64, 4), dtype=np.uint8)
    # Region 1: top-left quadrant
    img_array[0:32, 0:32, :] = [200, 200, 200, 255]
    # Region 2: bottom-right quadrant
    img_array[32:64, 32:64, :] = [200, 200, 200, 255]
    # Background: dark
    # (already zeros)

    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        Image.fromarray(img_array).save(f)
        temp_path = f.name

    try:
        detector = PatternDetector(temp_path)
        result = detector.detect_clusters(eps=5, min_samples=20, feature_type="position")

        assert hasattr(result, 'num_clusters')
        assert result.num_clusters >= 2  # Should detect at least the two bright regions
        assert hasattr(result, 'cluster_centers')
        assert len(result.cluster_centers) >= 2
    finally:
        Path(temp_path).unlink()


def test_color_clustering_groups_similar_colors():
    """Test that color-based clustering groups pixels with similar colors."""
    from pattern_detector import PatternDetector
    # Create image with three color regions
    img_array = np.zeros((64, 64, 4), dtype=np.uint8)
    # Red region
    img_array[0:21, :, :] = [255, 0, 0, 255]
    # Green region
    img_array[21:43, :, :] = [0, 255, 0, 255]
    # Blue region
    img_array[43:64, :, :] = [0, 0, 255, 255]

    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        Image.fromarray(img_array).save(f)
        temp_path = f.name

    try:
        detector = PatternDetector(temp_path)
        result = detector.detect_clusters(eps=10, min_samples=50, feature_type="color")

        # Should detect the three color bands
        assert result.num_clusters >= 2
    finally:
        Path(temp_path).unlink()
