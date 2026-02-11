#!/usr/bin/env python3
"""
Tests for Infinite Map Transparent Compression.

Tests automatic compression for files in cold zone.
"""

import pytest
from systems.pixel_compiler.infinite_map_compression import CompressionEngine


# Cache for mock mode detection
_MOCK_MODE = None


def is_mock_mode():
    """Check if running in mock mode (zstandard not available)."""
    global _MOCK_MODE
    if _MOCK_MODE is None:
        try:
            import zstandard
            _MOCK_MODE = False
        except ImportError:
            _MOCK_MODE = True
    return _MOCK_MODE


def test_empty_compression_stats():
    """New compression engine has no data."""
    engine = CompressionEngine()
    stats = engine.get_statistics()
    assert stats['total_files'] == 0
    assert stats['total_compressed'] == 0
    assert stats['total_decompressed'] == 0
    assert stats['compression_ratio'] == 0


@pytest.mark.skipif(is_mock_mode(), reason="Mock mode doesn't compress (adds prefix)")
def test_compress_file():
    """Compression engine compresses file data."""
    engine = CompressionEngine()

    # Compress some data
    original = b"x" * 1000  # 4000 bytes
    compressed = engine.compress_file("test/file", original)

    assert compressed is not None
    # Real compression should be smaller
    assert len(compressed) < len(original), "Should be smaller"


@pytest.mark.skipif(is_mock_mode(), reason="Mock mode doesn't compress (adds prefix)")
def test_compress_file_with_threshold():
    """Compression only applied if file meets criteria."""
    engine = CompressionEngine(compress_threshold=100)

    # Small file - below threshold
    small = b"x" * 10
    result1 = engine.compress_file("small", small, file_size=len(small))

    # Large file - above threshold
    large = b"x" * 200
    result2 = engine.compress_file("large", large, file_size=len(large))

    assert result1 is None, "Small files should not be compressed"
    assert result2 is not None, "Large files should be compressed"


@pytest.mark.skipif(is_mock_mode(), reason="Mock mode doesn't compress (adds prefix)")
def test_decompress_file():
    """Compression engine decompresses compressed data."""
    engine = CompressionEngine()

    original = b"Hello, World! " * 100
    compressed = engine.compress_file("test", original)

    assert compressed is not None

    # Decompress
    decompressed = engine.decompress_file(compressed)

    assert decompressed == original


@pytest.mark.skipif(is_mock_mode(), reason="Mock mode doesn't compress (adds prefix)")
def test_compression_ratio_tracking():
    """Engine tracks compression ratio."""
    engine = CompressionEngine()

    # Compress some data
    data = b"x" * 1000
    engine.compress_file("test", data)

    stats = engine.get_statistics()

    assert stats['compression_ratio'] > 0
    assert stats['compression_ratio'] <= 1.0


def test_cold_zone_detection():
    """Engine detects files in cold zone."""
    from systems.pixel_compiler.infinite_map_v2 import ClusterLocation

    engine = CompressionEngine(compress_threshold=100)  # Set threshold to 100 seconds

    # Create some file locations
    hot_loc = ClusterLocation(x=1024, y=1024)  # Center (hot)
    cold_loc = ClusterLocation(x=10, y=10)  # Edge (cold)

    # Cold file should be compressible (access_age > threshold)
    assert engine.should_compress(cold_loc, access_age=3600) is True

    # Hot file should not be compressible (access_age <= threshold)
    assert engine.should_compress(hot_loc, access_age=10) is False


@pytest.mark.skipif(is_mock_mode(), reason="Mock mode doesn't compress (adds prefix)")
def test_get_compression_metadata():
    """Engine provides compression metadata."""
    engine = CompressionEngine()

    data = b"test data for compression"
    compressed = engine.compress_file("test/file", data)

    assert compressed is not None

    metadata = engine.get_compression_metadata("test/file")

    assert metadata['path'] == "test/file"
    assert metadata['compressed'] is True
    assert metadata['original_size'] > 0
    assert metadata['compressed_size'] > 0
    assert metadata['compressed_size'] < metadata['original_size']


@pytest.mark.skipif(is_mock_mode(), reason="Mock mode doesn't compress (adds prefix)")
def test_clear_compression_cache():
    """Engine can clear compression cache."""
    engine = CompressionEngine()

    # Use larger data to exceed compression threshold (512 bytes)
    data = b"test data for compression" * 100  # > 512 bytes
    compressed = engine.compress_file("file", data)

    assert compressed is not None
    assert engine.get_cache_size() > 0

    engine.clear_cache()

    assert engine.get_cache_size() == 0


def test_batch_compress():
    """Engine can compress multiple files."""
    engine = CompressionEngine()

    files = {
        "file1": b"data1",
        "file2": b"data2",
        "file3": b"data3",
    }

    results = engine.batch_compress(files)

    # Check all files were processed
    assert len(results) == 3

    # Check each file was processed (same assertion for both modes)
    for path in files:
        assert path in results, f"File {path} not in results"


@pytest.mark.skipif(is_mock_mode(), reason="Mock mode doesn't compress (adds prefix)")
def test_export_import_compression_table():
    """Engine can export and import compression table."""
    engine = CompressionEngine()

    # Compress some files (use data larger than 512 bytes threshold)
    engine.compress_file("file1", b"data1" * 200)
    engine.compress_file("file2", b"data2" * 200)

    # Export
    exported = engine.export_compression_table()

    assert 'compression_table' in exported
    assert len(exported['compression_table']) == 2

    # Import to new engine
    engine2 = CompressionEngine()
    engine2.import_compression_table(exported)

    # Should have cached metadata
    stats2 = engine2.get_statistics()
    assert stats2['total_files'] == 2
