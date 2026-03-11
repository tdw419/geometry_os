# systems/pixel_compiler/tests/test_buffer_pool.py
"""Tests for GPU buffer pool manager."""
import pytest


class TestBufferPool:
    """Test buffer pool functionality."""

    def test_buffer_pool_creation(self, tmp_path):
        """Test creating a buffer pool."""
        # Skip if no GPU
        pytest.importorskip("wgpu")

        from systems.pixel_compiler.buffer_pool import BufferPool

        pool = BufferPool(buffer_size=65536, max_buffers=10)
        assert pool.buffer_size == 65536
        assert pool.max_buffers == 10

    def test_acquire_release_buffer(self):
        """Test acquiring and releasing buffers."""
        pytest.importorskip("wgpu")
        from systems.pixel_compiler.buffer_pool import BufferPool

        pool = BufferPool(buffer_size=1024, max_buffers=3)

        buf1 = pool.acquire()
        assert buf1 is not None

        pool.release(buf1)
        # Should be able to acquire again
        buf2 = pool.acquire()
        assert buf2 is not None

    def test_pool_exhaustion(self):
        """Test behavior when pool is exhausted."""
        pytest.importorskip("wgpu")
        from systems.pixel_compiler.buffer_pool import BufferPool

        pool = BufferPool(buffer_size=1024, max_buffers=2)

        buf1 = pool.acquire()
        buf2 = pool.acquire()
        # Third acquire returns None when pool is exhausted
        buf3 = pool.acquire()

        # First two should succeed
        assert buf1 is not None
        assert buf2 is not None
        # Third should be None (pool exhausted)
        assert buf3 is None

        # After releasing one, should be able to acquire again
        pool.release(buf1)
        buf4 = pool.acquire()
        assert buf4 is not None

    def test_get_stats(self):
        """Test getting pool statistics."""
        pytest.importorskip("wgpu")
        from systems.pixel_compiler.buffer_pool import BufferPool

        pool = BufferPool(buffer_size=1024, max_buffers=3)

        stats = pool.get_stats()
        assert "acquires" in stats
        assert "releases" in stats
        assert "cache_hits" in stats
        assert "cache_misses" in stats
        assert "pool_size" in stats
        assert "total_buffers" in stats
        assert "hit_rate" in stats

    def test_clear(self):
        """Test clearing the pool."""
        pytest.importorskip("wgpu")
        from systems.pixel_compiler.buffer_pool import BufferPool

        pool = BufferPool(buffer_size=1024, max_buffers=3)

        buf1 = pool.acquire()
        pool.release(buf1)

        pool.clear()

        stats = pool.get_stats()
        assert stats["pool_size"] == 0
        assert stats["total_buffers"] == 0

    def test_buffer_pool_manager(self):
        """Test BufferPoolManager with multiple pools."""
        pytest.importorskip("wgpu")
        from systems.pixel_compiler.buffer_pool import BufferPoolManager

        manager = BufferPoolManager()

        # All pools should exist
        assert manager.bytecode_pool is not None
        assert manager.memory_pool is not None
        assert manager.globals_pool is not None
        assert manager.output_pool is not None

    def test_buffer_pool_manager_stats(self):
        """Test getting stats from all pools."""
        pytest.importorskip("wgpu")
        from systems.pixel_compiler.buffer_pool import BufferPoolManager

        manager = BufferPoolManager()

        stats = manager.get_all_stats()
        assert "bytecode" in stats
        assert "memory" in stats
        assert "globals" in stats
        assert "output" in stats

    def test_buffer_pool_manager_clear(self):
        """Test clearing all pools."""
        pytest.importorskip("wgpu")
        from systems.pixel_compiler.buffer_pool import BufferPoolManager

        manager = BufferPoolManager()

        # Acquire and release some buffers
        buf = manager.bytecode_pool.acquire()
        if buf:
            manager.bytecode_pool.release(buf)

        manager.clear_all()

        stats = manager.get_all_stats()
        assert stats["bytecode"]["pool_size"] == 0
        assert stats["bytecode"]["total_buffers"] == 0


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
