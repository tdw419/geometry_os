"""
Tests for PixelRTS v2 Runtime Efficiency Module

Tests in-place execution, zero-copy operations, JIT compilation,
memory pooling, and SIMD optimization.
"""

import pytest
import sys
from pathlib import Path

# Add parent directory to path for imports
sys.path.insert(0, str(Path(__file__).parent.parent))

from pixelrts_runtime import (
    MemoryRegion,
    AllocationType,
    CachePolicy,
    MemoryBlock,
    FunctionCache,
    MemoryPool,
    InPlaceExecutor,
    ZeroCopyTransfer,
    JITCompiler,
    FunctionCallCache,
    InlineCache,
    SIMDOptimizer,
    RuntimeManager,
    create_runtime_manager
)


class TestMemoryRegion:
    """Test memory region enumeration."""

    def test_region_values(self):
        """Regions should have correct ordering."""
        assert MemoryRegion.HOT.value == 0
        assert MemoryRegion.WARM.value == 1
        assert MemoryRegion.COLD.value == 2
        assert MemoryRegion.GPU_ONLY.value == 3


class TestMemoryBlock:
    """Test memory block data structure."""

    def test_block_creation(self):
        """Block should be created correctly."""
        block = MemoryBlock(
            block_id=0,
            offset=0,
            size=4096,
            region=MemoryRegion.HOT
        )
        assert block.block_id == 0
        assert block.in_use == False

    def test_block_to_dict(self):
        """Block should serialize correctly."""
        block = MemoryBlock(
            block_id=1,
            offset=4096,
            size=4096,
            region=MemoryRegion.WARM,
            in_use=True,
            owner="test"
        )
        d = block.to_dict()
        assert d['block_id'] == 1
        assert d['region'] == 'WARM'
        assert d['in_use'] == True


class TestFunctionCache:
    """Test function cache data structure."""

    def test_cache_creation(self):
        """Cache entry should be created correctly."""
        cache = FunctionCache(
            func_id="test_func",
            entry_point=0x1000,
            code_size=256
        )
        assert cache.func_id == "test_func"
        assert cache.call_count == 0
        assert cache.compiled == False

    def test_cache_to_dict(self):
        """Cache entry should serialize correctly."""
        cache = FunctionCache(
            func_id="test",
            entry_point=0x2000,
            code_size=512,
            call_count=10,
            compiled=True
        )
        d = cache.to_dict()
        assert d['func_id'] == "test"
        assert d['call_count'] == 10
        assert d['compiled'] == True


class TestMemoryPool:
    """Test memory pool functionality."""

    def test_pool_creation(self):
        """Pool should be created correctly."""
        pool = MemoryPool(total_size=1024*1024)
        assert pool.total_size == 1024*1024
        assert len(pool.blocks) > 0

    def test_allocate_hot(self):
        """Should allocate from hot zone."""
        pool = MemoryPool(total_size=1024*1024, hot_zone_size=256*1024)
        block = pool.allocate(4096, MemoryRegion.HOT, "test")

        assert block is not None
        assert block.region == MemoryRegion.HOT
        assert block.in_use == True

    def test_allocate_warm(self):
        """Should allocate from warm zone."""
        pool = MemoryPool(total_size=1024*1024, hot_zone_size=64*1024)
        # First consume hot zone to force warm allocation
        for _ in range(20):
            pool.allocate(4096, MemoryRegion.HOT)

        block = pool.allocate(4096, MemoryRegion.WARM, "test")

        assert block is not None
        # May fall back to available region
        assert block.region in [MemoryRegion.WARM, MemoryRegion.COLD]

    def test_allocate_cold(self):
        """Should allocate from cold zone."""
        pool = MemoryPool(total_size=1024*1024)
        block = pool.allocate(4096, MemoryRegion.COLD, "test")

        assert block is not None
        assert block.region == MemoryRegion.COLD

    def test_deallocate(self):
        """Should deallocate blocks correctly."""
        pool = MemoryPool(total_size=1024*1024)
        block = pool.allocate(4096, MemoryRegion.HOT)

        pool.deallocate(block.block_id)

        assert block.in_use == False
        assert block.block_id in pool.free_blocks[MemoryRegion.HOT]

    def test_get_hot_zone_stats(self):
        """Should return hot zone statistics."""
        pool = MemoryPool(total_size=1024*1024, hot_zone_size=256*1024)
        stats = pool.get_hot_zone_stats()

        assert 'total_blocks' in stats
        assert 'used_blocks' in stats
        assert 'utilization' in stats
        assert 'allocations' in stats

    def test_multiple_allocations(self):
        """Should handle multiple allocations."""
        pool = MemoryPool(total_size=1024*1024)

        blocks = []
        for i in range(10):
            block = pool.allocate(4096, MemoryRegion.HOT)
            blocks.append(block)

        assert len([b for b in blocks if b is not None]) == 10

    def test_defragment(self):
        """Should defragment pool."""
        pool = MemoryPool(total_size=1024*1024)
        pool.defragment()

        stats = pool.get_hot_zone_stats()
        assert stats['fragmentation_events'] == 1


class TestInPlaceExecutor:
    """Test in-place execution."""

    def test_executor_creation(self):
        """Executor should be created correctly."""
        executor = InPlaceExecutor()
        assert len(executor._code_regions) == 0

    def test_register_code(self):
        """Should register code for execution."""
        executor = InPlaceExecutor()
        code = b'\x90\x90\x90\xC3'  # NOP x3, RET

        result = executor.register_code("test_func", code)
        assert result == True
        assert "test_func" in executor._code_regions

    def test_execute_at_offset(self):
        """Should execute registered code."""
        executor = InPlaceExecutor()
        code = b'\xB8\x01\x00\x00\x00\xC3'  # MOV EAX, 1; RET

        executor.register_code("test_func", code)
        result = executor.execute_at_offset("test_func")

        assert result['status'] == 'success'
        assert result['code_id'] == "test_func"

    def test_execute_unregistered(self):
        """Should fail for unregistered code."""
        executor = InPlaceExecutor()

        with pytest.raises(ValueError):
            executor.execute_at_offset("unknown_func")

    def test_get_execution_stats(self):
        """Should return execution statistics."""
        executor = InPlaceExecutor()
        code = b'\x90' * 100

        executor.register_code("test", code)
        executor.execute_at_offset("test")

        stats = executor.get_execution_stats()
        assert stats['executions'] == 1
        assert stats['bytes_executed'] == 100


class TestZeroCopyTransfer:
    """Test zero-copy transfers."""

    def test_transfer_creation(self):
        """Transfer manager should be created correctly."""
        zc = ZeroCopyTransfer()
        assert len(zc._registered_regions) == 0

    def test_register_region(self):
        """Should register memory region."""
        zc = ZeroCopyTransfer()
        data = b'test data' * 100

        result = zc.register_region("test_region", data)
        assert result == True
        assert "test_region" in zc._registered_regions

    def test_transfer(self):
        """Should transfer registered region."""
        zc = ZeroCopyTransfer()
        data = b'test data' * 100

        zc.register_region("test_region", data)
        result = zc.transfer("test_region", 0, len(data))

        assert result == True

    def test_transfer_unknown_region(self):
        """Should fail for unknown region."""
        zc = ZeroCopyTransfer()
        result = zc.transfer("unknown", 0, 100)
        assert result == False

    def test_zero_copy_stats(self):
        """Should track zero-copy statistics."""
        zc = ZeroCopyTransfer()
        data = b'test' * 1000

        zc.register_region("test", data, gpu_accessible=True)
        zc.transfer("test", 0, len(data), use_zero_copy=True)

        stats = zc.get_stats()
        assert stats['transfers'] == 1
        assert stats['zero_copy_hits'] == 1


class TestJITCompiler:
    """Test JIT compilation."""

    def test_jit_creation(self):
        """JIT compiler should be created correctly."""
        jit = JITCompiler()
        assert len(jit._compiled_cache) == 0

    def test_get_or_compile(self):
        """Should compile and cache functions."""
        jit = JITCompiler()
        bytecode = b'\x00\x61\x73\x6d'  # WASM magic

        cache = jit.get_or_compile("test_func", bytecode)

        assert cache is not None
        assert cache.compiled == True
        assert "test_func" in jit._compiled_cache

    def test_cache_hit(self):
        """Should hit cache for compiled functions."""
        jit = JITCompiler()
        bytecode = b'test bytecode'

        # First call compiles
        jit.get_or_compile("test_func", bytecode)

        # Second call should hit cache
        cache = jit.get_or_compile("test_func", bytecode)
        assert cache.call_count >= 1

    def test_get_hot_functions(self):
        """Should identify hot functions."""
        jit = JITCompiler()
        bytecode = b'test'

        jit.get_or_compile("hot_func", bytecode)
        # Manually increase call count
        jit._compiled_cache["hot_func"].call_count = 20

        hot = jit.get_hot_functions()
        assert "hot_func" in hot

    def test_get_stats(self):
        """Should return compilation statistics."""
        jit = JITCompiler()
        jit.get_or_compile("test", b'code')

        stats = jit.get_stats()
        assert 'compilations' in stats
        assert 'compiled_functions' in stats


class TestFunctionCallCache:
    """Test function call caching."""

    def test_cache_creation(self):
        """Cache should be created correctly."""
        cache = FunctionCallCache()
        assert len(cache._cache) == 0

    def test_lookup_miss(self):
        """Should return None for cache miss."""
        cache = FunctionCallCache()
        result = cache.lookup("unknown_func")
        assert result is None
        assert cache._stats['misses'] == 1

    def test_store_and_lookup(self):
        """Should store and lookup functions."""
        cache = FunctionCallCache()
        entry = FunctionCache(
            func_id="test",
            entry_point=0x1000,
            code_size=256
        )

        cache.store("test", entry)
        result = cache.lookup("test")

        assert result is not None
        assert result.func_id == "test"
        assert cache._stats['hits'] == 1

    def test_eviction(self):
        """Should evict LRU entries when full."""
        cache = FunctionCallCache()
        cache._max_entries = 5

        # Fill cache
        for i in range(5):
            entry = FunctionCache(
                func_id=f"func_{i}",
                entry_point=i * 0x100,
                code_size=256
            )
            cache.store(f"func_{i}", entry)

        # Add one more to trigger eviction
        entry = FunctionCache(
            func_id="new_func",
            entry_point=0x1000,
            code_size=256
        )
        cache.store("new_func", entry)

        assert cache._stats['evictions'] == 1

    def test_get_stats(self):
        """Should return cache statistics."""
        cache = FunctionCallCache()
        entry = FunctionCache(
            func_id="test",
            entry_point=0,
            code_size=100
        )
        cache.store("test", entry)
        cache.lookup("test")
        cache.lookup("unknown")

        stats = cache.get_stats()
        assert stats['hits'] == 1
        assert stats['misses'] == 1
        assert 0 <= stats['hit_rate'] <= 1


class TestInlineCache:
    """Test inline function caching."""

    def test_cache_creation(self):
        """Cache should be created correctly."""
        cache = InlineCache()
        assert len(cache._inline_blocks) == 0

    def test_cache_function(self):
        """Should cache small functions."""
        cache = InlineCache()
        code = b'\x90' * 100  # Small function

        result = cache.cache_function("small_func", code)
        assert result == True
        assert "small_func" in cache._inline_blocks

    def test_cache_too_large(self):
        """Should reject functions that are too large."""
        cache = InlineCache(block_size=128)
        code = b'\x90' * 256  # Larger than block size

        result = cache.cache_function("large_func", code)
        assert result == False

    def test_get_function(self):
        """Should retrieve cached function."""
        cache = InlineCache()
        code = b'test code'

        cache.cache_function("test", code)
        result = cache.get_function("test")

        assert result == code

    def test_get_at_pixel(self):
        """Should retrieve function by pixel coords."""
        cache = InlineCache()
        code = b'pixel code'

        cache.cache_function("pixel_func", code, (100, 200))
        result = cache.get_at_pixel(100, 200)

        assert result == code

    def test_get_stats(self):
        """Should return cache statistics."""
        cache = InlineCache()
        cache.cache_function("test", b'code')
        cache.get_function("test")
        cache.get_function("unknown")

        stats = cache.get_stats()
        assert stats['cached_functions'] == 1
        assert stats['cache_hits'] == 1
        assert stats['cache_misses'] == 1


class TestSIMDOptimizer:
    """Test SIMD optimization."""

    def test_simd_creation(self):
        """SIMD optimizer should be created correctly."""
        simd = SIMDOptimizer()
        assert len(simd._operations) > 0

    def test_memcpy(self):
        """Should perform SIMD memcpy."""
        simd = SIMDOptimizer()
        data = b'test data' * 100

        result = simd.process('memcpy', data)
        assert result == data

    def test_memset(self):
        """Should perform SIMD memset."""
        simd = SIMDOptimizer()
        data = b'\x00' * 100

        result = simd.process('memset', data, 0xFF)
        assert result == b'\xFF' * 100

    def test_xor(self):
        """Should perform SIMD XOR."""
        simd = SIMDOptimizer()
        data = b'\x00\x01\x02\x03'
        key = b'\xFF'

        result = simd.process('xor', data, key)
        assert result == b'\xFF\xFE\xFD\xFC'

    def test_add(self):
        """Should perform SIMD add."""
        simd = SIMDOptimizer()
        data = b'\x00\x01\x02\x03'

        result = simd.process('add', data, 10)
        assert result == b'\x0a\x0b\x0c\x0d'

    def test_unknown_operation(self):
        """Should raise for unknown operation."""
        simd = SIMDOptimizer()

        with pytest.raises(ValueError):
            simd.process('unknown', b'data')

    def test_batch_process(self):
        """Should process multiple chunks."""
        simd = SIMDOptimizer()
        chunks = [b'\x00\x01', b'\x02\x03', b'\x04\x05']

        results = simd.batch_process('add', chunks, 1)
        assert len(results) == 3
        assert results[0] == b'\x01\x02'

    def test_get_stats(self):
        """Should return SIMD statistics."""
        simd = SIMDOptimizer()
        simd.process('memcpy', b'data')

        stats = simd.get_stats()
        assert stats['operations'] == 1
        assert stats['bytes_processed'] == 4

    def test_estimate_speedup(self):
        """Should estimate speedup for data sizes."""
        simd = SIMDOptimizer()

        # Small data: no speedup
        assert simd.estimate_speedup(32) == 1.0

        # Medium data: some speedup
        assert simd.estimate_speedup(512) == 2.0

        # Large data: full speedup
        assert simd.estimate_speedup(4096) == 4.0


class TestRuntimeManager:
    """Test runtime manager."""

    def test_manager_creation(self):
        """Manager should be created correctly."""
        manager = RuntimeManager()
        assert manager.memory_pool is not None
        assert manager.in_place_executor is not None

    def test_initialize(self):
        """Should initialize successfully."""
        manager = RuntimeManager()
        result = manager.initialize()
        assert result == True

    def test_execute_function(self):
        """Should execute functions through optimization stack."""
        manager = RuntimeManager()
        manager.initialize()

        bytecode = b'\xB8\x01\x00\x00\x00\xC3'  # MOV EAX, 1; RET

        # Register code first
        manager.in_place_executor.register_code("test_func", bytecode)

        result = manager.execute_function("test_func", bytecode)
        assert result is not None
        assert result['status'] == 'success'

    def test_transfer_data(self):
        """Should transfer data with zero-copy."""
        manager = RuntimeManager()
        data = b'test data' * 100

        result = manager.transfer_data(data, use_zero_copy=True)
        assert result == True

    def test_get_comprehensive_stats(self):
        """Should return all statistics."""
        manager = RuntimeManager()

        stats = manager.get_comprehensive_stats()

        assert 'memory_pool' in stats
        assert 'in_place_executor' in stats
        assert 'zero_copy' in stats
        assert 'jit_compiler' in stats
        assert 'function_cache' in stats
        assert 'inline_cache' in stats
        assert 'simd_optimizer' in stats


class TestCreateRuntimeManager:
    """Test runtime manager factory."""

    def test_create_default(self):
        """Should create with defaults."""
        manager = create_runtime_manager()
        assert manager is not None
        assert isinstance(manager, RuntimeManager)

    def test_create_custom_size(self):
        """Should create with custom size."""
        manager = create_runtime_manager(
            memory_pool_mb=128,
            hot_zone_mb=8
        )
        assert manager.memory_pool.total_size == 128 * 1024 * 1024


class TestIntegration:
    """Integration tests for runtime efficiency."""

    def test_full_execution_flow(self):
        """Test complete execution flow with all optimizations."""
        manager = RuntimeManager()
        manager.initialize()

        # Register code
        code = b'\xB8\x01\x00\x00\x00\xC3'  # MOV EAX, 1; RET
        manager.in_place_executor.register_code("test", code)

        # Execute
        result = manager.execute_function("test", code)
        assert result is not None

        # Transfer data
        data = b'test' * 1000
        manager.transfer_data(data)

        # Process with SIMD
        processed = manager.simd_optimizer.process('memcpy', data)
        assert processed == data

        # Get stats
        stats = manager.get_comprehensive_stats()
        assert stats['in_place_executor']['executions'] >= 1

    def test_memory_pool_stress(self):
        """Test memory pool under stress."""
        pool = MemoryPool(total_size=1024*1024)

        blocks = []
        # Allocate many blocks
        for i in range(100):
            block = pool.allocate(4096, MemoryRegion.HOT)
            if block:
                blocks.append(block)

        # Deallocate half
        for block in blocks[:50]:
            pool.deallocate(block.block_id)

        # Allocate again
        for i in range(25):
            pool.allocate(4096, MemoryRegion.HOT)

        stats = pool.get_hot_zone_stats()
        assert stats['allocations'] >= 75
        assert stats['deallocations'] >= 50
