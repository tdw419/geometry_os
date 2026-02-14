# systems/pixel_compiler/buffer_pool.py
"""
GPU Buffer Pool Manager

Reuses GPU buffers across WASM executions to avoid allocation overhead.
"""
from dataclasses import dataclass
from typing import Optional, List
from collections import deque
import threading

try:
    import wgpu
except ImportError:
    wgpu = None


@dataclass
class PooledBuffer:
    """A buffer in the pool."""
    buffer: 'wgpu.core.buffer.GPUBuffer'
    size: int
    in_use: bool = False


class BufferPool:
    """
    Pool of reusable GPU buffers.

    Reduces allocation overhead by reusing buffers across executions.
    Thread-safe for concurrent access.
    """

    def __init__(
        self,
        buffer_size: int = 65536,
        max_buffers: int = 16,
        device: 'wgpu.core.device.GPUDevice' = None
    ):
        """
        Initialize buffer pool.

        Args:
            buffer_size: Size of each buffer in bytes
            max_buffers: Maximum number of buffers to create
            device: GPU device to create buffers on (auto-detected if None)
        """
        self.buffer_size = buffer_size
        self.max_buffers = max_buffers

        if device is None and wgpu is not None:
            try:
                adapter = wgpu.gpu.request_adapter(power_preference="high-performance")
                self.device = adapter.request_device(required_features=[])
            except Exception:
                self.device = None
        else:
            self.device = device

        self._pool: deque = deque()
        self._all_buffers: List[PooledBuffer] = []
        self._lock = threading.Lock()
        self._stats = {
            "acquires": 0,
            "releases": 0,
            "cache_hits": 0,
            "cache_misses": 0,
        }

    def acquire(self) -> Optional['wgpu.core.buffer.GPUBuffer']:
        """
        Acquire a buffer from the pool.

        Returns:
            A GPU buffer ready for use, or None if pool exhausted and no device
        """
        with self._lock:
            self._stats["acquires"] += 1

            # Try to get from pool
            if self._pool:
                self._stats["cache_hits"] += 1
                return self._pool.pop()

            self._stats["cache_misses"] += 1

            # Create new buffer if under limit
            if len(self._all_buffers) < self.max_buffers and self.device:
                buffer = self._create_buffer()
                if buffer:
                    pooled = PooledBuffer(buffer=buffer, size=self.buffer_size, in_use=True)
                    self._all_buffers.append(pooled)
                    return buffer

            return None

    def release(self, buffer: 'wgpu.core.buffer.GPUBuffer') -> None:
        """
        Return a buffer to the pool for reuse.

        Args:
            buffer: The buffer to return
        """
        with self._lock:
            self._stats["releases"] += 1
            self._pool.append(buffer)

    def _create_buffer(self) -> Optional['wgpu.core.buffer.GPUBuffer']:
        """Create a new GPU buffer."""
        if not self.device:
            return None

        import numpy as np
        data = np.zeros(self.buffer_size // 4, dtype=np.uint32)

        return self.device.create_buffer_with_data(
            data=data,
            usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_SRC | wgpu.BufferUsage.COPY_DST
        )

    def get_stats(self) -> dict:
        """Get pool statistics."""
        with self._lock:
            return {
                **self._stats,
                "pool_size": len(self._pool),
                "total_buffers": len(self._all_buffers),
                "hit_rate": (
                    self._stats["cache_hits"] / self._stats["acquires"]
                    if self._stats["acquires"] > 0 else 0
                ),
            }

    def clear(self) -> None:
        """Clear all buffers from pool."""
        with self._lock:
            self._pool.clear()
            self._all_buffers.clear()


class BufferPoolManager:
    """
    Manages multiple buffer pools for different buffer types.

    WASM execution uses multiple buffer types:
    - Bytecode buffer (read-only)
    - Memory buffer (read-write)
    - Globals buffer (read-write)
    - Trace buffer (read-write)
    - Output buffer (read-write)
    """

    def __init__(self, device: 'wgpu.core.device.GPUDevice' = None):
        self.device = device

        # Different pool sizes for different buffer types
        self.bytecode_pool = BufferPool(
            buffer_size=64 * 1024,  # 64KB for bytecode
            max_buffers=4,
            device=device
        )
        self.memory_pool = BufferPool(
            buffer_size=64 * 1024 * 4,  # 256KB for memory (4 pages)
            max_buffers=8,
            device=device
        )
        self.globals_pool = BufferPool(
            buffer_size=256,  # 256 bytes for globals
            max_buffers=8,
            device=device
        )
        self.output_pool = BufferPool(
            buffer_size=4 * 1024 * 1024,  # 4MB for output
            max_buffers=2,
            device=device
        )

    def get_all_stats(self) -> dict:
        """Get statistics for all pools."""
        return {
            "bytecode": self.bytecode_pool.get_stats(),
            "memory": self.memory_pool.get_stats(),
            "globals": self.globals_pool.get_stats(),
            "output": self.output_pool.get_stats(),
        }

    def clear_all(self) -> None:
        """Clear all pools."""
        self.bytecode_pool.clear()
        self.memory_pool.clear()
        self.globals_pool.clear()
        self.output_pool.clear()
