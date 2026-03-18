#!/usr/bin/env python3
"""
Spatial ASCII Compiler for Geometry OS

Converts human-readable ASCII templates into GPU-native Glyph programs.
Enables "Pixels Move Pixels" by compiling UI directly to spatial substrate.

Usage: python3 systems/glyph_stratum/geos_ascii_compiler.py <input.ascii> <output.rts.png>
"""

import sys
import re
from pathlib import Path

try:
    from PIL import Image
    import numpy as np
except ImportError:
    print("Install: pip install Pillow numpy")
    sys.exit(1)

# Constants matching AsciiCartridge format
GLYPH_WIDTH = 80
GLYPH_HEIGHT = 24
SIT_ENTRIES = 256
STATE_BUFFER_SIZE = 1024
BOOTSTRAP_HEIGHT = 16

# Memory layout
VRAM_BASE = 0x8000
SIT_BASE = VRAM_BASE + (GLYPH_WIDTH * GLYPH_HEIGHT)
STATE_BASE = SIT_BASE + (SIT_ENTRIES * GLYPH_WIDTH)
BOOTSTRAP_BASE = STATE_BASE + (STATE_BUFFER_SIZE * GLYPH_WIDTH)


class AsciiParser:
    """Parses ASCII templates into structured components"""

    def __init__(self, content: str):
        self.content = content
        self.lines = content.split("\n")
        self.grid = self._build_grid()
        self.buttons = self._find_buttons()
        self.variables = self._find_variables()
        self.iterators = self._find_iterators()

    def _build_grid(self):
        """Build 80x24 grid from ASCII content"""
        grid = []
        for y in range(GLYPH_HEIGHT):
            if y < len(self.lines):
                line = self.lines[y].rstrip("\n\r")
                # Pad to 80 chars
                line = line.ljust(GLYPH_WIDTH)
                row = list(line[:GLYPH_WIDTH])
            else:
                row = [" "] * GLYPH_WIDTH
            grid.append(row)
        return grid

    def _find_buttons(self):
        """Find all button patterns like [A], [Quit], etc."""
        buttons = []
        for y, row in enumerate(self.grid):
            x = 0
            while x < GLYPH_WIDTH - 2:
                if row[x] == "[" and x + 2 < GLYPH_WIDTH and row[x + 2] == "]":
                    label = row[x + 1]
                    buttons.append({"x": x, "y": y, "label": label, "text": f"[{label}]"})
                    x += 3
                else:
                    x += 1
        return buttons

    def _find_variables(self):
        """Find all variable placeholders like {{var_name}}"""
        variables = []
        var_pattern = re.compile(r"\{\{(\w+)\}\}")

        for y, row in enumerate(self.grid):
            line = "".join(row)
            for match in var_pattern.finditer(line):
                var_name = match.group(1)
                variables.append(
                    {"x": match.start(), "y": y, "name": var_name, "placeholder": match.group(0)}
                )
        return variables

    def _find_iterators(self):
        """Find all iterator blocks like {{#each items}} ... {{/each}}"""
        iterators = []
        each_pattern = re.compile(r"\{\{#each\s+(\w+)\}\}")
        end_pattern = re.compile(r"\{\{/each\}\}")

        for y, row in enumerate(self.grid):
            line = "".join(row)
            match = each_pattern.search(line)
            if match:
                var_name = match.group(1)
                iterators.append(
                    {"x": match.start(), "y": y, "name": var_name, "placeholder": match.group(0)}
                )
        return iterators


class GlyphAssemblyGenerator:
    """Generates Glyph VM assembly from ASCII components"""

    def __init__(self, parser: AsciiParser):
        self.parser = parser
        self.assembly = []
        self.pc = 0
        self.sit = {}

    def _emit(self, opcode, *args):
        """Emit a single instruction"""
        args_str = " ".join(str(a) for a in args)
        if args_str:
            self.assembly.append(f"{opcode} {args_str}")
        else:
            self.assembly.append(opcode)
        self.pc += 1
        return self.pc - 1

    def generate_bootstrap(self):
        """Generate bootstrap code that loads and renders the ASCII grid"""
        self.assembly.append("; === BOOTSTRAP: Load ASCII Grid ===")
        self._emit("NOP")  # Entry point

        # Load grid base address
        self._emit("LDI", "r0", VRAM_BASE)

        # Render grid (simplified: just copy from prepared buffer)
        self._emit("LDI", "r1", GLYPH_WIDTH * GLYPH_HEIGHT)
        self._emit("LDI", "r2", 0)

        # Copy loop
        copy_loop = self.pc
        self._emit("LOAD", "r3", "[r0+r2]")  # Load char
        self._emit("DRAW", "r3", "r2", "SCREEN_BASE")  # Draw char
        self._emit("ADD", "r2", "1")
        self._emit("CMP", "r2", "r1")
        self._emit("JZ", copy_loop)

        # Initialize SIT
        self.assembly.append("; === INITIALIZING SIT ===")
        self._emit("LDI", "r0", SIT_BASE)

        # Event loop
        self.assembly.append("; === EVENT LOOP ===")
        event_loop = self.pc
        self._emit("LD", "r1", "MOUSE_X")
        self._emit("LD", "r2", "MOUSE_Y")
        self._emit("CALL", "handle_click")
        self._emit("JMP", event_loop)

        return self.assembly

    def generate_sit(self):
        """Generate Spatial Instruction Table entries"""
        sit_data = []

        for button in self.parser.buttons:
            x, y = button["x"], button["y"]
            label = button["label"]

            # SIT entry format: x, y, opcode, target
            # Map to Hilbert address for SIT lookup
            sit_idx = y * GLYPH_WIDTH + x

            # For now, use JUMP (209) to handler
            sit_data.append(
                {
                    "idx": sit_idx,
                    "x": x,
                    "y": y,
                    "opcode": 209,  # JUMP
                    "target": f"handle_{label}",
                }
            )

        return sit_data

    def generate_handlers(self):
        """Generate button click handlers"""
        handlers = []
        seen_labels = set()

        for button in self.parser.buttons:
            label = button["label"]
            if label in seen_labels:
                continue
            seen_labels.add(label)

            handlers.append(f"; === Handler for [{label}] ===")
            handlers.append(f":handle_{label}")
            handlers.append("LDI r0, 1")
            handlers.append("ST r0, BUTTON_PRESSED")
            handlers.append("RET")

        return "\n".join(handlers)


def compile_ascii_to_glyphs(input_path: str, output_path: str):
    """Main compilation pipeline"""
    print(f"Compiling {input_path} to {output_path}")

    # Step 1: Parse ASCII template
    content = Path(input_path).read_text()
    parser = AsciiParser(content)

    print(f"Found {len(parser.buttons)} buttons")
    print(f"Found {len(parser.variables)} variables")
    print(f"Found {len(parser.iterators)} iterators")

    # Step 2: Generate Glyph assembly
    generator = GlyphAssemblyGenerator(parser)
    assembly = generator.generate_bootstrap()
    handlers = generator.generate_handlers()

    # Combine assembly
    full_assembly = "\n".join(assembly) + "\n\n" + handlers

    # Save intermediate assembly for debugging
    asm_path = output_path.replace(".rts.png", ".geoasm")
    Path(asm_path).write_text(full_assembly)
    print(f"Saved intermediate assembly to {asm_path}")

    # Step 3: Generate SIT data
    sit_data = generator.generate_sit()

    # Step 4: Pack into PNG cartridge
    pack_cartridge(parser, sit_data, output_path)

    print(f"Successfully compiled to {output_path}")


def pack_cartridge(parser, sit_data, output_path):
    """Pack ASCII grid, SIT, and state buffer into PNG cartridge"""
    # Calculate total height
    total_height = GLYPH_HEIGHT + SIT_ENTRIES + STATE_BUFFER_SIZE + BOOTSTRAP_HEIGHT
    width = GLYPH_WIDTH

    # Create image
    img = Image.new("RGBA", (width, total_height))
    pixels = np.array(img)

    # Segment 1: Glyph Grid (ASCII characters as RGBA)
    for y in range(GLYPH_HEIGHT):
        for x in range(GLYPH_WIDTH):
            char = parser.grid[y][x]
            # Map char to grayscale value (ASCII code)
            val = ord(char) & 0xFF
            pixels[y, x] = [val, 0, 0, 255]

    # Segment 2: SIT (Spatial Instruction Table)
    sit_base_y = GLYPH_HEIGHT
    for entry in sit_data:
        idx = entry["idx"]
        y = sit_base_y + (idx // GLYPH_WIDTH)
        x = idx % GLYPH_WIDTH

        # Encode SIT entry: R=opcode, G=p1, B=p2
        # For now, simple encoding
        pixels[y, x] = [entry["opcode"], entry["x"], entry["y"], 255]

    # Segment 3: State Buffer (initially zeros)
    state_base_y = GLYPH_HEIGHT + SIT_ENTRIES
    # Already initialized to zeros by Image.new()

    # Segment 4: Bootstrap Header
    bootstrap_base_y = GLYPH_HEIGHT + SIT_ENTRIES + STATE_BUFFER_SIZE

    # Write magic header
    magic = b"GEOS-ASCII-v1"
    for i, byte in enumerate(magic):
        pixels[bootstrap_base_y, i] = [byte, 0, 0, 255]

    # Write pattern count
    pixels[bootstrap_base_y + 1, 0] = [len(parser.buttons), 0, 0, 255]

    # Save PNG
    Image.fromarray(pixels.astype(np.uint8)).save(output_path)


if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: python3 geos_ascii_compiler.py <input.ascii> <output.rts.png>")
        sys.exit(1)

    compile_ascii_to_glyphs(sys.argv[1], sys.argv[2])
