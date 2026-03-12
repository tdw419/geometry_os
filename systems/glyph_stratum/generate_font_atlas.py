#!/usr/bin/env python3
"""
Generate font atlas for GlyphStratum opcodes using GEOS Font System.
Phase 1: Hilbert Curve Spatial Mapping & SDF (Signed Distance Field) Generation.
"""

import sys
import os
import json
import glob
import numpy as np

sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), "../..")))

try:
    from systems.fonts.font_renderer import FontRenderer, find_system_font
except ImportError:
    # Fallback for direct execution
    sys.path.append(os.path.join(os.path.dirname(__file__), "../.."))
    from systems.fonts.font_renderer import FontRenderer, find_system_font

try:
    from scipy.ndimage import distance_transform_edt
    HAS_SCIPY = True
except ImportError:
    HAS_SCIPY = False

def compute_sdf(img_alpha, spread=8.0):
    """
    Compute Signed Distance Field for a single grayscale/alpha image.
    img_alpha: 2D numpy array (0-255)
    spread: The distance in pixels to map to the 0-255 range.
    Returns: 2D numpy array of SDF values (0-255), where 127 is the boundary.
    """
    if not HAS_SCIPY:
        # Fallback if scipy not installed
        return img_alpha
    
    # Binary threshold
    binary = img_alpha > 127
    
    # distance_transform_edt returns Euclidean distance to the background (0)
    # distance inside
    dist_in = distance_transform_edt(binary)
    # distance outside
    dist_out = distance_transform_edt(~binary)
    
    # combine: positive inside, negative outside
    # offset by 0.5 to center on the boundary
    dist = np.where(binary, dist_in - 0.5, -(dist_out - 0.5))
    
    # normalize to 0-255 based on spread
    # 0 -> -spread, 255 -> +spread, 127.5 -> 0
    sdf = 0.5 + (dist / (2.0 * spread))
    sdf = np.clip(sdf, 0.0, 1.0) * 255.0
    
    return sdf.astype(np.uint8)

def d2xy(n, d):
    """
    Convert distance along the Hilbert curve to (x, y) coordinates.
    n: number of cells along one side (must be power of 2)
    d: distance (0 to n*n - 1)
    """
    x = y = 0
    s = 1
    t = d
    while s < n:
        rx = 1 & (t // 2)
        ry = 1 & (t ^ rx)
        if ry == 0:
            if rx == 1:
                x, y = s - 1 - x, s - 1 - y
            x, y = y, x
        x += s * rx
        y += s * ry
        t //= 4
        s *= 2
    return x, y

def generate_opcode_atlas():
    """Generate texture atlas of all GlyphStratum opcodes using Hilbert mapping and SDF"""

    # Initialize font renderer
    renderer = FontRenderer()

    # Try to load a monospace font
    font_path = find_system_font("monospace")
    if not font_path:
        font_path = "/usr/share/fonts/truetype/dejavu/DejaVuSansMono.ttf"
        if not os.path.exists(font_path):
            font_path = "/usr/share/fonts/TTF/DejaVuSansMono.ttf"

    print(f"Loading font: {font_path}")
    try:
        # Render large to get a good SDF
        renderer.load(font_path, size=24)
    except Exception as e:
        print(f"Failed to load font: {e}")
        print("Using default font...")
        fonts = glob.glob("/usr/share/fonts/**/*.ttf", recursive=True)
        if fonts:
            font_path = fonts[0]
            renderer.load(font_path, size=24)
        else:
            raise RuntimeError("No font files found")

    # Define opcodes and their IDs
    opcode_definitions = [
        # ASCII characters 32-126 mapped to 0-94
        *[(chr(i), i - 32) for i in range(32, 127)],
        
        # Core (128-141)
        ("DATA", 128), ("LOAD", 129), ("STORE", 130), ("ALLOC", 131), ("FREE", 132), 
        ("CALL", 133), ("BRANCH", 134), ("LOOP", 135), ("RETURN", 136), ("EXPORT", 137), 
        ("TYPE", 138), ("MODULE", 139), ("NOP", 140), ("HALT", 141),
        
        # Math (142-148)
        ("ADD", 142), ("SUB", 143), ("MUL", 144), ("DIV", 145), ("MOD", 146), ("NEG", 147), ("ABS", 148),
        
        # Compare (150-155)
        ("EQ", 150), ("NE", 151), ("LT", 152), ("LE", 153), ("GT", 154), ("GE", 155),
        
        # Microcode (200-215)
        ("ADD_M", 200), ("SUB_M", 201), ("MUL_M", 202), ("DIV_M", 203),
        ("LD", 204), ("ST", 205), ("MOV", 206), ("CLR", 207),
        ("JMP", 208), ("JZ", 209), ("CALL_M", 210), ("RET_M", 211),
        ("HALT_M", 212), ("SYNC", 213), ("INT", 214), ("DRAW", 215)
    ]

    # Standardize on a power-of-two atlas and fixed cell size
    # 16x16 cells = 256 slots
    # With size=48, we need larger cells for SDF padding
    # Let's use cell_size = 128
    atlas_width = 2048
    atlas_height = 2048
    cell_size = 128
    n = atlas_width // cell_size  # 16 cells per side (n=16, order=4)
    
    atlas_data = bytearray(atlas_width * atlas_height * 4)  # RGBA
    atlas_data[:] = b"\x00" * len(atlas_data)  # Transparent black

    positions = {}  # opcode -> (x, y, width, height)

    # Spread for SDF
    SDF_SPREAD = 8.0

    for opcode_name, opcode_id in opcode_definitions:
        if opcode_id >= n*n:
            print(f"Warning: opcode_id {opcode_id} out of bounds for {n}x{n} grid.")
            continue
            
        # Calculate cell coordinates using Hilbert curve
        cell_x, cell_y = d2xy(n, opcode_id)
        
        # Calculate pixel coordinates
        base_x = cell_x * cell_size
        base_y = cell_y * cell_size

        # Render the opcode text
        if not renderer.is_loaded:
             continue
        res = renderer.render_text(opcode_name)
        if not res:
            print(f"Warning: Failed to render '{opcode_name}'")
            continue
        pixels, width, height = res
        if width == 0 or height == 0:
            print(f"Warning: Empty glyph for '{opcode_name}'")
            continue

        # Extract Alpha channel as 2D numpy array
        alpha = np.frombuffer(pixels, dtype=np.uint8).reshape((height, width, 4))[:,:,3]
        
        # Compute SDF
        sdf = compute_sdf(alpha, spread=SDF_SPREAD)
        
        # Center the glyph within the cell
        off_x = (cell_size - width) // 2
        off_y = (cell_size - height) // 2
        
        # Check bounds
        if off_x < 0 or off_y < 0:
            print(f"Warning: Glyph '{opcode_name}' ({width}x{height}) is too large for cell_size {cell_size}")
            continue

        # Copy SDF glyph to atlas
        # For compatibility with msdf shader, copy SDF to R, G, B channels
        for row in range(height):
            for col in range(width):
                sdf_val = sdf[row, col]
                dst_x = base_x + off_x + col
                dst_y = base_y + off_y + row
                if 0 <= dst_x < atlas_width and 0 <= dst_y < atlas_height:
                    dst_idx = (dst_y * atlas_width + dst_x) * 4
                    atlas_data[dst_idx] = sdf_val      # R
                    atlas_data[dst_idx + 1] = sdf_val  # G
                    atlas_data[dst_idx + 2] = sdf_val  # B
                    atlas_data[dst_idx + 3] = sdf_val  # A

        positions[opcode_name] = (base_x + off_x, base_y + off_y, width, height)
        print(f"Rendered SDF '{opcode_name}' (ID {opcode_id}) at cell ({cell_x}, {cell_y}) -> ({base_x + off_x}, {base_y + off_y})")

    # Save atlas as raw RGBA data
    atlas_path = os.path.join(os.path.dirname(__file__), "opcode_atlas.raw")
    with open(atlas_path, "wb") as f:
        f.write(atlas_data)

    # Save positions as JSON
    # Include metadata about atlas dimensions
    positions_meta = {
        "metadata": {
            "width": atlas_width,
            "height": atlas_height,
            "cell_size": cell_size,
            "sdf_spread": SDF_SPREAD,
            "hilbert": True,
            "sdf": True
        },
        "glyphs": positions
    }
    
    positions_path = os.path.join(os.path.dirname(__file__), "opcode_positions.json")
    with open(positions_path, "w") as f:
        json.dump(positions_meta, f, indent=2)

    # Also create a preview image (PPM format)
    preview_path = os.path.join(os.path.dirname(__file__), "opcode_atlas.ppm")
    with open(preview_path, "wb") as f:
        f.write(b"P6\n")
        f.write(f"{atlas_width} {atlas_height}\n".encode())
        f.write(b"255\n")
        # Convert RGBA to RGB
        rgb_data = bytearray()
        for i in range(0, len(atlas_data), 4):
            rgb_data.extend(atlas_data[i : i + 3])
        f.write(rgb_data)

    # Also create a WebP version for web loading
    try:
        from PIL import Image
        webp_path = os.path.join(os.path.dirname(__file__), "opcode_atlas.webp")
        img = Image.frombytes('RGBA', (atlas_width, atlas_height), bytes(atlas_data))
        img.save(webp_path, 'WEBP', lossless=True)
        print(f"WebP atlas saved: {webp_path}")
    except ImportError:
        print("Warning: Pillow not found, skipping WebP export.")

    print(f"\nGenerated Hilbert SDF atlas:")
    print(f"  - Atlas: {atlas_path} ({atlas_width}x{atlas_height})")
    print(f"  - Cells: {n}x{n} (total {n*n} slots)")
    print(f"  - Preview: {preview_path}")
    print(f"  - WebP: {webp_path if 'webp_path' in locals() else 'skipped'}")

if __name__ == "__main__":
    generate_opcode_atlas()