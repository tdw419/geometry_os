
from pathlib import Path
from typing import Optional, List, Any, TYPE_CHECKING
import struct
import asyncio

from .wasm_extractor import WASMExtractor
from .wasm_gpu_bridge import WASMGPUBridge, ExecutionResult
from .wasm_tracer import WasmTracer, TraceLevel

if TYPE_CHECKING:
    from .wasm_debugger import WasmDebugger

class WASMRuntime:
    """
    High-level runtime for executing WASM from PixelRTS containers.
    """
    
    def __init__(self, shader_path: Optional[str] = None, use_buffer_pool: bool = False):
        self.extractor = WASMExtractor()
        self.bridge = WASMGPUBridge(shader_path)
        self.max_instructions = 100000
        self.memory_pages = 1
        self._on_reload_callback = None
        self._loaded_path: Optional[str] = None
        self._debugger: Optional['WasmDebugger'] = None
        self.last_memory_dump: Optional[bytes] = None
        self.tracer = WasmTracer(level=TraceLevel.NONE)

        # Optimization features
        self._use_buffer_pool = use_buffer_pool
        self._async_executor = None
        
    @classmethod
    def from_png(cls, rts_png_path: str, shader_path: Optional[str] = None, use_buffer_pool: bool = False) -> 'WASMRuntime':
        runtime = cls(shader_path, use_buffer_pool=use_buffer_pool)
        runtime.load(rts_png_path)
        return runtime

    @classmethod
    def from_wasm(cls, wasm_bytes: bytes, shader_path: Optional[str] = None, use_buffer_pool: bool = False) -> 'WASMRuntime':
        """Create a WASMRuntime directly from WASM bytes."""
        runtime = cls(shader_path, use_buffer_pool=use_buffer_pool)
        runtime.reload_bytes(wasm_bytes)
        return runtime

    def load(self, rts_png_path: str):
        """Load WASM from .rts.png file."""
        self._loaded_path = rts_png_path
        self.wasm_bytes = self.extractor.extract_from_file(rts_png_path)
        self.exports = self.extractor._parse_wasm_exports(self.wasm_bytes)
        print(f"Loaded WASM: {len(self.wasm_bytes)} bytes. Exports: {list(self.exports.keys())}")

    def call(self, function_name: str, *args) -> Any:
        """
        Call an exported function with arguments.

        Arguments are passed via globals array:
        - globals[0]: Return value (read after execution)
        - globals[1+]: Function arguments (written before execution)

        Args:
            function_name: Name of exported function to call
            *args: Integer arguments to pass to the function

        Returns:
            The return value from globals[0] after execution

        Raises:
            ValueError: If function not found in exports
            RuntimeError: If execution fails
        """
        if function_name not in self.exports:
            raise ValueError(f"Function '{function_name}' not found in exports: {list(self.exports.keys())}")

        pc = self.exports[function_name]

        # Convert arguments to list and validate
        arguments = list(args)

        # Validate arguments are integers
        for i, arg in enumerate(arguments):
            if not isinstance(arg, int):
                raise TypeError(f"Argument {i} must be int, got {type(arg).__name__}")

        # Reserve globals[0] for return value, pass args as globals[1+]
        result = self.bridge.execute(
            wasm_bytes=self.wasm_bytes,
            entry_point=pc,
            max_instructions=self.max_instructions,
            memory_pages=self.memory_pages,
            globals_init=[0],  # Initialize globals[0] to 0 for return value
            arguments=arguments  # Arguments go to globals[1], globals[2], etc.
        )

        if not result.success:
            raise RuntimeError(f"Execution failed: {result.error}")

        return result.return_value

    def run_main(self) -> Any:
        """Run the start function or main if present."""
        if "main" in self.exports:
            return self.call("main")
        elif "_start" in self.exports:
            return self.call("_start")
        else:
            # Just run from 0
            return self.bridge.execute(self.wasm_bytes, entry_point=0)

    def set_debugger(self, debugger: 'WasmDebugger'):
        """Attach a debugger to this runtime"""
        self._debugger = debugger

    def get_debugger(self) -> Optional['WasmDebugger']:
        """Get attached debugger"""
        return self._debugger

    def reload(self, rts_png_path: str = None):
        """
        Reload WASM from file.

        Args:
            rts_png_path: Path to .rts.png file (uses last loaded path if None)

        Raises:
            FileNotFoundError: If no path provided and no previous load
        """
        # Determine path to load from
        if rts_png_path is None:
            rts_png_path = self._loaded_path

        if rts_png_path is None:
            raise FileNotFoundError("No RTS file path provided")

        # Store old bytes for callback
        old_bytes = getattr(self, 'wasm_bytes', None)

        # Reload WASM
        self.load(rts_png_path)

        # Store path for future reloads
        self._loaded_path = rts_png_path

        # Call callback if registered
        if self._on_reload_callback and old_bytes:
            self._on_reload_callback(old_bytes, self.wasm_bytes)

    def reload_bytes(self, wasm_bytes: bytes):
        """
        Reload WASM from direct bytes.

        Args:
            wasm_bytes: New WASM bytecode
        """
        old_bytes = getattr(self, 'wasm_bytes', None)

        self.wasm_bytes = wasm_bytes
        self.exports = self.extractor._parse_wasm_exports(wasm_bytes)

        # Call callback if registered
        if self._on_reload_callback and old_bytes:
            self._on_reload_callback(old_bytes, wasm_bytes)

    def set_on_reload_callback(self, callback):
        """
        Set callback to be called on reload.

        Args:
            callback: Function taking (old_bytes, new_bytes)
        """
        self._on_reload_callback = callback

    def get_loaded_path(self) -> Optional[str]:
        """Get the path of the currently loaded file"""
        return self._loaded_path

    def set_trace_level(self, level: TraceLevel):
        """Set execution trace verbosity level"""
        self.tracer.set_level(level)
        # Also enable bridge tracing if level > NONE
        if level.value > TraceLevel.NONE.value:
            self.bridge.enable_tracing()
        else:
            self.bridge.disable_tracing()

    def enable_tracing(self):
        """Enable GPU bridge trace collection."""
        self.bridge.enable_tracing()

    def disable_tracing(self):
        """Disable GPU bridge trace collection."""
        self.bridge.disable_tracing()

    def get_memory(self) -> bytes:
        """
        Get the current WASM linear memory contents.

        Returns:
            Bytes containing current memory state
        """
        return self.bridge.get_memory()

    def debug_trace(self) -> list:
        """
        Get the execution trace from the last run.

        Returns:
            List of trace entries (each entry is a dict with pc, opcode, etc.)
        """
        return self.tracer.filter_by_type("instruction") + \
               self.tracer.filter_by_type("memory_access") + \
               self.tracer.filter_by_type("function_call") + \
               self.tracer.filter_by_type("function_return")

    def get_trace_statistics(self) -> dict:
        """Get trace execution statistics"""
        return self.tracer.get_statistics()

    def export_trace(self) -> str:
        """Export trace as JSON string"""
        return self.tracer.export_json()

    def clear_trace(self):
        """Clear all trace events"""
        self.tracer.clear()

    def get_memory_usage(self) -> dict:
        """
        Get current memory usage statistics.

        Returns:
            Dictionary with memory usage info:
            - pages: Number of memory pages allocated
            - bytes: Total bytes allocated (pages * 65536)

        Example:
            >>> runtime = WASMRuntime.from_png("test.rts.png")
            >>> usage = runtime.get_memory_usage()
            >>> print(f"Memory: {usage['pages']} pages ({usage['bytes']} bytes)")
        """
        if not self.bridge or not hasattr(self.bridge, 'memory_pages'):
            return {"pages": 0, "bytes": 0}

        # Get memory pages from bridge
        pages = self.bridge.memory_pages

        # Calculate bytes (65536 bytes per page)
        memory_bytes = pages * 65536

        return {
            "pages": pages,
            "bytes": memory_bytes
        }

    def snapshot_memory(self) -> bytes:
        """
        Save current memory state to bytes.

        Returns:
            Bytes containing current memory contents for later restore

        Example:
            >>> snapshot = runtime.snapshot_memory()
            >>> # ... modify memory ...
            >>> runtime.restore_memory(snapshot)
        """
        if not self.bridge or not hasattr(self.bridge, 'get_memory'):
            return b""

        return self.bridge.get_memory()

    def restore_memory(self, snapshot: bytes) -> None:
        """
        Restore memory state from snapshot.

        Args:
            snapshot: Bytes from snapshot_memory()

        Example:
            >>> snapshot = runtime.snapshot_memory()
            >>> runtime.call("modify_memory")
            >>> runtime.restore_memory(snapshot)  # Revert
        """
        if not self.bridge or not hasattr(self.bridge, 'set_memory'):
            return

        self.bridge.set_memory(snapshot)

    async def call_async(self, function_name: str, *args) -> Any:
        """
        Call a function asynchronously.

        Args:
            function_name: Name of exported function
            *args: Integer arguments

        Returns:
            The return value from execution

        Raises:
            ValueError: If function not found in exports
            RuntimeError: If execution fails
        """
        from .async_executor import AsyncWASMExecutor

        if self._async_executor is None:
            self._async_executor = AsyncWASMExecutor()

        if function_name not in self.exports:
            raise ValueError(f"Function '{function_name}' not found in exports: {list(self.exports.keys())}")

        pc = self.exports[function_name]
        arguments = list(args)

        result = await self._async_executor.execute_async(
            wasm_bytes=self.wasm_bytes,
            entry_point=pc,
            arguments=arguments,
            memory_pages=self.memory_pages,
            max_instructions=self.max_instructions
        )

        if not result.success:
            raise RuntimeError(f"Async execution failed: {result.error}")

        return result.return_value

    def get_buffer_stats(self) -> dict:
        """Get buffer pool statistics if enabled."""
        if self._async_executor:
            return self._async_executor.get_stats()
        return {"buffer_pool": "disabled"}

    def enable_optimizations(self, buffer_pool: bool = True) -> None:
        """
        Enable runtime optimizations.

        Args:
            buffer_pool: Whether to use buffer pooling (requires async executor)
        """
        self._use_buffer_pool = buffer_pool
        if buffer_pool and self._async_executor is None:
            from .async_executor import AsyncWASMExecutor
            self._async_executor = AsyncWASMExecutor()

