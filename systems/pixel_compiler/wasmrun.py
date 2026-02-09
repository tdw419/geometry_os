#!/usr/bin/env python3
"""
wasmrun - CLI tool for executing WebAssembly binaries

Supports execution of WASM from:
- .rts.png files (WASM embedded in PNG images using Hilbert curve encoding)
- .wasm files (raw WASM binaries)

Usage:
    python3 -m systems.pixel_compiler.wasmrun program.rts.png
    python3 -m systems.pixel_compiler.wasmrun program.wasm --entry 1 --trace out.json
"""

import argparse
import json
import sys
from pathlib import Path
from typing import Optional


def is_rts_png(input_path: str) -> bool:
    """
    Check if input path is a .rts.png file.

    Args:
        input_path: Path to check

    Returns:
        True if path ends with .rts.png
    """
    return input_path.endswith('.rts.png')


def validate_input_file(input_path: str) -> Path:
    """
    Validate that input file exists and has supported extension.

    Args:
        input_path: Path to input file

    Returns:
        Path object for the input file

    Raises:
        FileNotFoundError: If file doesn't exist
        ValueError: If file extension is not supported
    """
    path = Path(input_path)

    if not path.exists():
        raise FileNotFoundError(f"Input file not found: {input_path}")

    if not (path.suffix == '.wasm' or path.suffix == '.png' or is_rts_png(input_path)):
        raise ValueError(
            f"Unsupported file type: {path.suffix}. "
            f"Expected .wasm or .rts.png"
        )

    return path


def parse_args(argv: Optional[list] = None) -> argparse.Namespace:
    """
    Parse command-line arguments.

    Args:
        argv: Argument list (defaults to sys.argv[1:])

    Returns:
        Parsed arguments namespace
    """
    parser = argparse.ArgumentParser(
        prog='wasmrun',
        description='Execute WebAssembly binaries embedded in .rts.png or raw .wasm files',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  %(prog)s program.rts.png
  %(prog)s program.wasm --entry 1
  %(prog)s program.wasm --trace out.json
  %(prog)s program.wasm --dump-memory memory.bin --memory-pages 512
  %(prog)s program.wasm --max-instructions 50000
        """
    )

    parser.add_argument(
        'input',
        help='Input file (.wasm or .rts.png)'
    )

    parser.add_argument(
        '--entry', '-e',
        type=int,
        default=0,
        metavar='N',
        help='Function index to use as entry point (default: 0)'
    )

    parser.add_argument(
        '--trace', '-t',
        type=str,
        default=None,
        metavar='FILE',
        help='Export execution trace to JSON file'
    )

    parser.add_argument(
        '--dump-memory', '-m',
        type=str,
        default=None,
        metavar='FILE',
        help='Export WASM linear memory to binary file'
    )

    parser.add_argument(
        '--memory-pages', '-p',
        type=int,
        default=256,
        metavar='N',
        help='Number of 64KB memory pages to allocate (default: 256)'
    )

    parser.add_argument(
        '--max-instructions', '-i',
        type=int,
        default=100000,
        metavar='N',
        help='Maximum number of instructions to execute (default: 100000)'
    )

    parser.add_argument(
        '--shader-path',
        type=str,
        default=None,
        metavar='PATH',
        help='Path to WASM VM shader (default: systems/infinite_map_rs/shaders/wasm_vm_complete.wgsl)'
    )

    parser.add_argument(
        '--verbose', '-v',
        action='store_true',
        help='Enable verbose output'
    )

    parser.add_argument(
        '--version',
        action='version',
        version='%(prog)s 1.0.0'
    )

    return parser.parse_args(argv)


def load_wasm_from_input(input_path: Path, verbose: bool = False) -> bytes:
    """
    Load WASM bytes from input file.

    Args:
        input_path: Path to input file (.wasm or .rts.png)
        verbose: Enable verbose logging

    Returns:
        WASM bytecode as bytes

    Raises:
        RuntimeError: If WASM loading fails
    """
    try:
        # Import here to avoid issues if PIL is not available
        from systems.pixel_compiler.wasm_extractor import WASMExtractor
        from systems.pixel_compiler.pixelrts_v2_wasm import WASMCodeVisualizer

        if is_rts_png(str(input_path)):
            # Extract WASM from .rts.png
            if verbose:
                print(f"Extracting WASM from {input_path}...")

            wasm_bytes = WASMExtractor.extract_from_png(input_path)

            if verbose:
                print(f"Extracted {len(wasm_bytes)} bytes")

        elif input_path.suffix == '.wasm':
            # Load raw WASM file
            if verbose:
                print(f"Loading WASM from {input_path}...")

            with open(input_path, 'rb') as f:
                wasm_bytes = f.read()

            if verbose:
                print(f"Loaded {len(wasm_bytes)} bytes")

        else:
            raise RuntimeError(f"Unsupported file type: {input_path.suffix}")

        # Validate WASM magic number
        visualizer = WASMCodeVisualizer()
        if not visualizer.is_wasm(wasm_bytes):
            raise RuntimeError(
                f"Invalid WASM file: missing magic number \\x00asm"
            )

        if verbose:
            print("Valid WASM magic number detected")

        return wasm_bytes

    except ImportError as e:
        raise RuntimeError(
            f"Failed to import required modules: {e}. "
            f"Ensure PIL/Pillow is installed."
        )
    except FileNotFoundError as e:
        raise RuntimeError(f"File not found: {e}")
    except Exception as e:
        raise RuntimeError(f"Failed to load WASM: {e}")


def execute_wasm(
    wasm_bytes: bytes,
    entry_point: int = 0,
    memory_pages: int = 256,
    max_instructions: int = 100000,
    shader_path: Optional[str] = None,
    verbose: bool = False
) -> dict:
    """
    Execute WASM bytecode on GPU.

    Args:
        wasm_bytes: WASM bytecode to execute
        entry_point: Function index to start from
        memory_pages: Number of 64KB memory pages
        max_instructions: Maximum instructions to execute
        shader_path: Path to WASM VM shader (optional)
        verbose: Enable verbose logging

    Returns:
        Dictionary with execution results
    """
    # Default shader path
    if shader_path is None:
        shader_path = "systems/infinite_map_rs/shaders/wasm_vm_complete.wgsl"

    shader_file = Path(shader_path)
    if not shader_file.exists():
        # Try relative to project root
        project_root = Path(__file__).parent.parent.parent.parent
        alt_shader = project_root / shader_path
        if alt_shader.exists():
            shader_file = alt_shader
        else:
            if verbose:
                print(f"Warning: WASM VM shader not found: {shader_path}")
            return {
                'success': False,
                'steps': 0,
                'error': f"WASM VM shader not found: {shader_path}",
                'bridge': None
            }

    if verbose:
        print(f"Using shader: {shader_file}")

    try:
        # Try to import the GPU bridge
        # Note: The bridge may not be available in all environments
        import importlib
        bridge_module = importlib.import_module('systems.pixel_compiler.wasm_gpu_bridge')
        WASMGPUBridge = getattr(bridge_module, 'WASMGPUBridge', None)

        if WASMGPUBridge is None:
            raise ImportError("WASMGPUBridge class not found in wasm_gpu_bridge module")

        if verbose:
            print("Initializing GPU bridge...")

        bridge = WASMGPUBridge(str(shader_file))

        if verbose:
            print("Loading WASM bytecode...")

        bridge.load_wasm(wasm_bytes)

        if verbose:
            print(f"Configuring memory: {memory_pages} pages ({memory_pages * 64}KB)...")

        bridge.configure_memory(memory_pages=memory_pages)

        # Set entry point if the bridge supports it
        if hasattr(bridge, 'set_entry_point'):
            bridge.set_entry_point(entry_point)

        if verbose:
            print(f"Executing WASM (entry={entry_point}, max={max_instructions} instructions)...")

        # Try different execute signatures
        if hasattr(bridge, 'execute'):
            import inspect
            sig = inspect.signature(bridge.execute)
            if 'entry_point' in sig.parameters:
                result = bridge.execute(
                    max_instructions=max_instructions,
                    entry_point=entry_point
                )
            else:
                result = bridge.execute(max_instructions=max_instructions)
        else:
            raise RuntimeError("Bridge has no execute method")

        # Handle different result types
        if hasattr(result, 'completed'):
            completed = result.completed
            steps = result.steps if hasattr(result, 'steps') else max_instructions
            error = result.error if hasattr(result, 'error') else None
        elif hasattr(result, 'success'):
            completed = result.success
            steps = result.steps if hasattr(result, 'steps') else max_instructions
            error = result.error if hasattr(result, 'error') else None
        else:
            completed = True
            steps = max_instructions
            error = None

        return {
            'success': completed,
            'steps': steps,
            'error': error,
            'bridge': bridge
        }

    except ImportError as e:
        if verbose:
            print(f"Note: GPU bridge not available ({e})")
        return {
            'success': False,
            'steps': 0,
            'error': f"GPU bridge not available. Install wgpu: pip install wgpu",
            'bridge': None
        }
    except Exception as e:
        return {
            'success': False,
            'steps': 0,
            'error': str(e),
            'bridge': None
        }


def save_trace(trace_data: list, output_path: str, verbose: bool = False) -> None:
    """
    Save execution trace to JSON file.

    Args:
        trace_data: List of trace entries
        output_path: Path to output JSON file
        verbose: Enable verbose logging
    """
    try:
        with open(output_path, 'w') as f:
            json.dump(trace_data, f, indent=2)

        if verbose:
            print(f"Trace saved to {output_path} ({len(trace_data)} entries)")

    except Exception as e:
        print(f"Warning: Failed to save trace: {e}", file=sys.stderr)


def save_memory(memory_bytes: bytes, output_path: str, verbose: bool = False) -> None:
    """
    Save WASM memory dump to binary file.

    Args:
        memory_bytes: Memory data as bytes
        output_path: Path to output binary file
        verbose: Enable verbose logging
    """
    try:
        with open(output_path, 'wb') as f:
            f.write(memory_bytes)

        if verbose:
            print(f"Memory dump saved to {output_path} ({len(memory_bytes)} bytes)")

    except Exception as e:
        print(f"Warning: Failed to save memory dump: {e}", file=sys.stderr)


def main(argv: Optional[list] = None) -> int:
    """
    Main entry point for wasmrun CLI.

    Args:
        argv: Command-line arguments (defaults to sys.argv[1:])

    Returns:
        Exit code (0 for success, non-zero for error)
    """
    args = parse_args(argv)

    try:
        # Validate input file
        input_path = validate_input_file(args.input)

        # Load WASM
        wasm_bytes = load_wasm_from_input(input_path, verbose=args.verbose)

        # Execute WASM
        exec_result = execute_wasm(
            wasm_bytes=wasm_bytes,
            entry_point=args.entry,
            memory_pages=args.memory_pages,
            max_instructions=args.max_instructions,
            shader_path=args.shader_path,
            verbose=args.verbose
        )

        # Check for execution errors
        if not exec_result['success']:
            print(f"Error: {exec_result['error']}", file=sys.stderr)
            return 1

        # Print result summary
        if args.verbose:
            print(f"\nExecution completed:")
            print(f"  Steps: {exec_result['steps']}")

        # Export trace if requested
        if args.trace:
            bridge = exec_result.get('bridge')
            if bridge is not None and hasattr(bridge, 'read_trace'):
                try:
                    trace = bridge.read_trace()
                    save_trace(trace, args.trace, verbose=args.verbose)
                except Exception as e:
                    print(f"Warning: Failed to read trace: {e}", file=sys.stderr)
            else:
                print(f"Warning: Trace export requested but bridge not available", file=sys.stderr)

        # Export memory if requested
        if args.dump_memory:
            bridge = exec_result.get('bridge')
            if bridge is not None and hasattr(bridge, 'read_memory'):
                try:
                    # Read entire memory
                    memory_size = args.memory_pages * 65536  # 64KB per page
                    memory_bytes = bridge.read_memory(0, memory_size)
                    save_memory(memory_bytes, args.dump_memory, verbose=args.verbose)
                except Exception as e:
                    print(f"Warning: Failed to read memory: {e}", file=sys.stderr)
            else:
                print(f"Warning: Memory dump requested but bridge not available", file=sys.stderr)

        return 0

    except FileNotFoundError as e:
        print(f"Error: {e}", file=sys.stderr)
        return 1
    except ValueError as e:
        print(f"Error: {e}", file=sys.stderr)
        return 1
    except RuntimeError as e:
        print(f"Error: {e}", file=sys.stderr)
        return 1
    except KeyboardInterrupt:
        print("\nInterrupted by user", file=sys.stderr)
        return 130
    except Exception as e:
        print(f"Unexpected error: {e}", file=sys.stderr)
        if args.verbose:
            import traceback
            traceback.print_exc()
        return 1


if __name__ == '__main__':
    sys.exit(main())
