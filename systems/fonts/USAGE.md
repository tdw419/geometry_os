# GEOS Font System - Usage Guide

## Quick Start

```bash
# Check status
python3 systems/fonts/cli.py status

# Load a font
python3 systems/fonts/cli.py load --name=monospace

# Render text
python3 systems/fonts/cli.py render "Hello World"

# List available fonts
python3 systems/fonts/cli.py list-fonts
```

## Python API

```python
from systems.fonts import FontRenderer, find_system_font

# Create renderer
renderer = FontRenderer()

# Find and load a system font
font_path = find_system_font("monospace")
renderer.load(font_path, size=14)

# Render text to RGBA pixels
pixels, width, height = renderer.render_text("Hello World")

# Get text metrics without rendering
metrics = renderer.get_text_metrics("Hello World")
print(f"Size: {metrics.width}x{metrics.height}")

# Check if character exists
if renderer.has_glyph("日"):
    print("Font supports CJK")

# Get renderer status
status = renderer.get_status()
print(f"Cache hit rate: {status['cache_hit_rate']}%")
```

## CLI Commands

### status

Show current font renderer status.

```bash
geos-font status
geos-font status --json
```

Output:
```
==================================================
GEOS FONT RENDERER STATUS
==================================================

Font:      DejaVu Sans Mono (Book)
Path:      /usr/share/fonts/truetype/dejavu/DejaVuSansMono.ttf
Size:      14px

Cache:     95/1024 glyphs
Hit rate:  87.5%
Renders:   42
```

### load

Load a font file.

```bash
# Load by path
geos-font load /usr/share/fonts/truetype/dejavu/DejaVuSansMono.ttf

# Load by name pattern
geos-font load --name=monospace
geos-font load --name="DejaVu"

# Specify size
geos-font load --name=monospace --size=16

# JSON output
geos-font load --name=monospace --json
```

### render

Render text to RGBA pixels.

```bash
# Simple render
geos-font render "Hello World"

# With JSON output
geos-font render "Hello World" --json

# Save to file (raw RGBA)
geos-font render "Hello World" --output=hello.rgba

# Specify font and size
geos-font render "Test" --font=monospace --size=20
```

JSON output:
```json
{
  "text": "Hello World",
  "width": 119,
  "height": 16,
  "bytes": 7616,
  "format": "rgba8"
}
```

### list-fonts

List available system fonts.

```bash
geos-font list-fonts
geos-font list-fonts --json
```

### metrics

Get text dimensions without rendering.

```bash
geos-font metrics "Hello World"
geos-font metrics "Hello World" --json
```

### clear-cache

Clear glyph cache.

```bash
geos-font clear-cache
geos-font clear-cache --json
```

## Agent Integration

All commands support `--json` for machine-readable output:

```bash
# Pipeline example
geos-font load --name=monospace --json | jq '.family_name'
geos-font render "Test" --json | jq '.width'
```

## Performance Tips

1. **Reuse renderer** - Create once, render many times
2. **Cache hits** - Repeated characters use cached glyphs
3. **Pre-render atlases** - For GPU upload, render common characters once

## Error Handling

```python
try:
    renderer.load("/path/to/font.ttf", size=14)
except FileNotFoundError:
    print("Font file not found")
except RuntimeError as e:
    print(f"Failed to load font: {e}")
```

## RGBA Format

Rendered pixels are in RGBA format:
- 4 bytes per pixel (R, G, B, A)
- Alpha channel contains glyph intensity (0-255)
- RGB channels are white (255, 255, 255) for text

To convert to PNG:
```python
from PIL import Image

pixels, width, height = renderer.render_text("Hello")
img = Image.frombytes("RGBA", (width, height), pixels)
img.save("hello.png")
```

## System Requirements

- Python 3.8+
- freetype-py (`pip install freetype-py`)
- System fonts (TTF/OTF files)
