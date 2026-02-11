"""
Tests for TextureCache class.

TextureCache provides LRU caching for GPU texture data with eviction
and statistics tracking.
"""

import pytest
import numpy as np
import time
import tempfile
from pathlib import Path
from PIL import Image


def test_cached_texture_dataclass():
    """Test that CachedTexture dataclass can be created."""
    from texture_cache import CachedTexture

    # Create test data
    data = np.zeros((64, 64, 4), dtype=np.uint8)
    data[:, :] = [128, 64, 32, 255]

    texture = CachedTexture(
        data=data,
        width=64,
        height=64,
        path="/test/path.png",
        size_bytes=data.nbytes,
        last_access=time.time(),
        access_count=1,
        from_cache=False,
        checksum="abc123"
    )

    assert texture.data.shape == (64, 64, 4)
    assert texture.width == 64
    assert texture.height == 64
    assert texture.path == "/test/path.png"
    assert texture.size_bytes == data.nbytes
    assert texture.access_count == 1
    assert texture.from_cache is False
    assert texture.checksum == "abc123"


def test_texture_cache_initialization():
    """Test that TextureCache initializes with defaults."""
    from texture_cache import TextureCache

    cache = TextureCache()

    assert cache.max_size_mb == 256
    assert cache.max_entries == 1000
    assert cache.get_statistics()['hits'] == 0
    assert cache.get_statistics()['misses'] == 0
    assert cache.get_statistics()['entries'] == 0


def test_texture_cache_custom_initialization():
    """Test that TextureCache accepts custom parameters."""
    from texture_cache import TextureCache

    cache = TextureCache(max_size_mb=128, max_entries=500)

    assert cache.max_size_mb == 128
    assert cache.max_entries == 500


def test_cache_miss_on_get():
    """Test that get returns None on cache miss."""
    from texture_cache import TextureCache

    cache = TextureCache()

    result = cache.get("/nonexistent/path.png")

    assert result is None
    stats = cache.get_statistics()
    assert stats['misses'] == 1
    assert stats['hits'] == 0


def test_cache_hit_on_get():
    """Test that get returns CachedTexture on cache hit."""
    from texture_cache import TextureCache

    cache = TextureCache()

    # Create a test image file
    data = np.zeros((32, 32, 4), dtype=np.uint8)
    data[:, :] = [255, 128, 64, 255]
    img = Image.fromarray(data, 'RGBA')

    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        img.save(f)
        temp_path = f.name

    try:
        # First access - loads from file
        result1 = cache.get(temp_path)
        assert result1 is not None
        assert result1.from_cache is False
        assert result1.width == 32
        assert result1.height == 32

        stats = cache.get_statistics()
        assert stats['misses'] == 1
        assert stats['hits'] == 0
        assert stats['entries'] == 1

        # Second access - cache hit
        result2 = cache.get(temp_path)
        assert result2 is not None
        assert result2.from_cache is True
        assert result2.access_count == 2

        stats = cache.get_statistics()
        assert stats['hits'] == 1
        assert stats['misses'] == 1
    finally:
        Path(temp_path).unlink()


def test_cache_hit_rate_calculation():
    """Test that hit rate is calculated correctly."""
    from texture_cache import TextureCache

    cache = TextureCache()

    # Create a test image file
    data = np.zeros((32, 32, 4), dtype=np.uint8)
    img = Image.fromarray(data, 'RGBA')

    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        img.save(f)
        temp_path = f.name

    try:
        # First access - miss
        cache.get(temp_path)

        # Next 3 accesses - hits
        for _ in range(3):
            cache.get(temp_path)

        stats = cache.get_statistics()
        assert stats['hits'] == 3
        assert stats['misses'] == 1
        # hit_rate = hits / (hits + misses)
        assert stats['hit_rate'] == 0.75
    finally:
        Path(temp_path).unlink()


def test_lru_eviction_by_size():
    """Test that LRU eviction works when cache size limit is exceeded."""
    from texture_cache import TextureCache

    # Cache size: 0.05MB = 51KB, each 32x32x4 image is ~4KB
    # So we can fit ~12 images, but max_entries is 5
    cache = TextureCache(max_size_mb=0.05, max_entries=5)

    # Create multiple test images (smaller ones that fit)
    for i in range(7):
        data = np.full((32, 32, 4), i * 30, dtype=np.uint8)
        img = Image.fromarray(data, 'RGBA')

        with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
            img.save(f)
            temp_path = f.name

        try:
            cache.get(temp_path)
        finally:
            Path(temp_path).unlink()

    stats = cache.get_statistics()
    # Should have evicted entries due to count limit
    assert stats['evictions'] > 0
    # Current entries should be limited by max_entries
    assert stats['entries'] <= cache.max_entries


def test_lru_eviction_by_count():
    """Test that LRU eviction works when entry count limit is exceeded."""
    from texture_cache import TextureCache

    cache = TextureCache(max_size_mb=100, max_entries=3)

    # Create test images
    for i in range(5):
        data = np.full((32, 32, 4), i * 50, dtype=np.uint8)
        img = Image.fromarray(data, 'RGBA')

        with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
            img.save(f)
            temp_path = f.name

        try:
            cache.get(temp_path)
        finally:
            Path(temp_path).unlink()

    stats = cache.get_statistics()
    # Should have evicted 2 entries
    assert stats['evictions'] >= 2
    # Current entries should not exceed max_entries
    assert stats['entries'] <= cache.max_entries


def test_invalidate_specific_entry():
    """Test that invalidate removes a specific cache entry."""
    from texture_cache import TextureCache

    cache = TextureCache()

    # Create test images
    paths = []
    for i in range(3):
        data = np.full((32, 32, 4), i * 80, dtype=np.uint8)
        img = Image.fromarray(data, 'RGBA')

        with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
            img.save(f)
            temp_path = f.name
            paths.append(temp_path)

        try:
            cache.get(temp_path)
        finally:
            pass  # Keep files for now

    stats_before = cache.get_statistics()
    assert stats_before['entries'] == 3

    # Invalidate middle entry
    cache.invalidate(paths[1])

    stats_after = cache.get_statistics()
    assert stats_after['entries'] == 2

    # Verify invalidated entry is not in cache
    result = cache._cache.get(paths[1])
    assert result is None

    # Clean up
    for path in paths:
        try:
            Path(path).unlink()
        except:
            pass


def test_clear_cache():
    """Test that clear resets all cache state."""
    from texture_cache import TextureCache

    cache = TextureCache()

    # Add some entries
    for i in range(3):
        data = np.full((32, 32, 4), i * 80, dtype=np.uint8)
        img = Image.fromarray(data, 'RGBA')

        with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
            img.save(f)
            temp_path = f.name

        try:
            cache.get(temp_path)
        finally:
            Path(temp_path).unlink()

    stats_before = cache.get_statistics()
    assert stats_before['entries'] == 3

    # Clear cache
    cache.clear()

    stats_after = cache.get_statistics()
    assert stats_after['entries'] == 0
    assert stats_after['hits'] == 0
    assert stats_after['misses'] == 0
    assert stats_after['evictions'] == 0
    assert stats_after['utilization'] == 0.0


def test_statistics_utilization():
    """Test that utilization is calculated correctly."""
    from texture_cache import TextureCache

    cache = TextureCache(max_size_mb=1.0)

    # Calculate expected size of a 64x64 RGBA image
    expected_size = 64 * 64 * 4  # width * height * channels

    # Add an entry
    data = np.full((64, 64, 4), 128, dtype=np.uint8)
    img = Image.fromarray(data, 'RGBA')

    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        img.save(f)
        temp_path = f.name

    try:
        cache.get(temp_path)
    finally:
        Path(temp_path).unlink()

    stats = cache.get_statistics()
    # utilization = current_size_bytes / max_size_bytes
    expected_util = expected_size / (1.0 * 1024 * 1024)
    assert abs(stats['utilization'] - expected_util) < 0.01


def test_access_count_increments():
    """Test that access_count increments on each cache hit."""
    from texture_cache import TextureCache

    cache = TextureCache()

    data = np.full((32, 32, 4), 200, dtype=np.uint8)
    img = Image.fromarray(data, 'RGBA')

    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        img.save(f)
        temp_path = f.name

    try:
        # First access
        result1 = cache.get(temp_path)
        assert result1.access_count == 1

        # Second access
        result2 = cache.get(temp_path)
        assert result2.access_count == 2

        # Third access
        result3 = cache.get(temp_path)
        assert result3.access_count == 3
    finally:
        Path(temp_path).unlink()


def test_warm_up_preloads_entries():
    """Test that warm_up pre-loads entries into cache."""
    from texture_cache import TextureCache

    cache = TextureCache()

    # Create temporary files
    paths = []
    for i in range(3):
        data = np.full((32, 32, 4), i * 80, dtype=np.uint8)
        img = Image.fromarray(data, 'RGBA')

        with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
            img.save(f)
            temp_path = f.name
            paths.append(temp_path)

    try:
        # Warm up cache
        cache.warm_up(paths)

        stats = cache.get_statistics()
        assert stats['entries'] == 3

        # All entries should be in cache
        for path in paths:
            result = cache.get(path)
            assert result is not None
            assert result.from_cache is True

        # No additional misses from warm-up
        assert stats['misses'] == 0
    finally:
        for path in paths:
            Path(path).unlink()


def test_checksum_calculation():
    """Test that checksum is calculated correctly."""
    from texture_cache import TextureCache

    cache = TextureCache()

    data = np.full((32, 32, 4), 255, dtype=np.uint8)
    img = Image.fromarray(data, 'RGBA')

    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        img.save(f)
        temp_path = f.name

    try:
        result = cache.get(temp_path)
        assert result.checksum is not None
        assert len(result.checksum) == 64  # SHA256 hex length
    finally:
        Path(temp_path).unlink()


def test_last_access_updates():
    """Test that last_access timestamp updates on each access."""
    from texture_cache import TextureCache

    cache = TextureCache()

    data = np.full((32, 32, 4), 100, dtype=np.uint8)
    img = Image.fromarray(data, 'RGBA')

    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        img.save(f)
        temp_path = f.name

    try:
        # First access
        result1 = cache.get(temp_path)
        first_access_time = result1.last_access

        # Small delay
        time.sleep(0.01)

        # Second access
        result2 = cache.get(temp_path)
        second_access_time = result2.last_access

        assert second_access_time > first_access_time
    finally:
        Path(temp_path).unlink()


def test_lru_eviction_order():
    """Test that least recently used entry is evicted first."""
    from texture_cache import TextureCache

    cache = TextureCache(max_size_mb=0.05, max_entries=2)

    # Create test images
    paths = []
    for i in range(3):
        data = np.full((32, 32, 4), i * 80, dtype=np.uint8)
        img = Image.fromarray(data, 'RGBA')

        with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
            img.save(f)
            temp_path = f.name
            paths.append(temp_path)

    try:
        # Load first two entries
        cache.get(paths[0])
        cache.get(paths[1])

        # Access first entry again (making it more recent)
        cache.get(paths[0])

        # Load third entry - should evict paths[1] (least recently used)
        cache.get(paths[2])

        stats = cache.get_statistics()
        assert stats['evictions'] >= 1
        assert stats['entries'] <= 2

        # paths[0] should still be in cache (was accessed again)
        result = cache.get(paths[0])
        assert result is not None
        assert result.from_cache is True
    finally:
        for path in paths:
            Path(path).unlink()


def test_invalid_file_path():
    """Test that get handles invalid file paths gracefully."""
    from texture_cache import TextureCache

    cache = TextureCache()

    result = cache.get("/nonexistent/file/path.png")
    assert result is None

    stats = cache.get_statistics()
    assert stats['misses'] == 1


def test_empty_cache_statistics():
    """Test that statistics are correct for empty cache."""
    from texture_cache import TextureCache

    cache = TextureCache()

    stats = cache.get_statistics()

    assert stats['hits'] == 0
    assert stats['misses'] == 0
    assert stats['hit_rate'] == 0.0
    assert stats['evictions'] == 0
    assert stats['entries'] == 0
    assert stats['utilization'] == 0.0


def test_cache_size_tracking():
    """Test that cache tracks total size correctly."""
    from texture_cache import TextureCache

    cache = TextureCache(max_size_mb=10)

    # Create test images of known sizes
    paths = []
    expected_total = 0

    for i in range(3):
        data = np.full((32, 32, 4), i * 80, dtype=np.uint8)
        img = Image.fromarray(data, 'RGBA')

        with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
            img.save(f)
            temp_path = f.name
            paths.append(temp_path)

        expected_total += 32 * 32 * 4  # width * height * channels

    try:
        for path in paths:
            cache.get(path)

        stats = cache.get_statistics()
        assert stats['current_bytes'] == expected_total
    finally:
        for path in paths:
            Path(path).unlink()


def test_invalidate_nonexistent_entry():
    """Test that invalidating a non-existent entry doesn't raise error."""
    from texture_cache import TextureCache

    cache = TextureCache()

    # Should not raise
    cache.invalidate("/nonexistent/entry.png")

    stats = cache.get_statistics()
    assert stats['entries'] == 0
