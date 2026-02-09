# tests/test_batch_processor.py
import pytest
import numpy as np
from PIL import Image
import tempfile
from pathlib import Path
from typing import List, Dict, Any


def create_test_image(size=(64, 64), color=(128, 64, 32, 255), suffix='.png') -> str:
    """Helper to create a test image and return its path."""
    img_array = np.zeros((size[1], size[0], 4), dtype=np.uint8)
    img_array[:, :] = color
    img = Image.fromarray(img_array, 'RGBA')

    with tempfile.NamedTemporaryFile(suffix=suffix, delete=False) as f:
        img.save(f)
        return f.name


def test_batch_processor_initializes():
    """Test that BatchPatternProcessor can be initialized."""
    from batch_processor import BatchPatternProcessor

    processor = BatchPatternProcessor()
    assert processor is not None
    assert processor.max_workers is None  # Default to None (auto)
    assert processor.use_gpu is True
    assert processor.device == 'auto'


def test_batch_processor_with_custom_workers():
    """Test that BatchPatternProcessor accepts custom max_workers."""
    from batch_processor import BatchPatternProcessor

    processor = BatchPatternProcessor(max_workers=4, use_gpu=False, device='cpu')
    assert processor.max_workers == 4
    assert processor.use_gpu is False
    assert processor.device == 'cpu'


def test_process_batch_empty_list():
    """Test processing an empty batch of images."""
    from batch_processor import BatchPatternProcessor, BatchResult

    processor = BatchPatternProcessor()
    result = processor.process_batch([], methods=['sobel'])

    assert isinstance(result, BatchResult)
    assert len(result.results) == 0
    assert result.total_images == 0
    assert result.successful == 0
    assert result.failed == 0


def test_process_batch_single_image():
    """Test processing a single image."""
    from batch_processor import BatchPatternProcessor

    # Create test image
    temp_path = create_test_image()

    try:
        processor = BatchPatternProcessor()
        result = processor.process_batch([temp_path], methods=['sobel'])

        assert result.total_images == 1
        assert result.successful == 1
        assert result.failed == 0
        assert len(result.results) == 1
        assert temp_path in result.results
        assert 'sobel' in result.results[temp_path]
    finally:
        Path(temp_path).unlink()


def test_process_batch_multiple_images():
    """Test processing multiple images in parallel."""
    from batch_processor import BatchPatternProcessor

    # Create test images
    paths = [create_test_image() for _ in range(5)]

    try:
        processor = BatchPatternProcessor(max_workers=2)
        result = processor.process_batch(paths, methods=['sobel', 'canny'])

        assert result.total_images == 5
        assert result.successful == 5
        assert result.failed == 0
        assert len(result.results) == 5

        # Check each image has both methods
        for path in paths:
            assert path in result.results
            assert 'sobel' in result.results[path]
            assert 'canny' in result.results[path]
    finally:
        for path in paths:
            Path(path).unlink()


def test_process_batch_with_invalid_path():
    """Test handling of invalid image paths."""
    from batch_processor import BatchPatternProcessor

    processor = BatchPatternProcessor()
    result = processor.process_batch(['/nonexistent/image.png'], methods=['sobel'])

    assert result.total_images == 1
    assert result.successful == 0
    assert result.failed == 1
    assert len(result.results) == 1
    assert '/nonexistent/image.png' in result.results
    # Should contain error info
    assert 'error' in result.results['/nonexistent/image.png']


def test_process_batch_mixed_success_failure():
    """Test processing with mix of valid and invalid paths."""
    from batch_processor import BatchPatternProcessor

    valid_path = create_test_image()

    try:
        processor = BatchPatternProcessor()
        result = processor.process_batch(
            [valid_path, '/invalid/path.png'],
            methods=['sobel']
        )

        assert result.total_images == 2
        assert result.successful == 1
        assert result.failed == 1
    finally:
        Path(valid_path).unlink()


def test_process_batch_with_progress_callback():
    """Test that progress callback is called during processing."""
    from batch_processor import BatchPatternProcessor

    paths = [create_test_image() for _ in range(3)]
    progress_updates = []

    def progress_callback(current: int, total: int, image_path: str):
        progress_updates.append({'current': current, 'total': total, 'path': image_path})

    try:
        processor = BatchPatternProcessor(max_workers=1)  # Sequential for predictable updates
        result = processor.process_batch(paths, methods=['sobel'], progress_callback=progress_callback)

        assert len(progress_updates) == 3
        assert progress_updates[0]['current'] == 1
        assert progress_updates[0]['total'] == 3
        assert progress_updates[-1]['current'] == 3
    finally:
        for path in paths:
            Path(path).unlink()


def test_process_directory_with_pattern():
    """Test processing all images in a directory matching a pattern."""
    from batch_processor import BatchPatternProcessor

    # Create temp directory with test images
    with tempfile.TemporaryDirectory() as temp_dir:
        temp_path = Path(temp_dir)

        # Create test images
        (Image.new('RGBA', (64, 64), (128, 64, 32, 255))).save(temp_path / 'test1.png')
        (Image.new('RGBA', (64, 64), (128, 64, 32, 255))).save(temp_path / 'test2.png')
        (Image.new('RGBA', (64, 64), (128, 64, 32, 255))).save(temp_path / 'test3.rts.png')
        # Create a text file to verify it's not processed
        (temp_path / 'readme.txt').write_text('This is a text file')

        processor = BatchPatternProcessor()

        # Process all PNG files
        result = processor.process_directory(str(temp_dir), pattern='*.png', methods=['sobel'])

        assert result.total_images == 3
        assert result.successful == 3
        assert result.failed == 0

        # Process only .rts.png files
        result2 = processor.process_directory(str(temp_dir), pattern='*.rts.png', methods=['sobel'])

        assert result2.total_images == 1
        assert result2.successful == 1


def test_process_directory_recursive():
    """Test processing images in nested directories."""
    from batch_processor import BatchPatternProcessor

    with tempfile.TemporaryDirectory() as temp_dir:
        temp_path = Path(temp_dir)

        # Create nested structure
        subdir = temp_path / 'subdir'
        subdir.mkdir()

        (Image.new('RGBA', (64, 64), (128, 64, 32, 255))).save(temp_path / 'root.png')
        (Image.new('RGBA', (64, 64), (128, 64, 32, 255))).save(subdir / 'nested.png')

        processor = BatchPatternProcessor()
        result = processor.process_directory(str(temp_dir), pattern='**/*.png', methods=['sobel'])

        assert result.total_images == 2
        assert result.successful == 2


def test_process_batch_with_multiple_methods():
    """Test processing with multiple detection methods."""
    from batch_processor import BatchPatternProcessor

    temp_path = create_test_image()

    try:
        processor = BatchPatternProcessor()
        result = processor.process_batch(
            [temp_path],
            methods=['sobel', 'canny', 'fourier']
        )

        assert result.successful == 1
        image_result = result.results[temp_path]

        # Check all methods are present
        assert 'sobel' in image_result
        assert 'canny' in image_result
        assert 'fourier' in image_result
        assert 'error' not in image_result
    finally:
        Path(temp_path).unlink()


def test_process_batch_with_clustering_method():
    """Test processing with clustering analysis."""
    from batch_processor import BatchPatternProcessor

    # Create image with distinct regions for clustering
    img_array = np.zeros((64, 64, 4), dtype=np.uint8)
    img_array[0:16, 0:16, :] = [255, 255, 255, 255]
    img_array[48:64, 48:64, :] = [255, 255, 255, 255]

    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        Image.fromarray(img_array).save(f)
        temp_path = f.name

    try:
        processor = BatchPatternProcessor()
        result = processor.process_batch(
            [temp_path],
            methods=['cluster_position']
        )

        assert result.successful == 1
        assert 'cluster_position' in result.results[temp_path]
    finally:
        Path(temp_path).unlink()


def test_batch_result_metadata():
    """Test that BatchResult contains processing metadata."""
    from batch_processor import BatchPatternProcessor, BatchResult

    paths = [create_test_image() for _ in range(3)]

    try:
        processor = BatchPatternProcessor(max_workers=2)
        result = processor.process_batch(paths, methods=['sobel'])

        assert hasattr(result, 'total_images')
        assert hasattr(result, 'successful')
        assert hasattr(result, 'failed')
        assert hasattr(result, 'results')
        assert hasattr(result, 'processing_time')
        assert hasattr(result, 'errors')

        # Check timing info
        assert result.processing_time > 0

        # Check errors list
        if result.failed > 0:
            assert len(result.errors) > 0
    finally:
        for path in paths:
            Path(path).unlink()


def test_worker_pool_configuration():
    """Test that max_workers correctly limits parallelism."""
    from batch_processor import BatchPatternProcessor

    paths = [create_test_image() for _ in range(10)]

    try:
        processor = BatchPatternProcessor(max_workers=2)
        # Process with limited workers
        result = processor.process_batch(paths, methods=['sobel'])

        assert result.successful == 10
        assert processor.max_workers == 2
    finally:
        for path in paths:
            Path(path).unlink()


def test_batch_result_has_results_dict():
    """Test that BatchResult.results is a properly structured dict."""
    from batch_processor import BatchPatternProcessor

    temp_path = create_test_image()

    try:
        processor = BatchPatternProcessor()
        result = processor.process_batch([temp_path], methods=['sobel'])

        assert isinstance(result.results, dict)
        assert len(result.results) > 0

        # Check structure of single image result
        image_result = result.results[temp_path]
        assert isinstance(image_result, dict)
        assert 'sobel' in image_result
    finally:
        Path(temp_path).unlink()


def test_process_batch_empty_methods():
    """Test processing with no methods specified."""
    from batch_processor import BatchPatternProcessor

    temp_path = create_test_image()

    try:
        processor = BatchPatternProcessor()
        result = processor.process_batch([temp_path], methods=[])

        # Should succeed but with no analysis results
        assert result.successful == 1
        assert len(result.results[temp_path]) == 0
    finally:
        Path(temp_path).unlink()


def test_process_batch_with_invalid_method():
    """Test handling of invalid analysis method."""
    from batch_processor import BatchPatternProcessor

    temp_path = create_test_image()

    try:
        processor = BatchPatternProcessor()
        result = processor.process_batch([temp_path], methods=['invalid_method'])

        # Should handle gracefully - image succeeds but method has error
        assert result.successful == 1
        assert 'invalid_method' in result.results[temp_path]
        assert 'error' in result.results[temp_path]['invalid_method']
    finally:
        Path(temp_path).unlink()
