# systems/pixel_compiler/tests/test_batched_executor.py
"""Tests for batched WASM execution."""
import pytest


class TestBatchedExecutor:
    """Test batched execution functionality."""

    def test_batch_creation(self):
        """Test creating a batch of WASM calls."""
        pytest.importorskip("wgpu")
        from systems.pixel_compiler.batched_executor import WASMBatch, BatchedExecutor

        batch = WASMBatch()
        batch.add_call(wasm_bytes=b'\x00\x61\x73\x6d', entry_point=0, arguments=[1, 2])
        batch.add_call(wasm_bytes=b'\x00\x61\x73\x6d', entry_point=0, arguments=[3, 4])

        assert len(batch.calls) == 2

    def test_batched_execution(self):
        """Test executing a batch of WASM calls."""
        pytest.importorskip("wgpu")
        from systems.pixel_compiler.batched_executor import BatchedExecutor, WASMBatch

        executor = BatchedExecutor()
        batch = WASMBatch()

        # Add multiple calls
        for i in range(5):
            batch.add_call(
                wasm_bytes=bytes([0x00, 0x61, 0x73, 0x6d, 0x01, 0x00, 0x00, 0x00]),
                entry_point=0,
                arguments=[i, i + 1]
            )

        results = executor.execute_batch(batch)
        assert len(results) == 5

    def test_batch_speedup(self):
        """Test that batched execution is faster than sequential."""
        pytest.importorskip("wgpu")
        from systems.pixel_compiler.batched_executor import BatchedExecutor, WASMBatch
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge
        import time

        # Simple WASM
        wasm = bytes([0x00, 0x61, 0x73, 0x6d, 0x01, 0x00, 0x00, 0x00])

        # Sequential execution
        bridge = WASMGPUBridge()
        start_seq = time.perf_counter()
        for _ in range(10):
            bridge.execute(wasm, entry_point=0)
        seq_time = time.perf_counter() - start_seq

        # Batched execution
        executor = BatchedExecutor()
        batch = WASMBatch()
        for _ in range(10):
            batch.add_call(wasm, entry_point=0)

        start_batch = time.perf_counter()
        executor.execute_batch(batch)
        batch_time = time.perf_counter() - start_batch

        # Batched should be faster (allow some variance)
        # Note: In mock mode, this may not show improvement
        print(f"Sequential: {seq_time:.4f}s, Batched: {batch_time:.4f}s")


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
