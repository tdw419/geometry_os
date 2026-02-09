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
