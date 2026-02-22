#!/usr/bin/env python3
"""
vasm - Visual Assembler CLI
Compiles PixelRTS assembly syntax to .rts.png executables
"""

import sys
import argparse
from pathlib import Path
import os

# Add project root to path for imports
script_dir = Path(__file__).parent.resolve()
# Navigate from systems/pixel_compiler/ to project root
project_root = script_dir.parent.parent
if str(project_root) not in sys.path:
    sys.path.insert(0, str(project_root))

from systems.pixel_compiler.vasm import VisualAssembler

def main():
    parser = argparse.ArgumentParser(
        description='Visual Assembler - Compile assembly to .rts.png',
        epilog='''
Examples:
  vasm program.vasm -o program.rts.png
  vasm program.vasm -o program.rts.png --mode code
  vasm program.vasm --info  # Show assembly info only
        ''',
        formatter_class=argparse.RawDescriptionHelpFormatter
    )

    parser.add_argument('input', help='Input assembly file (.vasm)')
    parser.add_argument('-o', '--output', help='Output .rts.png file')
    parser.add_argument('--mode', choices=['standard', 'code'], default='standard',
                        help='Encoding mode (standard=raw, code=semantic coloring)')
    parser.add_argument('--info', action='store_true',
                        help='Show program info without compiling')
    parser.add_argument('--list', action='store_true',
                        help='List instructions without compiling')

    args = parser.parse_args()

    # Read input file
    input_path = Path(args.input)
    if not input_path.exists():
        print(f"Error: Input file '{args.input}' not found", file=sys.stderr)
        return 1

    with open(input_path, 'r') as f:
        source = f.read()

    # Assemble
    assembler = VisualAssembler()
    try:
        instructions = assembler.compile(source)
    except ValueError as e:
        print(f"Assembly error: {e}", file=sys.stderr)
        return 1

    # Show info if requested
    if args.info:
        print(f"Program: {input_path.name}")
        print(f"Instructions: {len(instructions)}")
        print(f"Labels: {list(assembler.labels.keys())}")
        print(f"Entry point: {assembler.labels.get('main', 'N/A')}")
        return 0

    if args.list:
        print(f"# {'Addr':>4} {'Opcode':8} {'Operands'}")
        # Reverse opcode lookup
        opcode_to_mnemonic = {v: k for k, v in assembler.opcodes.items()}
        for i, inst in enumerate(instructions):
            mnemonic = opcode_to_mnemonic.get(inst.opcode, '???')
            if inst.src:
                operands = f"R{inst.dest}, R{inst.src}"
            else:
                operands = f"R{inst.dest}, {inst.immediate}"
            print(f"  {i:>4} {mnemonic:8} {operands}")
        return 0

    # Determine output path
    if args.output:
        output_path = args.output
    else:
        output_path = input_path.stem + '.rts.png'

    # Save PNG
    try:
        assembler.save_png(output_path, mode=args.mode)
        print(f"Compiled {len(instructions)} instructions -> {output_path}")
        if args.mode == 'code':
            print(f"   Mode: code (semantic coloring enabled)")
        return 0
    except Exception as e:
        print(f"Error writing output: {e}", file=sys.stderr)
        return 1

if __name__ == '__main__':
    sys.exit(main())
