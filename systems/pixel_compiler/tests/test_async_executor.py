# systems/pixel_compiler/tests/test_async_executor.py
"""Tests for async WASM execution."""
import pytest
import asyncio


class TestAsyncExecutor:
    """Test async execution functionality."""

    @pytest.mark.asyncio
    async def test_async_execute(self):
        """Test async WASM execution."""
        pytest.importorskip("wgpu")
        from systems.pixel_compiler.async_executor import AsyncWASMExecutor

        executor = AsyncWASMExecutor()
        wasm = bytes([0x00, 0x61, 0x73, 0x6d, 0x01, 0x00, 0x00, 0x00])

        result = await executor.execute_async(wasm, entry_point=0)
        assert result.success

    @pytest.mark.asyncio
    async def test_concurrent_executions(self):
        """Test multiple concurrent executions."""
        pytest.importorskip("wgpu")
        from systems.pixel_compiler.async_executor import AsyncWASMExecutor

        executor = AsyncWASMExecutor()
        wasm = bytes([0x00, 0x61, 0x73, 0x6d, 0x01, 0x00, 0x00, 0x00])

        # Execute 5 concurrent calls
        tasks = [
            executor.execute_async(wasm, entry_point=0, arguments=[i])
            for i in range(5)
        ]

        results = await asyncio.gather(*tasks)
        assert len(results) == 5
        assert all(r.success for r in results)

    @pytest.mark.asyncio
    async def test_callback_on_complete(self):
        """Test callback when execution completes."""
        pytest.importorskip("wgpu")
        from systems.pixel_compiler.async_executor import AsyncWASMExecutor

        executor = AsyncWASMExecutor()
        wasm = bytes([0x00, 0x61, 0x73, 0x6d, 0x01, 0x00, 0x00, 0x00])

        completed = []

        async def on_complete(result):
            completed.append(result)

        await executor.execute_async(wasm, entry_point=0, callback=on_complete)

        assert len(completed) == 1

    @pytest.mark.asyncio
    async def test_execute_batch_async(self):
        """Test async batch execution."""
        pytest.importorskip("wgpu")
        from systems.pixel_compiler.async_executor import AsyncWASMExecutor
        from systems.pixel_compiler.batched_executor import WASMBatch

        executor = AsyncWASMExecutor()
        batch = WASMBatch()
        wasm = bytes([0x00, 0x61, 0x73, 0x6d, 0x01, 0x00, 0x00, 0x00])

        for i in range(3):
            batch.add_call(wasm, entry_point=0, arguments=[i])

        results = await executor.execute_batch_async(batch)
        assert len(results) == 3
        assert all(r.success for r in results)

    @pytest.mark.asyncio
    async def test_submit_and_get_result(self):
        """Test submit/get pattern for deferred result retrieval."""
        pytest.importorskip("wgpu")
        from systems.pixel_compiler.async_executor import AsyncWASMExecutor

        executor = AsyncWASMExecutor()
        wasm = bytes([0x00, 0x61, 0x73, 0x6d, 0x01, 0x00, 0x00, 0x00])

        # Submit for async execution
        exec_id = executor.submit(wasm, entry_point=0, arguments=[42])

        # Wait a bit for execution
        await asyncio.sleep(0.1)

        # Get result
        result = executor.get_result(exec_id)
        assert result is not None
        assert result.success

    def test_shutdown(self):
        """Test executor shutdown."""
        pytest.importorskip("wgpu")
        from systems.pixel_compiler.async_executor import AsyncWASMExecutor

        executor = AsyncWASMExecutor()
        executor.shutdown()  # Should not raise

    def test_get_stats(self):
        """Test getting executor statistics."""
        pytest.importorskip("wgpu")
        from systems.pixel_compiler.async_executor import AsyncWASMExecutor

        executor = AsyncWASMExecutor()
        stats = executor.get_stats()

        assert isinstance(stats, dict)
        assert "pending_results" in stats
        assert "queue_size" in stats


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
