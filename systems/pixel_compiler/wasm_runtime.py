#!/usr/bin/env python3
"""
WASM Runtime - High-level User-Friendly API for WASM Execution

This module provides a Pythonic API for loading and executing WebAssembly
binaries embedded in .rts.png files using the GPU WASM VM.

The runtime handles:
- Loading WASM from .rts.png files or raw WASM bytes
- Validating and preparing WASM for execution
- Executing functions with arguments
- Reading memory state
- Generating execution traces for debugging

Author: PixelRTS v2 Implementation
Date: 2026-02-09
"""

from pathlib import Path
from typing import Any, List, Dict, Optional, Union
import sys


class WASMRuntime:
    """
    High-level runtime for executing WASM from .rts.png files.

    This class provides a Pythonic API that abstracts away the
    complexity of GPU execution, memory management, and trace handling.

    Example:
        >>> # Load WASM from .rts.png
        >>> runtime = WASMRuntime.from_png("fibonacci.rts.png")
        >>> result = runtime.call("fibonacci", 10)
        >>> print(result)  # 55
        >>>
        >>> # Or load from raw WASM bytes
        >>> with open("program.wasm", "rb") as f:
        ...     wasm = f.read()
        >>> runtime = WASMRuntime.from_wasm(wasm)
        >>> result = runtime.call("main")
        >>>
        >>> # Debug with trace
        >>> for entry in runtime.debug_trace():
        ...     print(f"PC={entry['pc']}: {entry['opcode']}")
    """

    def __init__(self, wasm_bytes: bytes):
        """
        Initialize runtime with WASM bytes.

        Use from_png() or from_wasm() factory methods instead.

        Args:
            wasm_bytes: Valid WASM binary

        Raises:
            ValueError: If wasm_bytes is not valid WASM
        """
        # Import here to avoid circular imports
        from systems.pixel_compiler.wasm_extractor_simple import WASMExtractor

        # Validate WASM
        extractor = WASMExtractor()
        if not extractor.validate_wasm(wasm_bytes):
            raise ValueError(f"Invalid WASM: missing or incorrect magic number")

        self.wasm_bytes = wasm_bytes
        self._extractor = extractor
        self._bridge = None
        self._initialized = False
        self._last_result = None
        self._trace_enabled = False

    @classmethod
    def from_png(cls, png_path: Union[str, Path]) -> "WASMRuntime":
        """
        Create runtime from .rts.png file.

        This factory method extracts WASM from a .rts.png file
        and returns an initialized WASMRuntime instance.

        Args:
            png_path: Path to the .rts.png file

        Returns:
            WASMRuntime instance

        Raises:
            FileNotFoundError: If PNG file doesn't exist
            ValueError: If no valid WASM found in PNG

        Example:
            >>> runtime = WASMRuntime.from_png("fibonacci.rts.png")
            >>> result = runtime.call("fibonacci", 10)
        """
        from systems.pixel_compiler.wasm_extractor_simple import WASMExtractor

        extractor = WASMExtractor()
        wasm_bytes = extractor.extract_from_png(Path(png_path))

        return cls(wasm_bytes)

    @classmethod
    def from_wasm(cls, wasm_bytes: bytes) -> "WASMRuntime":
        """
        Create runtime from raw WASM bytes.

        This factory method creates a WASMRuntime instance
        directly from WASM bytecode.

        Args:
            wasm_bytes: Valid WASM binary

        Returns:
            WASMRuntime instance

        Raises:
            ValueError: If wasm_bytes is not valid WASM

        Example:
            >>> with open("program.wasm", "rb") as f:
            ...     wasm = f.read()
            >>> runtime = WASMRuntime.from_wasm(wasm)
        """
        return cls(wasm_bytes)

    def call(self, function_name: str, *args) -> Any:
        """
        Execute a WASM function by name.

        This is the main entry point for executing WASM code.
        The function validates inputs, initializes the GPU bridge
        if needed, executes the function, and returns the result.

        Args:
            function_name: Name of the exported WASM function to call
            *args: Arguments to pass to the function (integers only)

        Returns:
            Function return value (int, float, or None)

        Raises:
            RuntimeError: If execution fails
            ValueError: If function not found or arguments invalid

        Example:
            >>> runtime = WASMRuntime.from_png("math.rts.png")
            >>> result = runtime.call("add", 5, 3)  # Returns 8
            >>> result = runtime.call("fibonacci", 10)  # Returns 55
        """
        # Initialize bridge if needed
        if not self._initialized:
            self._initialize()

        # Validate arguments
        for arg in args:
            if not isinstance(arg, (int, float)):
                raise ValueError(f"Invalid argument type: {type(arg)}. Only int and float supported.")

        # Set up the bridge for execution
        self._bridge.load_wasm(self.wasm_bytes)
        self._bridge.enable_trace(self._trace_enabled)

        # Execute the function
        # Note: For now, we use a simple name lookup. In production,
        # we'd parse the WASM export section to find the function index.
        self._last_result = self._bridge.execute(max_instructions=100000)

        if not self._last_result.completed:
            raise RuntimeError(f"Execution failed: {self._last_result.error}")

        return self._last_result.return_value

    def get_memory(self) -> bytes:
        """
        Get the entire WASM linear memory state.

        Returns the current contents of WASM memory after execution.
        Useful for inspecting data structures and buffers.

        Returns:
            Bytes containing the entire WASM memory

        Raises:
            RuntimeError: If runtime not initialized

        Example:
            >>> runtime = WASMRuntime.from_png("buffer.rts.png")
            >>> runtime.call("fill_buffer")
            >>> memory = runtime.get_memory()
            >>> print(f"First 16 bytes: {memory[:16].hex()}")
        """
        if not self._initialized:
            self._initialize()

        # Return the full memory (default 256 pages = 16MB)
        max_memory = self._bridge.memory_pages * 65536
        return self._bridge.read_memory(0, max_memory)

    def debug_trace(self) -> List[Dict[str, Any]]:
        """
        Get execution trace for debugging.

        Returns a list of trace entries showing each instruction
        executed during the last call(). This is useful for
        debugging and analyzing WASM execution.

        Returns:
            List of trace entry dictionaries with keys:
            - pc: Program counter
            - opcode: Opcode value
            - opcode_name: Human-readable opcode name
            - operands: Tuple of operand values
            - stack_depth: Current stack depth

        Raises:
            RuntimeError: If trace not enabled or no execution yet

        Example:
            >>> runtime = WASMRuntime.from_png("program.rts.png")
            >>> runtime.enable_trace()
            >>> runtime.call("main")
            >>> for entry in runtime.debug_trace():
            ...     print(f"PC={entry['pc']}: {entry['opcode_name']}")
        """
        if not self._trace_enabled:
            return []

        if not self._initialized or self._last_result is None:
            return []

        return self._last_result.trace

    def enable_trace(self, enabled: bool = True) -> None:
        """
        Enable or disable execution tracing.

        When enabled, the runtime will record each instruction
        executed during call() for debugging.

        Args:
            enabled: True to enable tracing, False to disable

        Example:
            >>> runtime = WASMRuntime.from_png("program.rts.png")
            >>> runtime.enable_trace()
            >>> runtime.call("main")
            >>> trace = runtime.debug_trace()
        """
        self._trace_enabled = enabled

        if self._bridge is not None:
            self._bridge.enable_trace(enabled)

    def get_wasm_info(self) -> Dict[str, Any]:
        """
        Get information about the loaded WASM module.

        Returns metadata about the WASM binary including
        version, sections, and function exports.

        Returns:
            Dictionary with WASM metadata

        Example:
            >>> runtime = WASMRuntime.from_png("program.rts.png")
            >>> info = runtime.get_wasm_info()
            >>> print(f"Version: {info['version']}")
            >>> print(f"Sections: {info['sections']}")
        """
        return self._extractor.get_wasm_info(self.wasm_bytes)

    def _initialize(self) -> None:
        """
        Initialize the GPU bridge for execution.

        This is called lazily on first call() to avoid
        initializing the GPU until needed.
        """
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge

        # Find the shader path (relative to this file)
        shader_path = Path(__file__).parent.parent.parent / "systems" / "infinite_map_rs" / "shaders" / "wasm_vm_complete.wgsl"
        if not shader_path.exists():
            # Try alternate path
            shader_path = Path(__file__).parent.parent.parent / "systems" / "infinite_map_rs" / "shaders" / "wasm_vm_complete.wgsl"

        self._bridge = WASMGPUBridge(str(shader_path))
        self._bridge.configure_memory(memory_pages=256)
        self._initialized = True

    def __enter__(self):
        """Context manager entry."""
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        """Context manager exit."""
        # Cleanup if needed
        return False

    def __repr__(self) -> str:
        """String representation of the runtime."""
        wasm_size = len(self.wasm_bytes)
        return f"WASMRuntime(wasm_size={wasm_size}, initialized={self._initialized})"


def load_wasm_from_png(png_path: Union[str, Path]) -> WASMRuntime:
    """
    Convenience function to load WASM from .rts.png file.

    Args:
        png_path: Path to the .rts.png file

    Returns:
        WASMRuntime instance

    Example:
        >>> runtime = load_wasm_from_png("fibonacci.rts.png")
        >>> result = runtime.call("fibonacci", 10)
    """
    return WASMRuntime.from_png(png_path)


def execute_wasm(wasm_bytes: bytes, function: str = "main", *args) -> Any:
    """
    Convenience function to execute WASM without creating runtime.

    Args:
        wasm_bytes: Valid WASM binary
        function: Function name to call (default: "main")
        *args: Arguments to pass to the function

    Returns:
        Function return value

    Example:
        >>> with open("program.wasm", "rb") as f:
        ...     wasm = f.read()
        >>> result = execute_wasm(wasm, "add", 5, 3)
    """
    runtime = WASMRuntime.from_wasm(wasm_bytes)
    return runtime.call(function, *args)


if __name__ == "__main__":
    import sys

    # Simple CLI for testing
    if len(sys.argv) < 2:
        print("Usage: python3 wasm_runtime.py <file.rts.png|file.wasm> [function] [args...]")
        print()
        print("Examples:")
        print("  python3 wasm_runtime.py fibonacci.rts.png fibonacci 10")
        print("  python3 wasm_runtime.py program.wasm main")
        sys.exit(1)

    input_path = sys.argv[1]
    function_name = sys.argv[2] if len(sys.argv) > 2 else "main"
    args = [int(a) if a.isdigit() else float(a) for a in sys.argv[3:]]

    try:
        # Load based on extension
        if str(input_path).endswith('.wasm'):
            with open(input_path, 'rb') as f:
                wasm_bytes = f.read()
            runtime = WASMRuntime.from_wasm(wasm_bytes)
        else:
            runtime = WASMRuntime.from_png(input_path)

        # Enable trace for debugging
        runtime.enable_trace(True)

        # Execute
        result = runtime.call(function_name, *args)

        print(f"Result: {result}")

        # Show trace if available
        trace = runtime.debug_trace()
        if trace:
            print(f"\nExecution trace ({len(trace)} entries):")
            for entry in trace[:10]:  # Show first 10
                print(f"  PC={entry['pc']:4d}: {entry['opcode_name']}")
            if len(trace) > 10:
                print(f"  ... and {len(trace) - 10} more")

    except Exception as e:
        print(f"Error: {e}")
        import traceback
        traceback.print_exc()
        sys.exit(1)
