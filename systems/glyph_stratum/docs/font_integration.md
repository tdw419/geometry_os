# GlyphStratum GEOS Font Integration

This document describes the implementation of the GEOS Font System integration into the GlyphStratum editor.

## Objective

Enhance the GlyphStratum visual editor by replacing browser-based text rendering with opcodes rendered using Geometry OS's native font system. This ensures visual consistency across the OS and demonstrates the portability of GEOS font assets.

## Architecture

The integration follows a "Pre-render → Atlas → Canvas" pipeline:

1.  **Atlas Generation (`generate_font_atlas.py`)**: 
    - Uses `systems.fonts.font_renderer.FontRenderer` (FreeType-based) to render all 14 GlyphStratum opcodes.
    - Packs these rendered glyphs into a 512x512 RGBA texture atlas (`opcode_atlas.raw`).
    - Records the UV coordinates (x, y, width, height) for each opcode in `opcode_positions.json`.
2.  **Web Integration (`glyph_editor.html`)**:
    - Fetches the raw RGBA atlas data using the `fetch` API.
    - Reconstructs the image in the browser using a temporary HTML5 Canvas and `putImageData`.
    - Uses D3.js to render SVG `<image>` elements inside glyph nodes, sampling from the font atlas.
    - Provides a graceful fallback to standard text rendering if the atlas fails to load.

## Key Components

### 1. Font Atlas Generator
- **Source**: `systems/glyph_stratum/generate_font_atlas.py`
- **Output**: 
  - `opcode_atlas.raw`: Raw 32-bit RGBA binary data.
  - `opcode_positions.json`: Metadata for coordinate mapping.
  - `opcode_atlas.ppm`: Visual preview for debugging.

### 2. Editor Integration
- **Mechanism**: The editor loads the binary `.raw` file into a `Uint8Array`, uploads it to a `CanvasRenderingContext2D`, and uses the canvas as an image source for SVG.
- **Opcode Centering**: Opcodes are centered within the 25px radius glyph circles by adjusting the `x` and `y` attributes of the SVG `<image>` element based on the rendered glyph dimensions.

## Opcodes Supported

All standard GlyphStratum opcodes are included in the atlas:
`DATA`, `LOAD`, `STORE`, `ALLOC`, `FREE`, `CALL`, `BRANCH`, `LOOP`, `RETURN`, `EXPORT`, `TYPE`, `MODULE`, `NOP`, `HALT`.

## Verification & Testing

To verify the integration:
1. Run the atlas generator: `python3 systems/glyph_stratum/generate_font_atlas.py`
2. Start a local server: `cd systems/glyph_stratum && python3 -m http.server 8000`
3. Access `http://localhost:8000/glyph_editor.html` and verify that glyph nodes display rendered text instead of standard browser fonts.
4. Check the browser console for any "Failed to load font atlas" errors.
