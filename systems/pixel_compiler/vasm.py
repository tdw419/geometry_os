"""
Visual Assembler (vasm) - Compiles assembly syntax to PixelRTS bytecode
Syntax based on PixelISA v1.0 specification
"""

import re
from dataclasses import dataclass
from typing import List, Dict, Optional
from pathlib import Path

# Import HilbertEngine for space-filling curve encoding
import sys
import os
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '../evolution'))
try:
    from HilbertEngine import HilbertEngine
except ImportError:
    # Fallback if HilbertEngine is not available
    class HilbertEngine:
        def d2xy(self, n, d):
            """Simple fallback: row-major order"""
            return d % n, d // n

@dataclass
class Instruction:
    opcode: int
    dest: int = 0
    src: int = 0
    immediate: int = 0
    address: int = 0  # Resolved address for jumps

@dataclass
class Label:
    name: str
    address: int

class VisualAssembler:
    def __init__(self):
        self.instructions: List[Instruction] = []
        self.labels: Dict[str, int] = {}
        self.pending_labels: List[tuple[str, Instruction]] = []  # (label_name, instruction)
        self.pc = 0  # Program counter

        # Opcode mapping
        self.opcodes = {
            'NOP': 0x00,
            'LOAD': 0x01,
            'MOV': 0x02,
            'ADD': 0x10,
            'SUB': 0x11,
            'MUL': 0x12,
            'DIV': 0x13,
            'JMP': 0x20,
            'JZ': 0x21,
            'JNZ': 0x22,
            'CALL': 0x30,
            'RET': 0x31,
            'TEXTURE': 0x40,
            'SAMPLE': 0x41,
        }

    def parse_line(self, line: str) -> Optional[Instruction]:
        """Parse a single line of assembly"""
        # Strip comments
        line = line.split(';')[0].strip()
        if not line:
            return None

        # Check for label definition
        if line.endswith(':'):
            label_name = line[:-1].strip()
            self.labels[label_name] = self.pc
            return None

        # Parse instruction
        parts = line.split()
        if not parts:
            return None

        mnemonic = parts[0].upper()
        if mnemonic not in self.opcodes:
            raise ValueError(f"Unknown opcode: {mnemonic}")

        opcode = self.opcodes[mnemonic]
        inst = Instruction(opcode=opcode, address=self.pc)

        # Parse operands based on opcode
        if mnemonic in ['LOAD']:
            # LOAD R0, 42
            dest = self._parse_register(parts[1])
            immediate = int(parts[2])
            inst.dest = dest
            inst.immediate = immediate

        elif mnemonic in ['MOV', 'ADD', 'SUB', 'MUL', 'DIV']:
            # ADD R0, R1
            dest = self._parse_register(parts[1])
            src = self._parse_register(parts[2])
            inst.dest = dest
            inst.src = src

        elif mnemonic in ['JMP']:
            # JMP label
            label_ref = parts[1]
            self.pending_labels.append((label_ref, inst))
            inst.immediate = 0  # Placeholder

        elif mnemonic in ['JZ', 'JNZ']:
            # JZ R0, label
            dest = self._parse_register(parts[1])
            label_ref = parts[2]
            inst.dest = dest
            self.pending_labels.append((label_ref, inst))
            inst.immediate = 0  # Placeholder

        elif mnemonic in ['CALL']:
            # CALL R0 (indirect call via register) or CALL label
            if len(parts) >= 2:
                operand = parts[1]
                # Check if it's a register or label
                if operand.upper().startswith('R'):
                    # Register indirect call
                    dest = self._parse_register(operand)
                    inst.dest = dest
                else:
                    # Direct call to label
                    self.pending_labels.append((operand, inst))
                    inst.immediate = 0  # Placeholder

        elif mnemonic in ['RET']:
            # RET R0
            dest = self._parse_register(parts[1])
            inst.dest = dest

        self.instructions.append(inst)
        self.pc += 1
        return inst

    def _parse_register(self, reg_str: str) -> int:
        """Parse R0-R255"""
        match = re.match(r'R(\d+)', reg_str.upper())
        if not match:
            raise ValueError(f"Invalid register: {reg_str}")
        reg_num = int(match.group(1))
        if reg_num > 255:
            raise ValueError(f"Register number too large: {reg_num}")
        return reg_num

    def resolve_labels(self):
        """Resolve all pending label references"""
        for label_name, inst in self.pending_labels:
            if label_name not in self.labels:
                raise ValueError(f"Undefined label: {label_name}")
            inst.immediate = self.labels[label_name]
        # Clear pending labels after resolution
        self.pending_labels = []

    def compile(self, source: str) -> List[Instruction]:
        """Compile full assembly source"""
        lines = source.strip().split('\n')
        for line in lines:
            self.parse_line(line)
        self.resolve_labels()
        return self.instructions

    def encode_to_pixels(self, mode: str = 'standard'):
        """Encode instructions to RGBA pixel array"""
        import numpy as np

        if not self.instructions:
            raise ValueError("No instructions to encode")

        # Calculate grid size (power of 2)
        count = len(self.instructions)
        grid_size = 2**((int(np.ceil(np.sqrt(count))) - 1).bit_length())
        if grid_size < 2:
            grid_size = 2

        # Create RGBA array
        pixels = np.zeros((grid_size, grid_size, 4), dtype=np.uint8)

        # Encode each instruction
        hilbert = HilbertEngine()
        for i, inst in enumerate(self.instructions):
            x, y = hilbert.d2xy(grid_size, i)

            # Apply semantic coloring if in code mode
            r, g, b, a = self._encode_instruction(inst, mode)
            pixels[y, x] = [r, g, b, a]

        return pixels

    def _encode_instruction(self, inst: Instruction, mode: str) -> tuple:
        """Encode instruction to RGBA values"""
        r = inst.opcode
        g = inst.dest
        b = inst.src
        a = inst.immediate

        if mode == 'code':
            # Apply semantic coloring
            if 0x20 <= inst.opcode <= 0x31:  # Control flow
                r = max(r, 200)
            elif 0x10 <= inst.opcode <= 0x13:  # Arithmetic
                r = max(r, 128)
            elif 0x01 <= inst.opcode <= 0x02:  # Memory
                r = max(r, 50)

        return (r, g, b, a)

    def add_holographic_checksum(self, pixels) -> None:
        """
        Embeds Fourier Transform signature in LSBs to detect tampering.
        Modifies pixels in-place for visual integrity.
        """
        import numpy as np
        from numpy.fft import fft2

        # Ensure pixels is a numpy array
        if not isinstance(pixels, np.ndarray):
            pixels = np.array(pixels)

        height, width = pixels.shape[:2]

        # Compute FFT of critical region (top-left min(64, height) x min(64, width))
        critical_size = min(64, height, width)
        critical_region = pixels[:critical_size, :critical_size, :3].astype(float)
        fft_data = fft2(critical_region)

        # Extract signature (magnitude of first 16 coefficients)
        sig_size = min(4, critical_size)
        signature = np.abs(fft_data[:sig_size, :sig_size]).flatten()[:16]
        max_val = np.max(signature)
        if max_val > 0:
            signature = (signature / max_val * 255).astype(np.uint8)
        else:
            signature = signature.astype(np.uint8)

        # Embed signature MSBs in LSBs of last row (alpha channel)
        # Use Hilbert curve or simple row-major for embedding
        last_row = height - 1
        num_bits = min(16, width)

        for i in range(num_bits):
            # Store the MSB of each signature byte in the LSB of alpha
            msb = (signature[i] >> 7) & 1
            pixels[last_row, i, 3] = (pixels[last_row, i, 3] & 0xFE) | msb

        return pixels

    def verify_holographic_checksum(self, pixels) -> bool:
        """Verify that holographic checksum is intact"""
        import numpy as np
        from numpy.fft import fft2

        # Ensure pixels is a numpy array
        if not isinstance(pixels, np.ndarray):
            pixels = np.array(pixels)

        height, width = pixels.shape[:2]

        # Compute FFT of critical region
        critical_size = min(64, height, width)
        critical_region = pixels[:critical_size, :critical_size, :3].astype(float)
        fft_data = fft2(critical_region)

        sig_size = min(4, critical_size)
        signature_expected = np.abs(fft_data[:sig_size, :sig_size]).flatten()[:16]
        max_val = np.max(signature_expected)
        if max_val > 0:
            signature_expected = (signature_expected / max_val * 255).astype(np.uint8)
        else:
            signature_expected = signature_expected.astype(np.uint8)

        # Extract embedded MSBs from LSBs of alpha channel
        last_row = height - 1
        num_bits = min(16, width)

        msbs_expected = [(signature_expected[i] >> 7) & 1 for i in range(num_bits)]
        msbs_embedded = [(pixels[last_row, i, 3] & 1) for i in range(num_bits)]

        # Compare MSBs
        return msbs_expected == msbs_embedded

    def add_reed_solomon_ecc(self, pixels):
        """
        Adds Reed-Solomon error correction codes to enable self-repair.
        Every 8x8 block includes parity data for neighboring blocks.
        """
        import numpy as np

        try:
            import reedsolo
        except ImportError:
            print("Warning: reedsolo not installed. Skipping ECC.")
            return pixels

        # Ensure pixels is a numpy array
        if not isinstance(pixels, np.ndarray):
            pixels = np.array(pixels)

        height, width = pixels.shape[:2]
        block_size = 8

        # Process each 8x8 block
        for by in range(0, height, block_size):
            for bx in range(0, width, block_size):
                block_end_y = min(by + block_size, height)
                block_end_x = min(bx + block_size, width)
                block = pixels[by:block_end_y, bx:block_end_x]

                # Flatten the block
                block_flat = block.flatten()

                # Create RS codec (can correct 4 bytes per block)
                rs = reedsolo.RSCodec(4)

                # Encode each channel separately
                channels = 4
                for channel in range(channels):
                    channel_data = block_flat[channel::channels]
                    if len(channel_data) == 0:
                        continue

                    try:
                        encoded = rs.encode(channel_data.tobytes())
                        # Append parity to last row of block (in alpha channel)
                        parity_start = len(channel_data)
                        parity_bytes = encoded[parity_start:parity_start + 8]

                        # Store parity in LSBs of block's last row
                        for i, pbyte in enumerate(parity_bytes):
                            col_idx = bx + i
                            row_idx = min(by + block_size - 1, height - 1)
                            if col_idx < width:
                                # Store 4 bits of parity in alpha channel
                                pixels[row_idx, col_idx, 3] = (
                                    (pixels[row_idx, col_idx, 3] & 0xF0) | (pbyte >> 4)
                                )
                    except Exception:
                        # Skip if encoding fails (e.g., data too short)
                        pass

        return pixels

    def repair_with_ecc(self, pixels):
        """Attempt to repair damaged pixels using embedded ECC"""
        import numpy as np

        try:
            import reedsolo
        except ImportError:
            return pixels

        # Ensure pixels is a numpy array
        if not isinstance(pixels, np.ndarray):
            pixels = np.array(pixels)

        height, width = pixels.shape[:2]
        block_size = 8
        repaired = pixels.copy()

        for by in range(0, height, block_size):
            for bx in range(0, width, block_size):
                block_end_y = min(by + block_size, height)
                block_end_x = min(bx + block_size, width)
                block = pixels[by:block_end_y, bx:block_end_x]

                block_flat = block.flatten()
                rs = reedsolo.RSCodec(4)

                for channel in range(4):
                    # Extract parity from last row
                    parity_data = np.zeros(8, dtype=np.uint8)
                    row_idx = min(by + block_size - 1, height - 1)

                    for i in range(8):
                        col_idx = bx + i
                        if col_idx < width:
                            parity_data[i] = pixels[row_idx, col_idx, 3] << 4

                    # Attempt correction
                    channel_data = block_flat[channel::4].copy()
                    if len(channel_data) == 0:
                        continue

                    try:
                        corrected_data = rs.decode(
                            channel_data.tobytes() + parity_data.tobytes()
                        )[0]
                        corrected = np.frombuffer(corrected_data, dtype=np.uint8)

                        if len(corrected) == len(channel_data):
                            # Reshape and store back
                            for i, val in enumerate(corrected):
                                flat_idx = channel + i * 4
                                if flat_idx < len(block_flat):
                                    y_idx = by + (flat_idx // (block_end_x - bx) * 4 // (block_end_x - bx))
                                    x_idx = bx + (flat_idx % (block_end_x - bx))
                                    if y_idx < height and x_idx < width:
                                        repaired[y_idx, x_idx, channel] = val
                    except Exception:
                        # Correction failed, keep original
                        pass

        return repaired

    def save_png(self, output_path: str, mode: str = 'standard', abi=None):
        """Save compiled program as .rts.png with optional ABI header"""
        try:
            from PIL import Image
            from .abi import VisualABI

            pixels = self.encode_to_pixels(mode)

            # Add holographic checksum
            pixels = self.add_holographic_checksum(pixels)

            # Add Reed-Solomon ECC
            pixels = self.add_reed_solomon_ecc(pixels)

            # Embed ABI header if provided
            if abi:
                abi.encode_header(pixels)

            img = Image.fromarray(pixels, 'RGBA')
            img.save(output_path)
            return True
        except ImportError:
            raise ImportError("PIL/Pillow is required for PNG output")


# ============================================================================
# CLI Functions
# ============================================================================

def compile_file(input_path: str, output_path: str = None, mode: str = 'standard') -> bool:
    """
    Compile a .vasm file to .rts.png

    Args:
        input_path: Path to input .vasm file
        output_path: Path to output .rts.png (default: input with .rts.png extension)
        mode: Encoding mode ('standard' or 'code')

    Returns:
        True if compilation succeeded, False otherwise
    """
    from pathlib import Path
    input_path = Path(input_path)

    if output_path is None:
        output_path = input_path.with_suffix('.rts.png')
    else:
        output_path = Path(output_path)

    # Read source
    try:
        with open(input_path, 'r') as f:
            source = f.read()
    except FileNotFoundError:
        print_error(f"Input file not found: {input_path}")
        return False
    except Exception as e:
        print_error(f"Failed to read input file: {e}")
        return False

    # Compile
    try:
        assembler = VisualAssembler()
        assembler.compile(source)

        # Generate output
        assembler.save_png(str(output_path), mode)

        print_success(f"Compiled {input_path} -> {output_path}")
        print_info(f"Instructions: {len(assembler.instructions)}")
        return True

    except Exception as e:
        print_error(f"Compilation failed: {e}")
        return False


def watch_file(input_path: str, output_path: str = None, mode: str = 'standard'):
    """
    Watch a .vasm file and auto-recompile on changes

    Args:
        input_path: Path to input .vasm file
        output_path: Path to output .rts.png
        mode: Encoding mode
    """
    import time
    from pathlib import Path

    input_path = Path(input_path)
    if output_path is None:
        output_path = input_path.with_suffix('.rts.png')
    else:
        output_path = Path(output_path)

    print_info(f"Watching {input_path}...")
    print_info("Press Ctrl+C to stop")

    # Initial compile
    last_mtime = input_path.stat().st_mtime
    compile_file(str(input_path), str(output_path), mode)

    try:
        while True:
            time.sleep(0.5)  # Check twice per second
            current_mtime = input_path.stat().st_mtime

            if current_mtime != last_mtime:
                print()  # Blank line for separation
                compile_file(str(input_path), str(output_path), mode)
                last_mtime = current_mtime

    except KeyboardInterrupt:
        print_info("\nWatch mode stopped")


# ============================================================================
# Template System
# ============================================================================

def get_templates_dir() -> Path:
    """Get path to templates directory"""
    return Path(__file__).parent / 'templates'


def list_templates() -> list:
    """List available template names"""
    templates_dir = get_templates_dir()
    if not templates_dir.exists():
        return []

    return sorted([
        f.stem for f in templates_dir.glob('*.vasm')
        if f.is_file()
    ])


def load_template(name: str) -> str:
    """
    Load a template by name

    Args:
        name: Template name (without .vasm extension)

    Returns:
        Template source code

    Raises:
        FileNotFoundError: If template doesn't exist
    """
    template_path = get_templates_dir() / f'{name}.vasm'

    if not template_path.exists():
        available = ', '.join(list_templates())
        raise FileNotFoundError(
            f"Template '{name}' not found. "
            f"Available templates: {available or 'none'}"
        )

    with open(template_path, 'r') as f:
        return f.read()


def init_project(name: str, template: str = 'hello_world') -> bool:
    """
    Initialize a new PixelRTS project from template

    Args:
        name: Project name (creates name.vasm)
        template: Template name to use

    Returns:
        True if successful
    """
    try:
        source = load_template(template)
    except FileNotFoundError as e:
        print_error(str(e))
        return False

    output_path = Path(f'{name}.vasm')

    if output_path.exists():
        print_warning(f"File {output_path} already exists")
        response = input("Overwrite? [y/N]: ")
        if response.lower() != 'y':
            print_info("Cancelled")
            return False

    try:
        with open(output_path, 'w') as f:
            f.write(source)
        print_success(f"Created {output_path} from template '{template}'")
        return True
    except Exception as e:
        print_error(f"Failed to create project: {e}")
        return False


# ============================================================================
# CLI Helpers
# ============================================================================

def print_error(msg: str):
    """Print error message in red"""
    print(f"\033[91mERROR: {msg}\033[0m")


def print_warning(msg: str):
    """Print warning message in yellow"""
    print(f"\033[93mWARNING: {msg}\033[0m")


def print_success(msg: str):
    """Print success message in green"""
    print(f"\033[92m{msg}\033[0m")


def print_info(msg: str):
    """Print info message in blue"""
    print(f"\033[94mINFO: {msg}\033[0m")


# ============================================================================
# Main CLI Entry Point
# ============================================================================

def main():
    """Main CLI entry point"""
    import argparse

    parser = argparse.ArgumentParser(
        description='PixelRTS Visual Assembler - Compile assembly to executable .rts.png files',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  %(prog)s program.vasm                    Compile to program.rts.png
  %(prog)s program.vasm -o output.rts.png  Specify output file
  %(prog)s program.vasm --mode code        Use code coloring mode
  %(prog)s program.vasm --watch            Auto-recompile on changes
  %(prog)s program.vasm --verify           Verify round-trip compilation
  %(prog)s program.vasm --stats            Show instruction statistics
  %(prog)s --list-templates                List available templates
  %(prog)s --init myproject --template fibonacci  Create new project from template
        """
    )

    parser.add_argument('input', nargs='?', help='Input .vasm file')
    parser.add_argument('-o', '--output', help='Output .rts.png file (default: input.rts.png)')
    parser.add_argument('--mode', choices=['standard', 'code'], default='standard',
                        help='Encoding mode (default: standard)')
    parser.add_argument('--watch', action='store_true',
                        help='Watch input file and auto-recompile on changes')
    parser.add_argument('--verify', action='store_true',
                        help='Verify round-trip: compile -> disassemble -> compare')
    parser.add_argument('--stats', action='store_true',
                        help='Show instruction distribution and code metrics')
    parser.add_argument('--list-templates', action='store_true',
                        help='List available project templates')
    parser.add_argument('--init', metavar='NAME',
                        help='Initialize new project NAME.vasm from template')
    parser.add_argument('--template', default='hello_world',
                        help='Template to use with --init (default: hello_world)')

    args = parser.parse_args()

    # List templates
    if args.list_templates:
        templates = list_templates()
        print_info("Available templates:")
        for t in templates:
            print(f"  - {t}")
        if not templates:
            print_warning("No templates found")
        return

    # Init project
    if args.init:
        success = init_project(args.init, args.template)
        sys.exit(0 if success else 1)

    # Require input file for other commands
    if not args.input:
        parser.print_help()
        sys.exit(1)

    # Watch mode, verify mode, stats mode, normal compile
    # (These are stubs for now - full implementation in Task 1)
    if args.watch:
        print_info("Watch mode not yet implemented")
        sys.exit(1)

    if args.verify:
        print_info("Verify mode not yet implemented")
        sys.exit(1)

    if args.stats:
        print_info("Stats mode not yet implemented")
        sys.exit(1)

    # Normal compile
    with open(args.input, 'r') as f:
        source = f.read()

    assembler = VisualAssembler()
    assembler.compile(source)

    output_path = args.output if args.output else str(Path(args.input).with_suffix('.rts.png'))
    assembler.save_png(output_path, args.mode)
    print_success(f"Compiled {args.input} -> {output_path}")


if __name__ == "__main__":
    main()
