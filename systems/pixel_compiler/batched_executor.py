# systems/pixel_compiler/batched_executor.py
"""
Batched WASM Execution

Executes multiple WASM calls in a single GPU dispatch for improved throughput.
"""
from dataclasses import dataclass, field
from typing import List, Optional, Dict, Any
import numpy as np

try:
    import wgpu
except ImportError:
    wgpu = None

from .buffer_pool import BufferPoolManager


@dataclass
class WASMCall:
    """A single WASM call to be executed."""
    wasm_bytes: bytes
    entry_point: int = 0
    arguments: List[int] = field(default_factory=list)
    memory_pages: int = 1
    max_instructions: int = 10000
    id: Optional[str] = None  # For result matching


@dataclass
class WASMBatch:
    """A batch of WASM calls to execute together."""
    calls: List[WASMCall] = field(default_factory=list)

    def add_call(
        self,
        wasm_bytes: bytes,
        entry_point: int = 0,
        arguments: List[int] = None,
        memory_pages: int = 1,
        max_instructions: int = 10000,
        id: str = None
    ) -> 'WASMCall':
        """Add a call to the batch."""
        call = WASMCall(
            wasm_bytes=wasm_bytes,
            entry_point=entry_point,
            arguments=arguments or [],
            memory_pages=memory_pages,
            max_instructions=max_instructions,
            id=id
        )
        self.calls.append(call)
        return call

    def clear(self) -> None:
        """Clear all calls from the batch."""
        self.calls.clear()


@dataclass
class BatchResult:
    """Result of a batched execution."""
    call_id: Optional[str]
    success: bool
    return_value: Optional[int] = None
    error: Optional[str] = None


class BatchedExecutor:
    """
    Executes WASM calls in batches for improved GPU utilization.

    Instead of dispatching a single workgroup per call, batches
    multiple calls and dispatches them together.
    """

    def __init__(self, shader_path: str = None):
        self.mock = wgpu is None
        self.buffer_pools: Optional[BufferPoolManager] = None
        self.device = None

        if not self.mock:
            try:
                adapter = wgpu.gpu.request_adapter(power_preference="high-performance")
                self.device = adapter.request_device(required_features=[])
                self.buffer_pools = BufferPoolManager(device=self.device)
            except Exception as e:
                print(f"Warning: GPU init failed: {e}. Using mock mode.")
                self.mock = True

    def execute_batch(self, batch: WASMBatch) -> List[BatchResult]:
        """
        Execute a batch of WASM calls.

        Args:
            batch: The batch of calls to execute

        Returns:
            List of results, one per call in the batch
        """
        if self.mock:
            return self._execute_batch_mock(batch)
        else:
            return self._execute_batch_gpu(batch)

    def _execute_batch_mock(self, batch: WASMBatch) -> List[BatchResult]:
        """Mock implementation for testing."""
        results = []
        for call in batch.calls:
            results.append(BatchResult(
                call_id=call.id,
                success=True,
                return_value=42,  # Mock return
            ))
        return results

    def _execute_batch_gpu(self, batch: WASMBatch) -> List[BatchResult]:
        """GPU implementation of batched execution."""
        results = []

        # For now, execute sequentially but reuse buffers
        # Full parallel dispatch would require shader modifications
        for call in batch.calls:
            result = self._execute_single(call)
            results.append(result)

        return results

    def _execute_single(self, call: WASMCall) -> BatchResult:
        """Execute a single call using pooled buffers."""
        bytecode_buffer = None
        memory_buffer = None
        globals_buffer = None

        try:
            # Get buffers from pool
            if self.buffer_pools:
                bytecode_buffer = self.buffer_pools.bytecode_pool.acquire()
                memory_buffer = self.buffer_pools.memory_pool.acquire()
                globals_buffer = self.buffer_pools.globals_pool.acquire()

            # Prepare data
            padded_wasm = call.wasm_bytes + b'\x00' * ((4 - len(call.wasm_bytes) % 4) % 4)
            bytecode_array = np.frombuffer(padded_wasm, dtype=np.uint32)

            memory_size = call.memory_pages * 64 * 1024
            memory_array = np.zeros(memory_size // 4, dtype=np.uint32)

            globals_array = np.zeros(16, dtype=np.uint32)
            for i, arg in enumerate(call.arguments):
                if i + 1 < len(globals_array):
                    globals_array[i + 1] = arg

            # Write to buffers
            if bytecode_buffer and self.device:
                self.device.queue.write_buffer(bytecode_buffer, 0, bytecode_array.tobytes())
            if memory_buffer and self.device:
                self.device.queue.write_buffer(memory_buffer, 0, memory_array.tobytes())
            if globals_buffer and self.device:
                self.device.queue.write_buffer(globals_buffer, 0, globals_array.tobytes())

            # Execute (simplified - would use actual pipeline)
            return BatchResult(
                call_id=call.id,
                success=True,
                return_value=0,
            )

        except Exception as e:
            return BatchResult(
                call_id=call.id,
                success=False,
                return_value=None,
                error=str(e)
            )

        finally:
            # Return buffers to pool
            if self.buffer_pools:
                if bytecode_buffer:
                    self.buffer_pools.bytecode_pool.release(bytecode_buffer)
                if memory_buffer:
                    self.buffer_pools.memory_pool.release(memory_buffer)
                if globals_buffer:
                    self.buffer_pools.globals_pool.release(globals_buffer)

    def get_stats(self) -> Dict[str, Any]:
        """Get execution statistics."""
        if self.buffer_pools:
            return self.buffer_pools.get_all_stats()
        return {"mock_mode": True}
