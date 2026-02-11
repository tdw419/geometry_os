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


# ============================================================================
# Cluster Texture Cache Tests (InfiniteMap Integration)
# ============================================================================

def test_cluster_cache_key_generation():
    """Test that cluster cache keys are generated correctly."""
    from texture_cache import TextureCache

    cache = TextureCache()

    # Test cache key format
    key1 = cache._cluster_cache_key(100, 200)
    assert key1 == "cluster:100:200"

    key2 = cache._cluster_cache_key(0, 0)
    assert key2 == "cluster:0:0"

    # Different coordinates produce different keys
    key3 = cache._cluster_cache_key(100, 201)
    assert key3 != key1


def test_cluster_to_texture_conversion():
    """Test converting 4KB cluster data to 32x32 RGBA texture."""
    from texture_cache import TextureCache

    cache = TextureCache()

    # Create test cluster data (exactly 4096 bytes)
    cluster_data = bytes(range(256)) * 16  # Repeating pattern

    texture = cache._cluster_to_texture(cluster_data)

    assert texture is not None
    assert texture.shape == (32, 32, 4)
    assert texture.dtype == np.uint8
    assert texture.nbytes == 4096


def test_cluster_to_texture_with_padding():
    """Test that undersized clusters are padded with zeros."""
    from texture_cache import TextureCache

    cache = TextureCache()

    # Create small cluster (less than 4096 bytes)
    cluster_data = b"Hello, World!"  # Only 13 bytes

    texture = cache._cluster_to_texture(cluster_data)

    assert texture is not None
    assert texture.shape == (32, 32, 4)
    assert texture.nbytes == 4096


def test_cluster_to_texture_with_truncation():
    """Test that oversized clusters are truncated to 4096 bytes."""
    from texture_cache import TextureCache

    cache = TextureCache()

    # Create large cluster (more than 4096 bytes)
    cluster_data = b"X" * 5000

    texture = cache._cluster_to_texture(cluster_data)

    assert texture is not None
    assert texture.shape == (32, 32, 4)
    assert texture.nbytes == 4096


def test_invalidate_cluster_removes_entry():
    """Test that invalidating a cluster removes it from cache."""
    from texture_cache import TextureCache
    from infinite_map_v2 import ClusterLocation

    cache = TextureCache()

    # Add a fake cluster entry directly
    from texture_cache import CachedTexture
    import time

    data = np.zeros((32, 32, 4), dtype=np.uint8)
    texture = CachedTexture(
        data=data,
        width=32,
        height=32,
        path="cluster://100/200",
        size_bytes=data.nbytes,
        last_access=time.time()
    )

    cache_key = cache._cluster_cache_key(100, 200)
    cache._cache[cache_key] = texture
    cache._current_size_bytes += data.nbytes

    assert cache.get_statistics()['entries'] == 1

    # Invalidate cluster
    cache.invalidate_cluster(100, 200)

    assert cache.get_statistics()['entries'] == 0
    assert cache_key not in cache._cache


def test_invalidate_nonexistent_cluster():
    """Test that invalidating non-existent cluster doesn't raise error."""
    from texture_cache import TextureCache

    cache = TextureCache()

    # Should not raise
    cache.invalidate_cluster(999, 999)

    stats = cache.get_statistics()
    assert stats['entries'] == 0


def test_cluster_texture_checksum_generation():
    """Test that cluster textures have valid checksums."""
    from texture_cache import TextureCache

    cache = TextureCache()

    # Create test cluster data
    cluster_data = bytes([i % 256 for i in range(4096)])
    texture_data = cache._cluster_to_texture(cluster_data)

    # Create texture to get checksum
    from texture_cache import CachedTexture
    import time

    texture = CachedTexture(
        data=texture_data,
        width=32,
        height=32,
        path="cluster://test",
        size_bytes=texture_data.nbytes,
        last_access=time.time()
    )

    assert texture.checksum is not None
    assert len(texture.checksum) == 64  # SHA256 hex length


def test_cluster_texture_dimensions():
    """Test that cluster textures are always 32x32."""
    from texture_cache import TextureCache

    cache = TextureCache()

    # Test with various cluster sizes
    test_cases = [
        (b"", 0),           # Empty
        (b"X" * 100, 100),  # Small
        (b"X" * 4096, 4096),  # Exact size
        (b"X" * 5000, 5000),  # Oversized
    ]

    for cluster_data, original_size in test_cases:
        texture = cache._cluster_to_texture(cluster_data)

        assert texture is not None
        assert texture.shape == (32, 32, 4), f"Failed for size {original_size}"


def test_cluster_to_texture_preserves_data():
    """Test that cluster data is preserved in texture."""
    from texture_cache import TextureCache

    cache = TextureCache()

    # Create patterned cluster data
    cluster_data = bytes([i % 256 for i in range(4096)])
    texture = cache._cluster_to_texture(cluster_data)

    # Convert back to bytes and verify
    texture_bytes = texture.tobytes()

    # First 4096 bytes should match
    for i in range(4096):
        assert texture_bytes[i] == cluster_data[i], f"Mismatch at index {i}"


def test_cluster_cache_key_uniqueness():
    """Test that different cluster coordinates produce unique keys."""
    from texture_cache import TextureCache

    cache = TextureCache()

    keys = set()
    for x in range(10):
        for y in range(10):
            key = cache._cluster_cache_key(x, y)
            keys.add(key)

    # Should have 100 unique keys
    assert len(keys) == 100


def test_cluster_cache_key_format_consistency():
    """Test that cache key format is consistent."""
    from texture_cache import TextureCache

    cache = TextureCache()

    # Test that the format is predictable
    key = cache._cluster_cache_key(123, 456)

    assert key.startswith("cluster:")
    assert ":123:" in key
    assert key.endswith("456")


def test_cluster_texture_rgba_order():
    """Test that cluster data is correctly mapped to RGBA channels."""
    from texture_cache import TextureCache

    cache = TextureCache()

    # Create cluster where each byte is its index (mod 256)
    cluster_data = bytes([i % 256 for i in range(4096)])
    texture = cache._cluster_to_texture(cluster_data)

    # First pixel should be [0, 1, 2, 3] (R, G, B, A)
    first_pixel = texture[0, 0]
    assert tuple(first_pixel) == (0, 1, 2, 3)

    # Second pixel should be [4, 5, 6, 7]
    second_pixel = texture[0, 1]
    assert tuple(second_pixel) == (4, 5, 6, 7)


# ============================================================================
# Integration Tests with InfiniteMapBuilder
# ============================================================================

def test_get_cluster_texture_from_infinite_map():
    """Test get_cluster_texture method with mock infinite map."""
    from texture_cache import TextureCache
    from infinite_map_v2 import ClusterLocation

    # Create cache
    cache = TextureCache(max_size_mb=1, max_entries=10)

    # Create mock infinite map
    class MockInfiniteMap:
        def _read_cluster_raw(self, cluster):
            # Return predictable 4KB data
            return bytes([((cluster.x + cluster.y + i) % 256) for i in range(4096)])

    mock_map = MockInfiniteMap()
    cluster = ClusterLocation(100, 200)

    # Get cluster texture (cache miss)
    texture = cache.get_cluster_texture(cluster, mock_map)

    assert texture is not None
    assert texture.width == 32
    assert texture.height == 32
    assert texture.data.shape == (32, 32, 4)
    assert texture.from_cache is False

    # Verify checksum
    assert texture.checksum is not None
    assert len(texture.checksum) == 64

    # Get same cluster again (cache hit)
    texture2 = cache.get_cluster_texture(cluster, mock_map)

    assert texture2 is not None
    assert texture2.from_cache is True
    assert texture2.access_count == 2

    # Verify cache statistics
    stats = cache.get_statistics()
    assert stats['hits'] == 1
    assert stats['misses'] == 1


def test_get_cluster_texture_cache_hit():
    """Test that cache hits work correctly for cluster textures."""
    from texture_cache import TextureCache
    from infinite_map_v2 import ClusterLocation

    cache = TextureCache()

    class MockInfiniteMap:
        def __init__(self):
            self.read_count = 0

        def _read_cluster_raw(self, cluster):
            self.read_count += 1
            return bytes([i % 256 for i in range(4096)])

    mock_map = MockInfiniteMap()
    cluster = ClusterLocation(50, 75)

    # First access - reads from map
    texture1 = cache.get_cluster_texture(cluster, mock_map)
    assert texture1.from_cache is False
    assert mock_map.read_count == 1

    # Second access - cache hit
    texture2 = cache.get_cluster_texture(cluster, mock_map)
    assert texture2.from_cache is True
    assert mock_map.read_count == 1  # Should not increment

    # Third access - still cache hit
    texture3 = cache.get_cluster_texture(cluster, mock_map)
    assert texture3.from_cache is True
    assert texture3.access_count == 3


def test_invalidate_cluster_works():
    """Test that invalidate_cluster removes cluster from cache."""
    from texture_cache import TextureCache
    from infinite_map_v2 import ClusterLocation

    cache = TextureCache()

    class MockInfiniteMap:
        def _read_cluster_raw(self, cluster):
            return bytes([i % 256 for i in range(4096)])

    mock_map = MockInfiniteMap()
    cluster = ClusterLocation(10, 20)

    # Load cluster
    texture1 = cache.get_cluster_texture(cluster, mock_map)
    assert texture1 is not None

    stats_before = cache.get_statistics()
    assert stats_before['entries'] == 1

    # Invalidate cluster
    cache.invalidate_cluster(10, 20)

    stats_after = cache.get_statistics()
    assert stats_after['entries'] == 0

    # Load again should be cache miss
    texture2 = cache.get_cluster_texture(cluster, mock_map)
    assert texture2.from_cache is False


def test_multiple_clusters_in_cache():
    """Test that multiple clusters can be cached simultaneously."""
    from texture_cache import TextureCache
    from infinite_map_v2 import ClusterLocation

    cache = TextureCache()

    class MockInfiniteMap:
        def _read_cluster_raw(self, cluster):
            # Unique data per cluster
            seed = (cluster.x << 16) | cluster.y
            return bytes([((seed + i) % 256) for i in range(4096)])

    mock_map = MockInfiniteMap()

    # Load multiple clusters
    clusters = [
        ClusterLocation(0, 0),
        ClusterLocation(100, 100),
        ClusterLocation(500, 500),
        ClusterLocation(1024, 1024),
    ]

    for cluster in clusters:
        texture = cache.get_cluster_texture(cluster, mock_map)
        assert texture is not None
        assert texture.from_cache is False

    stats = cache.get_statistics()
    assert stats['entries'] == 4
    assert stats['misses'] == 4

    # Access all again - all should hit
    for cluster in clusters:
        texture = cache.get_cluster_texture(cluster, mock_map)
        assert texture.from_cache is True

    stats = cache.get_statistics()
    assert stats['hits'] == 4


def test_cluster_texture_lru_eviction():
    """Test that LRU eviction works for cluster textures."""
    from texture_cache import TextureCache
    from infinite_map_v2 import ClusterLocation

    # Small cache to trigger eviction
    cache = TextureCache(max_size_mb=0.01, max_entries=2)

    class MockInfiniteMap:
        def _read_cluster_raw(self, cluster):
            return bytes([i % 256 for i in range(4096)])

    mock_map = MockInfiniteMap()

    # Load 3 clusters (should evict one)
    cluster1 = ClusterLocation(0, 0)
    cluster2 = ClusterLocation(1, 1)
    cluster3 = ClusterLocation(2, 2)

    cache.get_cluster_texture(cluster1, mock_map)
    cache.get_cluster_texture(cluster2, mock_map)
    cache.get_cluster_texture(cluster3, mock_map)  # Should trigger eviction

    stats = cache.get_statistics()
    assert stats['evictions'] > 0
    assert stats['entries'] <= 2


def test_cluster_texture_none_on_error():
    """Test that None is returned when cluster read fails."""
    from texture_cache import TextureCache
    from infinite_map_v2 import ClusterLocation

    cache = TextureCache()

    class MockInfiniteMap:
        def _read_cluster_raw(self, cluster):
            return None  # Simulate read failure

    mock_map = MockInfiniteMap()
    cluster = ClusterLocation(999, 999)

    texture = cache.get_cluster_texture(cluster, mock_map)

    assert texture is None

    # Should count as a miss
    stats = cache.get_statistics()
    assert stats['misses'] == 1
