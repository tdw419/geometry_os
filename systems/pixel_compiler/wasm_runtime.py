
from pathlib import Path
from typing import Optional, List, Any, TYPE_CHECKING
import struct

from .wasm_extractor import WASMExtractor
from .wasm_gpu_bridge import WASMGPUBridge, ExecutionResult

if TYPE_CHECKING:
    from .wasm_debugger import WasmDebugger

class WASMRuntime:
    """
    High-level runtime for executing WASM from PixelRTS containers.
    """
    
    def __init__(self, shader_path: Optional[str] = None):
        self.extractor = WASMExtractor()
        self.bridge = WASMGPUBridge(shader_path)
        self.max_instructions = 100000
        self.memory_pages = 1
        self._on_reload_callback = None
        self._loaded_path: Optional[str] = None
        self._debugger: Optional['WasmDebugger'] = None
        self.last_memory_dump: Optional[bytes] = None
        
    @classmethod
    def from_png(cls, rts_png_path: str, shader_path: Optional[str] = None) -> 'WASMRuntime':
        runtime = cls(shader_path)
        runtime.load(rts_png_path)
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

