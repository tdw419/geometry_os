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
- Predictive prefetching with access pattern detection
"""
from collections import OrderedDict
from typing import Any, Optional, Dict, List, Tuple
from dataclasses import dataclass
import threading
import time


class AccessPatternTracker:
    """
    Tracks file access patterns to detect sequential reads.

    This class analyzes access patterns to determine if a file is being
    read sequentially, which enables predictive prefetching.

    Attributes:
        window_size: Number of recent accesses to analyze for pattern detection.
        _access_history: Dictionary mapping filenames to lists of access offsets.
    """

    def __init__(self, window_size: int = 10):
        """
        Initialize the access pattern tracker.

        Args:
            window_size: Number of recent accesses to keep for analysis (default: 10).
        """
        self.window_size = window_size
        self._access_history: Dict[str, List[int]] = {}

    def record_access(self, filename: str, offset: int) -> None:
        """
        Record an access for pattern detection.

        Args:
            filename: Name of the file being accessed.
            offset: Byte offset of the access.
        """
        if filename not in self._access_history:
            self._access_history[filename] = []

        history = self._access_history[filename]
        history.append(offset)

        # Trim to window size
        if len(history) > self.window_size:
            self._access_history[filename] = history[-self.window_size:]

    def is_sequential(self, filename: str) -> bool:
        """
        Check if recent accesses are sequential.

        Sequential access is detected when there are at least 3 consecutive
        accesses with a consistent stride (difference between offsets).

        Args:
            filename: Name of the file to check.

        Returns:
            True if the access pattern appears sequential, False otherwise.
        """
        if filename not in self._access_history:
            return False

        history = self._access_history[filename]

        # Need at least 3 accesses to detect a pattern
        if len(history) < 3:
            return False

        # Calculate strides between consecutive accesses
        strides = []
        for i in range(1, len(history)):
            stride = history[i] - history[i - 1]
            strides.append(stride)

        # Check if all strides are positive and consistent
        if not strides:
            return False

        # All strides should be positive (forward reads) and equal
        first_stride = strides[0]
        if first_stride <= 0:
            return False

        # Allow small tolerance for stride consistency (within 10%)
        for stride in strides[1:]:
            if stride <= 0:
                return False
            # Check stride consistency (allow 10% variance)
            if abs(stride - first_stride) > first_stride * 0.1:
                return False

        return True

    def predict_next_offset(self, filename: str) -> Optional[int]:
        """
        Predict the next likely offset based on pattern.

        Args:
            filename: Name of the file to predict for.

        Returns:
            Predicted next offset, or None if no pattern detected.
        """
        if not self.is_sequential(filename):
            return None

        history = self._access_history[filename]
        if len(history) < 2:
            return None

        # Use the average stride for prediction
        stride = history[-1] - history[-2]
        return history[-1] + stride

    def get_detected_stride(self, filename: str) -> Optional[int]:
        """
        Get the detected stride for a file.

        Args:
            filename: Name of the file to get stride for.

        Returns:
            Detected stride in bytes, or None if no pattern detected.
        """
        if not self.is_sequential(filename):
            return None

        history = self._access_history[filename]
        if len(history) < 2:
            return None

        # Return the most recent stride
        return history[-1] - history[-2]

    def clear(self, filename: Optional[str] = None) -> None:
        """
        Clear access history.

        Args:
            filename: Specific file to clear, or None to clear all.
        """
        if filename is None:
            self._access_history.clear()
        elif filename in self._access_history:
            del self._access_history[filename]


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
    - Predictive prefetching with access pattern detection

    Attributes:
        max_size: Maximum cache size in bytes
        hits: Number of cache hits
        misses: Number of cache misses
        evictions: Number of items evicted
        prefetch_enabled: Whether predictive prefetching is enabled
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

        # Predictive prefetching
        self._prefetch_queue: List[Tuple[str, bytes]] = []
        self._pattern_tracker = AccessPatternTracker()
        self.prefetch_enabled = True
        self._prefetch_hits = 0

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
                "prefetch_hits": self._prefetch_hits,
            }

    def should_prefetch(self, filename: str, offset: int) -> bool:
        """
        Determine if we should prefetch based on access pattern.

        This method records the access and checks if a sequential pattern
        is detected. If so, it returns True to indicate prefetching should
        be triggered.

        Args:
            filename: Name of the file being accessed.
            offset: Byte offset of the access.

        Returns:
            True if prefetching should be triggered, False otherwise.
        """
        if not self.prefetch_enabled:
            return False

        # Record the access for pattern tracking
        self._pattern_tracker.record_access(filename, offset)

        # Check if we have a sequential pattern
        return self._pattern_tracker.is_sequential(filename)

    def queue_prefetch(self, key: str, data: bytes) -> None:
        """
        Queue data for prefetch (will be available via get_prefetched).

        This method stores prefetched data in a separate queue, which can
        be retrieved later without going through the main cache.

        Args:
            key: Cache key for the prefetched data.
            data: Prefetched data bytes.
        """
        with self._lock:
            # Check if already in queue (avoid duplicates)
            for existing_key, _ in self._prefetch_queue:
                if existing_key == key:
                    return

            self._prefetch_queue.append((key, data))

    def get_prefetched(self, key: str) -> Optional[bytes]:
        """
        Get prefetched data from the queue.

        If found, the data is removed from the prefetch queue and can
        optionally be added to the main cache.

        Args:
            key: Cache key for the prefetched data.

        Returns:
            Prefetched data or None if not found.
        """
        with self._lock:
            for i, (existing_key, data) in enumerate(self._prefetch_queue):
                if existing_key == key:
                    # Remove from queue
                    self._prefetch_queue.pop(i)
                    self._prefetch_hits += 1
                    return data
            return None

    def get_predicted_next_offset(self, filename: str) -> Optional[int]:
        """
        Get the predicted next offset for a file.

        Args:
            filename: Name of the file.

        Returns:
            Predicted next offset, or None if no pattern detected.
        """
        return self._pattern_tracker.predict_next_offset(filename)

    def get_detected_stride(self, filename: str) -> Optional[int]:
        """
        Get the detected access stride for a file.

        Args:
            filename: Name of the file.

        Returns:
            Detected stride in bytes, or None if no pattern detected.
        """
        return self._pattern_tracker.get_detected_stride(filename)

    def clear_prefetch_queue(self) -> int:
        """
        Clear the prefetch queue.

        Returns:
            Number of items cleared.
        """
        with self._lock:
            count = len(self._prefetch_queue)
            self._prefetch_queue.clear()
            return count

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
