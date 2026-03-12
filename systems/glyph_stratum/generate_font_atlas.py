#!/usr/bin/env python3
"""
Generate font atlas for GlyphStratum opcodes using GEOS Font System
"""

import sys
import os
import json

sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), "../..")))

from systems.fonts.font_renderer import FontRenderer, find_system_font


def generate_opcode_atlas():
    """Generate texture atlas of all GlyphStratum opcodes"""

    # Initialize font renderer
    renderer = FontRenderer()

    # Try to load a monospace font
    font_path = find_system_font("monospace")
    if not font_path:
        # Fallback to common font locations
        font_path = "/usr/share/fonts/truetype/dejavu/DejaVuSansMono.ttf"
        if not os.path.exists(font_path):
            font_path = "/usr/share/fonts/TTF/DejaVuSansMono.ttf"

    print(f"Loading font: {font_path}")
    try:
        renderer.load(font_path, size=24)
    except Exception as e:
        print(f"Failed to load font: {e}")
        print("Using default font...")
        # Try to find any TTF font
        import glob

        fonts = glob.glob("/usr/share/fonts/**/*.ttf", recursive=True)
        if fonts:
            font_path = fonts[0]
            renderer.load(font_path, size=24)
        else:
            raise RuntimeError("No font files found")

    # GlyphStratum opcodes
    core_opcodes = [
        "DATA", "LOAD", "STORE", "ALLOC", "FREE", "CALL", "BRANCH",
        "LOOP", "RETURN", "EXPORT", "TYPE", "MODULE", "NOP", "HALT",
    ]
    
    math_opcodes = ["ADD", "SUB", "MUL", "DIV", "MOD", "NEG", "ABS"]
    compare_opcodes = ["EQ", "NE", "LT", "LE", "GT", "GE"]
    string_opcodes = ["CONCAT", "LEN", "SUBSTR"]
    array_opcodes = ["PUSH", "POP", "ARRAYLEN", "GET", "SET"]

    # Microcode opcodes (200-215 range)
    micro_opcodes = [
        "ADD_M", "SUB_M", "MUL_M", "DIV_M",  # 200-203
        "LD", "ST", "MOV", "CLR",            # 204-207
        "JMP", "JZ", "CALL_M", "RET_M",      # 208-211
        "HALT_M", "SYNC", "INT", "DRAW"      # 212-215
    ]
    
    opcodes = core_opcodes + math_opcodes + compare_opcodes + string_opcodes + array_opcodes + micro_opcodes

    # Create atlas
    atlas_width = 512
    atlas_height = 512
    padding = 4

    # We'll create a simple horizontal strip for now
    glyph_width = 64
    glyph_height = 64
    max_per_row = (atlas_width - padding) // (glyph_width + padding)

    atlas_data = bytearray(atlas_width * atlas_height * 4)  # RGBA
    atlas_data[:] = b"\x00" * len(atlas_data)  # Transparent black

    positions = {}  # opcode -> (x, y, width, height)

    x = padding
    y = padding
    row_height = 0

    for opcode in opcodes:
        # Render the opcode text
        pixels, width, height = renderer.render_text(opcode)

        if width == 0 or height == 0:
            print(f"Warning: Failed to render '{opcode}'")
            continue

        # Check if we need to wrap to next row
        if x + width + padding > atlas_width:
            x = padding
            y += row_height + padding
            row_height = 0

        # Check if we exceed atlas height
        if y + height + padding > atlas_height:
            print(f"Warning: Atlas full, skipping {opcode}")
            break

        # Copy glyph to atlas (convert grayscale to RGBA)
        # The renderer already returns RGBA, so we can copy directly
        for row in range(height):
            for col in range(width):
                src_idx = (row * width + col) * 4
                dst_x = x + col
                dst_y = y + row
                if 0 <= dst_x < atlas_width and 0 <= dst_y < atlas_height:
                    dst_idx = (dst_y * atlas_width + dst_x) * 4
                    # Copy RGBA
                    atlas_data[dst_idx : dst_idx + 4] = pixels[src_idx : src_idx + 4]

        positions[opcode] = (x, y, width, height)
        print(f"Rendered '{opcode}' at ({x}, {y}) size {width}x{height}")

        x += width + padding
        row_height = max(row_height, height)

    # Save atlas as raw RGBA data
    atlas_path = os.path.join(os.path.dirname(__file__), "opcode_atlas.raw")
    with open(atlas_path, "wb") as f:
        f.write(atlas_data)

    # Save positions as JSON
    positions_path = os.path.join(os.path.dirname(__file__), "opcode_positions.json")
    with open(positions_path, "w") as f:
        json.dump(positions, f, indent=2)

    print(f"\nGenerated atlas:")
    print(f"  - Atlas: {atlas_path} ({atlas_width}x{atlas_height})")
    print(f"  - Positions: {positions_path}")
    print(f"  - Font: {font_path}")

    # Also create a simple preview image (PPM format for easy viewing)
    preview_path = os.path.join(os.path.dirname(__file__), "opcode_atlas.ppm")
    with open(preview_path, "wb") as f:
        f.write(b"P6\n")
        f.write(f"{atlas_width} {atlas_height}\n".encode())
        f.write(b"255\n")
        # Convert RGBA to RGB (drop alpha)
        rgb_data = bytearray()
        for i in range(0, len(atlas_data), 4):
            rgb_data.extend(atlas_data[i : i + 3])  # R, G, B
        f.write(rgb_data)

    print(f"  - Preview: {preview_path} (PPM format)")


if __name__ == "__main__":
    generate_opcode_atlas()
