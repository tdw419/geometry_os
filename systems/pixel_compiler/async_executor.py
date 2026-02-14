# systems/pixel_compiler/async_executor.py
"""
Async WASM Execution

Provides non-blocking WASM execution with callbacks and result streaming.
"""
import asyncio
from dataclasses import dataclass
from typing import Optional, List, Callable, Any
from concurrent.futures import ThreadPoolExecutor
import queue

from .batched_executor import BatchedExecutor, WASMBatch, BatchResult


@dataclass
class AsyncExecutionResult:
    """Result of an async execution."""
    success: bool
    return_value: Optional[int] = None
    memory_dump: Optional[bytes] = None
    error: Optional[str] = None


class AsyncWASMExecutor:
    """
    Async interface for WASM execution.

    Supports:
    - Non-blocking execution
    - Callbacks on completion
    - Concurrent executions
    - Result streaming via queue
    """

    def __init__(self, max_workers: int = 4):
        self.executor = BatchedExecutor()
        self._thread_pool = ThreadPoolExecutor(max_workers=max_workers)
        self._result_queue: queue.Queue = queue.Queue()
        self._loop: Optional[asyncio.AbstractEventLoop] = None
        self._pending: dict = {}
        self._next_id = 0

    async def execute_async(
        self,
        wasm_bytes: bytes,
        entry_point: int = 0,
        arguments: List[int] = None,
        memory_pages: int = 1,
        max_instructions: int = 10000,
        callback: Callable[[AsyncExecutionResult], Any] = None
    ) -> AsyncExecutionResult:
        """
        Execute WASM asynchronously.

        Args:
            wasm_bytes: WASM bytecode
            entry_point: Entry point offset
            arguments: Function arguments
            memory_pages: Memory pages to allocate
            max_instructions: Maximum instructions
            callback: Optional async callback

        Returns:
            AsyncExecutionResult when complete
        """
        loop = asyncio.get_event_loop()

        # Run in thread pool to avoid blocking
        result = await loop.run_in_executor(
            self._thread_pool,
            self._execute_sync,
            wasm_bytes, entry_point, arguments, memory_pages, max_instructions
        )

        # Call callback if provided
        if callback:
            if asyncio.iscoroutinefunction(callback):
                await callback(result)
            else:
                callback(result)

        return result

    def _execute_sync(
        self,
        wasm_bytes: bytes,
        entry_point: int,
        arguments: List[int],
        memory_pages: int,
        max_instructions: int
    ) -> AsyncExecutionResult:
        """Synchronous execution (runs in thread pool)."""
        try:
            # Use batched executor for efficiency
            batch = WASMBatch()
            batch.add_call(
                wasm_bytes=wasm_bytes,
                entry_point=entry_point,
                arguments=arguments,
                memory_pages=memory_pages,
                max_instructions=max_instructions
            )

            results = self.executor.execute_batch(batch)
            batch_result = results[0] if results else None

            if batch_result and batch_result.success:
                return AsyncExecutionResult(
                    success=True,
                    return_value=batch_result.return_value,
                )
            else:
                return AsyncExecutionResult(
                    success=False,
                    return_value=None,
                    error=batch_result.error if batch_result else "No result"
                )

        except Exception as e:
            return AsyncExecutionResult(
                success=False,
                return_value=None,
                error=str(e)
            )

    async def execute_batch_async(
        self,
        batch: WASMBatch,
        callback: Callable[[List[BatchResult]], Any] = None
    ) -> List[BatchResult]:
        """
        Execute a batch asynchronously.

        Args:
            batch: Batch of calls
            callback: Optional callback for results

        Returns:
            List of results
        """
        loop = asyncio.get_event_loop()

        results = await loop.run_in_executor(
            self._thread_pool,
            self.executor.execute_batch,
            batch
        )

        if callback:
            if asyncio.iscoroutinefunction(callback):
                await callback(results)
            else:
                callback(results)

        return results

    def submit(
        self,
        wasm_bytes: bytes,
        entry_point: int = 0,
        arguments: List[int] = None
    ) -> str:
        """
        Submit execution for later retrieval.

        Returns:
            Execution ID for result lookup
        """
        exec_id = f"exec_{self._next_id}"
        self._next_id += 1

        # Create task but don't await
        asyncio.create_task(
            self._execute_and_store(exec_id, wasm_bytes, entry_point, arguments)
        )

        return exec_id

    async def _execute_and_store(
        self,
        exec_id: str,
        wasm_bytes: bytes,
        entry_point: int,
        arguments: List[int]
    ) -> None:
        """Execute and store result."""
        result = await self.execute_async(
            wasm_bytes=wasm_bytes,
            entry_point=entry_point,
            arguments=arguments
        )
        self._pending[exec_id] = result
        self._result_queue.put((exec_id, result))

    def get_result(self, exec_id: str, timeout: float = None) -> Optional[AsyncExecutionResult]:
        """
        Get result of a submitted execution.

        Args:
            exec_id: Execution ID from submit()
            timeout: Max time to wait

        Returns:
            Result if available, None otherwise
        """
        if exec_id in self._pending:
            return self._pending.pop(exec_id)

        try:
            eid, result = self._result_queue.get(timeout=timeout)
            if eid == exec_id:
                return result
            else:
                # Put back for other caller
                self._result_queue.put((eid, result))
                return None
        except queue.Empty:
            return None

    def shutdown(self) -> None:
        """Shutdown executor."""
        self._thread_pool.shutdown(wait=True)

    def get_stats(self) -> dict:
        """Get executor statistics."""
        return {
            **self.executor.get_stats(),
            "pending_results": len(self._pending),
            "queue_size": self._result_queue.qsize(),
        }
