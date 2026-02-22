#!/usr/bin/env python3
"""
pixelrts_trace - Visual Debugger CLI for PixelRTS Programs

Traces execution of .rts.png programs and generates:
- JSON trace output
- Heatmap visualization
- Interactive viewing

Usage:
    python -m pixelrts_trace program.png --output trace.json --heatmap heatmap.png --view
"""

import argparse
import json
import sys
import tempfile
from pathlib import Path
from typing import Optional, Dict, Any

try:
    import numpy as np
    from PIL import Image
except ImportError as e:
    print(f"Error: Required dependency not found: {e}", file=sys.stderr)
    print("Install with: pip install numpy pillow", file=sys.stderr)
    sys.exit(1)

# Try to import GPU executor
try:
    from .PixelRuntime import PixelRuntime
except ImportError:
    try:
        from PixelRuntime import PixelRuntime
    except ImportError:
        PixelRuntime = None


class GPUExecutor:
    """
    GPU Executor for PixelRTS programs.
    Wraps PixelRuntime with enhanced debugging capabilities.
    """

    def __init__(self):
        if PixelRuntime is None:
            raise RuntimeError("PixelRuntime not available. Cannot execute on GPU.")
        self.runtime = PixelRuntime()
        self.width = None
        self.height = None

    def load_program(self, png_path: str) -> None:
        """Load program from PNG file"""
        try:
            img = Image.open(png_path).convert('RGBA')
            self.width, self.height = img.size
            self.pixels = np.array(img).astype(np.uint8)

            # Upload to GPU
            self.runtime.load_program(png_path)
        except Exception as e:
            raise RuntimeError(f"Failed to load program: {e}")

    def execute_with_trace(self, initial_regs: Optional[list] = None) -> Dict[str, Any]:
        """
        Execute program and capture execution trace.

        Returns:
            Dictionary with:
                - executed_instructions: int
                - trace: list of instruction entries
                - final_registers: array
        """
        if initial_regs:
            self.runtime.prepare_registers(initial_regs)
        else:
            self.runtime.prepare_registers()

        # Try to use enhanced runtime if available
        if hasattr(self.runtime, 'run_with_trace'):
            result = self.runtime.run_with_trace()
            return result
        else:
            # Fallback to basic execution
            final_regs = self.runtime.run()
            return {
                'executed_instructions': 0,
                'trace': [],
                'final_registers': final_regs
            }

    def execute_with_heatmap(self, initial_regs: Optional[list] = None) -> Dict[str, Any]:
        """
        Execute program and generate execution heatmap.

        Returns:
            Dictionary with:
                - heatmap: numpy array (RGBA)
                - final_registers: array
        """
        if initial_regs:
            self.runtime.prepare_registers(initial_regs)
        else:
            self.runtime.prepare_registers()

        # Try to use enhanced runtime if available
        if hasattr(self.runtime, 'run_with_heatmap'):
            result = self.runtime.run_with_heatmap()
            return result
        else:
            # Fallback: generate simple heatmap from trace
            result = self.execute_with_trace(initial_regs)
            # Create basic heatmap (red = executed)
            heatmap = np.zeros((self.height, self.width, 4), dtype=np.uint8)
            for entry in result.get('trace', []):
                pc = entry[0]
                if pc < self.width * self.height:
                    y = pc // self.width
                    x = pc % self.width
                    if y < self.height and x < self.width:
                        heatmap[y, x] = [255, 0, 0, 128]  # Red marker
            return {
                'heatmap': heatmap,
                'final_registers': result.get('final_registers', [])
            }


class TraceVisualizer:
    """
    Visualizer for PixelRTS execution traces.
    Generates heatmaps and formatted output.
    """

    @staticmethod
    def save_heatmap(heatmap: np.ndarray, output_path: str) -> None:
        """Save heatmap as PNG"""
        img = Image.fromarray(heatmap.astype(np.uint8), 'RGBA')
        img.save(output_path)

    @staticmethod
    def format_trace_text(trace_data: Dict[str, Any]) -> str:
        """Format trace as readable text"""
        lines = []
        lines.append("=== PixelRTS Execution Trace ===")
        lines.append(f"Instructions executed: {trace_data.get('executed_instructions', 0)}")
        lines.append("")

        trace = trace_data.get('trace', [])
        for i, entry in enumerate(trace[:50]):  # Show first 50
            pc, opcode, dest, src, imm = entry
            lines.append(f"{i:4d}: PC={pc:4d} OP={opcode:3d} R{dest} R{src} {imm}")

        if len(trace) > 50:
            lines.append(f"... and {len(trace) - 50} more")

        lines.append("")
        lines.append("=== Final Registers ===")
        regs = trace_data.get('final_registers', [])
        for i in range(min(16, len(regs))):
            lines.append(f"R{i:2d}: {regs[i]:.2f}")

        return '\n'.join(lines)

    @staticmethod
    def save_trace_json(trace_data: Dict[str, Any], output_path: str) -> None:
        """Save trace as JSON"""
        # Convert numpy arrays to lists
        output_data = {}
        for key, value in trace_data.items():
            if isinstance(value, np.ndarray):
                output_data[key] = value.tolist()
            else:
                output_data[key] = value

        with open(output_path, 'w') as f:
            json.dump(output_data, f, indent=2)


def main():
    """CLI entry point"""
    parser = argparse.ArgumentParser(
        description='Visual Debugger for PixelRTS Programs',
        epilog='''
Examples:
  python -m pixelrts_trace program.png
  python -m pixelrts_trace program.png --output trace.json
  python -m pixelrts_trace program.png --heatmap heatmap.png
  python -m pixelrts_trace program.png --output trace.json --heatmap heatmap.png
  python -m pixelrts_trace program.png --view
        ''',
        formatter_class=argparse.RawDescriptionHelpFormatter
    )

    parser.add_argument('program', help='Input .rts.png program file')
    parser.add_argument('-o', '--output', metavar='TRACE.json',
                        help='Output execution trace as JSON')
    parser.add_argument('--heatmap', metavar='HEATMAP.png',
                        help='Generate execution heatmap PNG')
    parser.add_argument('--view', action='store_true',
                        help='Display trace in terminal')
    parser.add_argument('--regs', metavar='N', type=int, default=0,
                        help='Set initial register values (e.g., --regs 42 sets R0=42)')

    args = parser.parse_args()

    # Validate input file
    program_path = Path(args.program)
    if not program_path.exists():
        print(f"Error: Program file not found: {args.program}", file=sys.stderr)
        return 1

    if not program_path.suffix.lower() in ['.png', '.rts.png']:
        print(f"Warning: Input may not be a PNG file: {args.program}", file=sys.stderr)

    print(f"Loading program: {args.program}")

    try:
        # Initialize executor
        executor = GPUExecutor()
        executor.load_program(args.program)
        print(f"Program loaded: {executor.width}x{executor.height}")

        # Prepare initial registers if specified
        initial_regs = None
        if args.regs > 0:
            initial_regs = [float(args.regs)]
            print(f"Initial R0 = {args.regs}")

        # Execute and collect data
        trace_data = {}
        heatmap_data = None

        if args.heatmap or args.view:
            print("Executing with heatmap generation...")
            result = executor.execute_with_heatmap(initial_regs)
            heatmap_data = result.get('heatmap')
            trace_data = {
                'executed_instructions': 0,
                'trace': [],
                'final_registers': result.get('final_registers', [])
            }
        else:
            print("Executing with trace capture...")
            trace_data = executor.execute_with_trace(initial_regs)

        # Save trace JSON
        if args.output:
            TraceVisualizer.save_trace_json(trace_data, args.output)
            print(f"Trace saved: {args.output}")

        # Save heatmap
        if args.heatmap and heatmap_data is not None:
            TraceVisualizer.save_heatmap(heatmap_data, args.heatmap)
            print(f"Heatmap saved: {args.heatmap}")

        # Display trace
        if args.view:
            print()
            print(TraceVisualizer.format_trace_text(trace_data))

        # Print summary
        print()
        print("=== Execution Summary ===")
        print(f"Instructions: {trace_data.get('executed_instructions', 'N/A')}")
        final_regs = trace_data.get('final_registers')
        if final_regs is not None and len(final_regs) > 0:
            print(f"Result R0: {final_regs[0]}")

        return 0

    except RuntimeError as e:
        print(f"Error: {e}", file=sys.stderr)
        return 1
    except Exception as e:
        print(f"Unexpected error: {e}", file=sys.stderr)
        import traceback
        traceback.print_exc()
        return 1


if __name__ == '__main__':
    sys.exit(main())
