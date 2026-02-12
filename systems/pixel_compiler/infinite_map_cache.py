"""
LRU Cache System for Infinite Map FUSE Filesystem.

This module provides a two-tier caching system:
- L1: In-memory cache using OrderedDict for O(1) operations
- L2: (Future) Compressed cache for less frequently accessed data

Features:
- Thread-safe with RLock
- O(1) get/set operations
- Automatic eviction when over limit
- Statistics tracking
"""
from collections import OrderedDict
from typing import Any, Optional, Dict
from dataclasses import dataclass
import threading
import time


@dataclass
class CacheEntry:
    """A single cache entry with metadata."""
    key: str
    data: bytes
    size: int
    access_count: int = 0
    created_at: float = 0.0
    last_accessed: float = 0.0


class LRUCache:
    """
    Thread-safe LRU cache with configurable size limits.

    Features:
    - O(1) get/set operations using OrderedDict
    - Automatic eviction when over limit
    - Statistics tracking (hits, misses, evictions)
    - Thread-safe with RLock

    Attributes:
        max_size: Maximum cache size in bytes
        hits: Number of cache hits
        misses: Number of cache misses
        evictions: Number of items evicted
    """

    def __init__(self, max_size: int = 10 * 1024 * 1024):  # 10MB default
        """
        Initialize the LRU cache.

        Args:
            max_size: Maximum cache size in bytes (default: 10MB)
        """
        self.max_size = max_size
        self._cache: OrderedDict[str, CacheEntry] = OrderedDict()
        self._lock = threading.RLock()
        self._current_size = 0

        # Statistics
        self.hits = 0
        self.misses = 0
        self.evictions = 0

    def get(self, key: str) -> Optional[bytes]:
        """
        Get item from cache.

        Args:
            key: Cache key

        Returns:
            Cached data or None if not found
        """
        with self._lock:
            if key not in self._cache:
                self.misses += 1
                return None

            # Move to end (most recently used)
            entry = self._cache.pop(key)
            self._cache[key] = entry

            # Update access metadata
            entry.access_count += 1
            entry.last_accessed = time.time()

            self.hits += 1
            return entry.data

    def set(self, key: str, data: bytes) -> bool:
        """
        Store item in cache.

        Args:
            key: Cache key
            data: Data to cache

        Returns:
            True if successful, False if rejected
        """
        size = len(data)

        # Handle zero max_size edge case
        if self.max_size == 0:
            return False

        # Handle case where single item is larger than max_size
        if size > self.max_size:
            # Evict everything and still don't store
            return False

        with self._lock:
            # If key exists, remove it first (will be re-added)
            if key in self._cache:
                old_entry = self._cache.pop(key)
                self._current_size -= old_entry.size

            # Evict if necessary
            needed_size = size - (self.max_size - self._current_size)
            if needed_size > 0:
                self.evict(needed_size)

            # Create entry
            now = time.time()
            entry = CacheEntry(
                key=key,
                data=data,
                size=size,
                access_count=1,
                created_at=now,
                last_accessed=now
            )

            # Add to cache (at end = most recently used)
            self._cache[key] = entry
            self._current_size += size

            return True

    def evict(self, needed_size: int = 0) -> int:
        """
        Evict LRU items to make room.

        Items are evicted from the beginning of the OrderedDict (LRU order)
        until enough space is freed.

        Args:
            needed_size: Minimum bytes to free (0 = evict all)

        Returns:
            Bytes freed
        """
        with self._lock:
            freed = 0

            if needed_size == 0:
                # Evict all
                freed = self._current_size
                self._cache.clear()
                self._current_size = 0
                self.evictions += len(self._cache)
                return freed

            # Evict until we have enough space
            while freed < needed_size and self._cache:
                # Pop from beginning (LRU)
                key, entry = self._cache.popitem(last=False)
                freed += entry.size
                self._current_size -= entry.size
                self.evictions += 1

            return freed

    def clear(self) -> int:
        """
        Clear all cached items.

        Returns:
            Bytes freed
        """
        with self._lock:
            freed = self._current_size
            self._cache.clear()
            self._current_size = 0
            return freed

    def get_stats(self) -> Dict[str, Any]:
        """
        Return cache statistics.

        Returns:
            Dictionary with:
            - hits: Number of cache hits
            - misses: Number of cache misses
            - evictions: Number of items evicted
            - hit_rate: Ratio of hits to total accesses
            - count: Number of items in cache
            - size: Current cache size in bytes
            - max_size: Maximum cache size in bytes
        """
        with self._lock:
            total_accesses = self.hits + self.misses
            hit_rate = self.hits / total_accesses if total_accesses > 0 else 0.0

            return {
                "hits": self.hits,
                "misses": self.misses,
                "evictions": self.evictions,
                "hit_rate": hit_rate,
                "count": len(self._cache),
                "size": self._current_size,
                "max_size": self.max_size,
            }

    @property
    def size(self) -> int:
        """Current cache size in bytes."""
        with self._lock:
            return self._current_size

    @property
    def count(self) -> int:
        """Number of items in cache."""
        with self._lock:
            return len(self._cache)


# Future: L2 Compressed Cache
class CompressedCache:
    """
    L2 cache with compression for less frequently accessed data.

    This is a placeholder for future implementation.

    Design goals:
    - Use zstd compression for cold data
    - Track access frequency to decide what to compress
    - Decompress on demand when accessed
    """

    def __init__(self, max_size: int = 50 * 1024 * 1024):  # 50MB default
        """Initialize compressed cache (not yet implemented)."""
        self.max_size = max_size
        raise NotImplementedError("CompressedCache not yet implemented")
