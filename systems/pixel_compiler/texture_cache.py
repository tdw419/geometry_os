"""
TextureCache - LRU GPU Texture Cache

Provides LRU (Least Recently Used) caching for GPU texture data
with automatic eviction, statistics tracking, and warm-up support.

This cache is designed for the Infinite Map OS to efficiently manage
texture data loaded from the spatial filesystem.
"""

import hashlib
import math
import time
from dataclasses import dataclass, field
from typing import Dict, Optional, List, Tuple, TYPE_CHECKING
from pathlib import Path

try:
    import numpy as np
    HAS_NUMPY = True
except ImportError:
    HAS_NUMPY = False
    np = None

try:
    from PIL import Image
    HAS_PIL = True
except ImportError:
    HAS_PIL = False

# Type hints for cluster support
if TYPE_CHECKING:
    from infinite_map_v2 import ClusterLocation, InfiniteMapBuilderV2


@dataclass
class CachedTexture:
    """
    Represents a cached texture with metadata.

    Attributes:
        data: RGBA pixel data as numpy array (height, width, 4)
        width: Texture width in pixels
        height: Texture height in pixels
        path: Original file path for this texture
        size_bytes: Size of texture data in bytes
        last_access: Unix timestamp of last access
        access_count: Number of times this texture has been accessed
        from_cache: Whether this texture was retrieved from cache (for testing)
        checksum: SHA256 hash of the texture data
    """
    data: 'np.ndarray'
    width: int
    height: int
    path: str
    size_bytes: int
    last_access: float
    access_count: int = 1
    from_cache: bool = False
    checksum: str = ""

    def __post_init__(self):
        """Calculate checksum if not provided."""
        if not self.checksum and HAS_NUMPY:
            self.checksum = self._calculate_checksum()

    def _calculate_checksum(self) -> str:
        """Calculate SHA256 checksum of texture data."""
        if self.data is None:
            return ""

        # Convert to bytes and hash
        data_bytes = self.data.tobytes()
        return hashlib.sha256(data_bytes).hexdigest()


class TextureCache:
    """
    LRU cache for GPU texture data.

    Features:
    - Size-based eviction (max_size_mb)
    - Count-based eviction (max_entries)
    - LRU tracking via last_access timestamp
    - Cache hit/miss statistics
    - Warm-up support for pre-loading
    - Selective invalidation
    """

    # Default configuration
    DEFAULT_MAX_SIZE_MB = 256
    DEFAULT_MAX_ENTRIES = 1000

    def __init__(
        self,
        max_size_mb: int = DEFAULT_MAX_SIZE_MB,
        max_entries: int = DEFAULT_MAX_ENTRIES
    ):
        """
        Initialize the texture cache.

        Args:
            max_size_mb: Maximum cache size in megabytes
            max_entries: Maximum number of cached entries
        """
        self.max_size_mb = max_size_mb
        self.max_entries = max_entries
        self.max_size_bytes = max_size_mb * 1024 * 1024

        # Internal cache storage: path -> CachedTexture
        self._cache: Dict[str, CachedTexture] = {}

        # Statistics
        self._hits = 0
        self._misses = 0
        self._evictions = 0

        # Track current cache size
        self._current_size_bytes = 0

    def get(self, path: str) -> Optional[CachedTexture]:
        """
        Get a texture from cache.

        First checks if the texture is in cache. If found, updates
        access metadata and returns the cached texture. If not found,
        attempts to load from disk and cache it.

        Args:
            path: Path to the texture file

        Returns:
            CachedTexture if found/loaded, None otherwise
        """
        # Check cache
        if path in self._cache:
            self._hits += 1
            texture = self._cache[path]

            # Update access metadata
            texture.last_access = time.time()
            texture.access_count += 1
            texture.from_cache = True

            return texture

        # Cache miss - try to load
        self._misses += 1
        texture = self._load_texture(path)

        if texture is not None:
            self._add_to_cache(path, texture)
            texture.from_cache = False

        return texture

    def _load_texture(self, path: str) -> Optional[CachedTexture]:
        """
        Load a texture from the file system.

        Args:
            path: Path to the texture file

        Returns:
            CachedTexture if loaded successfully, None otherwise
        """
        if not HAS_PIL or not HAS_NUMPY:
            return None

        try:
            # Check if file exists
            if not Path(path).exists():
                return None

            # Load image with PIL
            with Image.open(path) as img:
                # Convert to RGBA if necessary
                if img.mode != 'RGBA':
                    img = img.convert('RGBA')

                # Convert to numpy array
                data = np.array(img, dtype=np.uint8)

                height, width = data.shape[0], data.shape[1]
                size_bytes = data.nbytes

                return CachedTexture(
                    data=data,
                    width=width,
                    height=height,
                    path=path,
                    size_bytes=size_bytes,
                    last_access=time.time(),
                    access_count=1,
                    from_cache=False
                )
        except Exception:
            # Failed to load - return None
            return None

    def _add_to_cache(self, path: str, texture: CachedTexture) -> None:
        """
        Add a texture to the cache with eviction if needed.

        Evicts LRU entries if the cache would exceed size or count limits.

        Args:
            path: Path key for the texture
            texture: The texture to cache
        """
        # If texture is larger than max cache size, don't cache it
        if texture.size_bytes > self.max_size_bytes:
            return

        # Check if we need to evict
        while self._should_evict(texture.size_bytes):
            if not self._cache:
                # Can't evict from empty cache, stop
                break
            self._evict_lru()

        # Add to cache if there's room
        if self._current_size_bytes + texture.size_bytes <= self.max_size_bytes:
            self._cache[path] = texture
            self._current_size_bytes += texture.size_bytes

    def _should_evict(self, new_entry_size: int) -> bool:
        """
        Check if eviction is needed before adding a new entry.

        Args:
            new_entry_size: Size of the entry being added

        Returns:
            True if eviction is needed
        """
        # Would exceed entry count limit
        if len(self._cache) >= self.max_entries:
            return True

        # Would exceed size limit
        if self._current_size_bytes + new_entry_size > self.max_size_bytes:
            return True

        return False

    def _evict_lru(self) -> None:
        """
        Evict the least recently used entry from the cache.

        LRU is determined by the lowest last_access timestamp.
        """
        if not self._cache:
            return

        # Find LRU entry
        lru_path = None
        lru_time = float('inf')

        for path, texture in self._cache.items():
            if texture.last_access < lru_time:
                lru_time = texture.last_access
                lru_path = path

        # Remove from cache
        if lru_path is not None:
            texture = self._cache.pop(lru_path)
            self._current_size_bytes -= texture.size_bytes
            self._evictions += 1

    def invalidate(self, path: str) -> None:
        """
        Invalidate a specific cache entry.

        Args:
            path: Path of the entry to invalidate
        """
        if path in self._cache:
            texture = self._cache.pop(path)
            self._current_size_bytes -= texture.size_bytes

    def clear(self) -> None:
        """Reset all cache state."""
        self._cache.clear()
        self._current_size_bytes = 0
        self._hits = 0
        self._misses = 0
        self._evictions = 0

    def get_statistics(self) -> dict:
        """
        Get cache statistics.

        Returns:
            Dictionary with:
            - hits: Number of cache hits
            - misses: Number of cache misses
            - hit_rate: Ratio of hits to total accesses (0.0-1.0)
            - evictions: Number of evictions performed
            - entries: Current number of cached entries
            - current_bytes: Current cache size in bytes
            - utilization: Ratio of current size to max size (0.0-1.0)
        """
        total_accesses = self._hits + self._misses
        hit_rate = self._hits / total_accesses if total_accesses > 0 else 0.0
        utilization = self._current_size_bytes / self.max_size_bytes if self.max_size_bytes > 0 else 0.0

        return {
            'hits': self._hits,
            'misses': self._misses,
            'hit_rate': hit_rate,
            'evictions': self._evictions,
            'entries': len(self._cache),
            'current_bytes': self._current_size_bytes,
            'utilization': utilization
        }

    def warm_up(self, paths: List[str]) -> None:
        """
        Pre-load textures into the cache.

        Useful for pre-loading hot files that will be accessed frequently.

        Args:
            paths: List of file paths to pre-load
        """
        for path in paths:
            # Don't count warm-up accesses as misses
            self._misses = max(0, self._misses - 1)

            texture = self._load_texture(path)
            if texture is not None:
                self._add_to_cache(path, texture)

    @property
    def cache(self) -> Dict[str, CachedTexture]:
        """
        Get internal cache dictionary (for testing).

        Returns:
            Internal cache storage
        """
        return self._cache

    def _cluster_cache_key(self, cluster_x: int, cluster_y: int) -> str:
        """
        Generate cache key for cluster coordinates.

        Args:
            cluster_x: Cluster X coordinate
            cluster_y: Cluster Y coordinate

        Returns:
            Cache key string in format "cluster:{x}:{y}"
        """
        return f"cluster:{cluster_x}:{cluster_y}"

    def get_cluster_texture(
        self,
        cluster: 'ClusterLocation',
        infinite_map: 'InfiniteMapBuilderV2'
    ) -> Optional[CachedTexture]:
        """
        Get a cluster texture from the infinite map with caching.

        This method:
        1. Generates cache key from cluster coordinates
        2. Checks if texture is already cached
        3. On cache miss, reads 4KB cluster from infinite map
        4. Converts to 32x32 RGBA texture (1024 pixels)
        5. Generates SHA256 checksum
        6. Creates CachedTexture with metadata
        7. Adds to cache with LRU tracking

        Args:
            cluster: ClusterLocation with (x, y) coordinates
            infinite_map: InfiniteMapBuilderV2 instance to read raw cluster data

        Returns:
            CachedTexture (32x32 RGBA) if successful, None otherwise
        """
        # Generate cache key
        cache_key = self._cluster_cache_key(cluster.x, cluster.y)

        # Check cache
        if cache_key in self._cache:
            self._hits += 1
            texture = self._cache[cache_key]

            # Update access metadata
            texture.last_access = time.time()
            texture.access_count += 1
            texture.from_cache = True

            return texture

        # Cache miss - read cluster from infinite map
        self._misses += 1

        # Read raw 4KB cluster data
        cluster_data = infinite_map._read_cluster_raw(cluster)
        if cluster_data is None:
            return None

        # Convert 4KB cluster to 32x32 RGBA texture
        # 4KB = 4096 bytes
        # 32x32 texture = 1024 pixels * 4 bytes/pixel (RGBA) = 4096 bytes
        texture_data = self._cluster_to_texture(cluster_data)

        if texture_data is None:
            return None

        # Create cached texture
        texture = CachedTexture(
            data=texture_data,
            width=32,
            height=32,
            path=f"cluster://{cluster.x}/{cluster.y}",
            size_bytes=texture_data.nbytes,
            last_access=time.time(),
            access_count=1,
            from_cache=False,
            checksum=""  # Will be calculated in __post_init__
        )

        # Add to cache
        self._add_to_cache(cache_key, texture)

        return texture

    def _cluster_to_texture(self, cluster_data: bytes) -> Optional['np.ndarray']:
        """
        Convert 4KB cluster data to 32x32 RGBA texture.

        Args:
            cluster_data: 4096 bytes of cluster data

        Returns:
            32x32x4 numpy array (RGBA) or None if conversion fails
        """
        if not HAS_NUMPY:
            return None

        if len(cluster_data) != 4096:
            # Pad or truncate to exactly 4096 bytes
            if len(cluster_data) < 4096:
                cluster_data = cluster_data + b'\x00' * (4096 - len(cluster_data))
            else:
                cluster_data = cluster_data[:4096]

        # Reshape bytes to 32x32 RGBA
        # Each pixel is 4 bytes (R, G, B, A)
        texture_array = np.frombuffer(cluster_data, dtype=np.uint8)
        texture_array = texture_array.reshape((32, 32, 4))

        return texture_array

    def invalidate_cluster(self, cluster_x: int, cluster_y: int) -> None:
        """
        Invalidate a cached cluster texture.

        Args:
            cluster_x: Cluster X coordinate
            cluster_y: Cluster Y coordinate
        """
        cache_key = self._cluster_cache_key(cluster_x, cluster_y)

        if cache_key in self._cache:
            texture = self._cache.pop(cache_key)
            self._current_size_bytes -= texture.size_bytes

    def detect_hot_zone_files(
        self,
        vat,
        threshold_distance: float = 128.0
    ) -> List[str]:
        """
        Detect files located in the hot zone (within threshold_distance from center).

        A file is considered "hot" if ANY of its clusters are within
        the threshold distance from the center of the map.

        Args:
            vat: VisualAllocationTable instance with file locations
            threshold_distance: Distance in pixels from center (default: 128 = HOT zone)

        Returns:
            List of file paths that have at least one cluster in the hot zone

        Example:
            >>> hot_files = cache.detect_hot_zone_files(vat, threshold_distance=128.0)
            >>> print(f"Found {len(hot_files)} hot files")
        """
        if vat is None:
            return []

        # Get center from VAT
        center_x = vat.center.x
        center_y = vat.center.y

        # Square threshold for efficient comparison (avoid sqrt)
        threshold_squared = threshold_distance ** 2

        hot_files = []

        # Iterate through all VAT entries
        for file_path, clusters in vat.entries.items():
            if not clusters:
                continue

            # Check each cluster in the file
            for cluster in clusters:
                dx = cluster.x - center_x
                dy = cluster.y - center_y

                # Calculate squared distance (avoid sqrt for efficiency)
                distance_squared = dx * dx + dy * dy

                # If any cluster is within threshold, file is hot
                if distance_squared <= threshold_squared:
                    hot_files.append(file_path)
                    break  # No need to check other clusters for this file

        return hot_files

    def auto_cache_hot_zone(
        self,
        vat,
        infinite_map: 'InfiniteMapBuilderV2',
        threshold_distance: float = 128.0
    ) -> int:
        """
        Automatically cache all hot zone files.

        Detects files in the hot zone and loads their cluster textures
        into the cache for fast access.

        Args:
            vat: VisualAllocationTable instance with file locations
            infinite_map: InfiniteMapBuilderV2 instance to read cluster data
            threshold_distance: Distance in pixels from center (default: 128 = HOT zone)

        Returns:
            Number of clusters successfully cached

        Example:
            >>> count = cache.auto_cache_hot_zone(vat, infinite_map)
            >>> print(f"Cached {count} hot clusters")
        """
        # Detect hot zone files
        hot_files = self.detect_hot_zone_files(vat, threshold_distance)

        if not hot_files:
            return 0

        cached_count = 0

        # For each hot file, cache all its clusters
        for file_path in hot_files:
            clusters = vat.entries.get(file_path, [])

            if not clusters:
                continue

            # Cache each cluster
            for cluster in clusters:
                texture = self.get_cluster_texture(cluster, infinite_map)
                if texture is not None:
                    cached_count += 1

        return cached_count


# Convenience function for creating a default cache
def create_default_cache() -> TextureCache:
    """
    Create a TextureCache with default settings.

    Returns:
        TextureCache initialized with defaults (256MB, 1000 entries)
    """
    return TextureCache(
        max_size_mb=TextureCache.DEFAULT_MAX_SIZE_MB,
        max_entries=TextureCache.DEFAULT_MAX_ENTRIES
    )
