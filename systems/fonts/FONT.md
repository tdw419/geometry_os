# Phase 1-2: Font Rendering Component

## Phase 1: Requirement Analysis

### Capability Gap
The OS cannot display text. Without fonts:
- No terminal output
- No UI labels
- No command feedback
- No self-documenting interfaces

### Dependencies
- ✅ Layer 0: Substrate (PixelRTS) — can encode/decode pixels
- ✅ Layer 1: Visual Shell — can render textures
- ❌ Layer 3: Fonts — **THIS COMPONENT**

### Success Metrics
| Metric | Target | Verification |
|--------|--------|-------------|
| Font loading | <10ms per font | Timing benchmark |
| Glyph rendering | <1ms per glyph | Timing benchmark |
| Atlas generation | <100ms for 256 glyphs | Timing benchmark |
| Memory | <5MB per font | RSS measurement |
| Output | Valid RGBA pixels | Check non-zero alpha channel |

### Real Software Integration
Following CLI-Anything's "use the real software" principle:
- **FreeType** for font parsing and glyph rendering
- **fontconfig** for font discovery
- **Real font files** (TTF, OTF), not synthetic data

---

## Phase 2: Architecture Design

### Interface Definition

#### CLI Commands
```bash
geos-font status                    # Show loaded fonts
geos-font load <path>               # Load font file
geos-font render "Hello" --font=mono --size=14  # Render text
geos-font atlas --font=mono --size=14           # Generate glyph atlas
geos-font list                      # List available system fonts
```

#### JSON API
```json
{
  "action": "render",
  "text": "Hello",
  "font": "monospace",
  "size": 14,
  "output": "rgba"
}
```

#### State File (.geometry/font_state.json)
```json
{
  "loaded_fonts": {
    "monospace": {
      "path": "/usr/share/fonts/truetype/dejavu/DejaVuSansMono.ttf",
      "size": 14,
      "glyphs_cached": 95,
      "atlas_texture": "font_atlas_mono.png"
    }
  },
  "metrics": {
    "render_time_ms": 0.42,
    "cache_hits": 1523,
    "cache_misses": 12
  }
}
```

### Command Groups
```
geos-font
├── status      # Current font state
├── load        # Load a font file
├── unload      # Unload a font
├── render      # Render text to pixels
├── atlas       # Generate glyph atlas
├── list        # List available fonts
└── debug       # Introspection
```

### State Model
- **Persistent**: .geometry/font_state.json, .geometry/font_cache/
- **Ephemeral**: FreeType face objects in memory, GPU textures
- **Serialization**: JSON for state, PNG for atlas textures

### Output Formats
- **Human**: Tables with font names, sizes, cache stats
- **Agent**: `--json` flag on every command

### Module Structure
```
systems/fonts/
├── __init__.py
├── font_renderer.py      # FreeType wrapper
├── font_atlas.py         # Glyph atlas generator
├── font_cache.py         # LRU cache for glyphs
├── font_discovery.py     # fontconfig integration
├── cli.py                # geos-font CLI
├── state.py              # State management
└── tests/
    ├── test_font_renderer.py
    ├── test_font_atlas.py
    └── test_font_cli.py
```

---

## Phase 4: Test Planning (TEST.md)

### Test Inventory Plan
- `test_font_renderer.py`: 15 unit tests
- `test_font_atlas.py`: 10 unit tests
- `test_font_cli.py`: 12 CLI tests
- `test_font_e2e.py`: 8 E2E tests
- **Total**: 45 tests

### Unit Test Plan

#### font_renderer.py (15 tests)
- `test_load_ttf_font` — Load real TTF file
- `test_load_otf_font` — Load real OTF file
- `test_invalid_font_path` — Error handling
- `test_get_glyph_metrics` — Return width, height, advance
- `test_render_single_glyph` — Render 'A' to pixels
- `test_render_glyph_out_of_range` — Handle Unicode beyond BMP
- `test_set_font_size` — Change size, verify metrics change
- `test_get_kerning` — Kerning between 'A' and 'V'
- `test_render_text_simple` — "Hello" returns RGBA array
- `test_render_text_unicode` — "日本語" renders correctly
- `test_render_text_empty` — Empty string returns empty
- `test_render_text_newlines` — Multiline text
- `test_text_bounding_box` — Calculate text dimensions
- `test_font_has_glyph` — Check if glyph exists
- `test_font_properties` — Family name, style, etc.

#### font_atlas.py (10 tests)
- `test_create_atlas_empty` — Empty atlas has correct structure
- `test_add_glyph_to_atlas` — Add single glyph
- `test_atlas_grows_dynamically` — Auto-expand when full
- `test_get_glyph_uv_coords` — Return correct UV coordinates
- `test_atlas_serialization` — Save/load to PNG
- `test_atlas_metadata` — Glyph metrics stored correctly
- `test_multiple_fonts_same_atlas` — Pack multiple fonts
- `test_atlas_power_of_two` — Dimensions are power of 2
- `test_atlas_padding` — Glyphs don't bleed
- `test_atlas_clear` — Reset atlas

#### font_cache.py (8 tests)
- `test_cache_miss` — First access is miss
- `test_cache_hit` — Second access is hit
- `test_cache_eviction` — LRU eviction works
- `test_cache_size_limit` — Respect max size
- `test_cache_clear` — Clear all entries
- `test_cache_stats` — Hit/miss ratio
- `test_cache_key_generation` — Consistent keys
- `test_cache_thread_safety` — Concurrent access

### E2E Test Plan

#### Real Workflow Scenarios

**Workflow 1: Terminal Character Rendering**
- Simulates: Terminal displaying shell output
- Operations:
  1. Load monospace font
  2. Generate atlas for ASCII range
  3. Render "user@host:~$ " prompt
  4. Render "ls -la" output
- Verified:
  - All characters render
  - No missing glyphs
  - Correct spacing (monospace)
  - Atlas texture has non-zero pixels

**Workflow 2: Unicode Text Display**
- Simulates: Internationalization support
- Operations:
  1. Load font with Unicode support
  2. Render Japanese, Chinese, Arabic text
  3. Verify glyph coverage
- Verified:
  - CJK characters render
  - RTL handling (if implemented)
  - No tofu (missing glyph boxes)

**Workflow 3: Font Atlas Generation**
- Simulates: Pre-rendering for GPU upload
- Operations:
  1. Load font
  2. Generate atlas for ASCII + common symbols
  3. Save to PNG
  4. Load PNG and verify structure
- Verified:
  - PNG magic bytes
  - Atlas dimensions power of 2
  - UV coordinates valid (0-1 range)
  - Metadata JSON exists

**Workflow 4: CLI Integration**
- Simulates: Agent using geos-font command
- Operations:
  1. `geos-font load /path/to/font.ttf`
  2. `geos-font render "Hello" --json`
  3. `geos-font status --json`
- Verified:
  - JSON output is valid
  - Status shows loaded font
  - Render returns RGBA array

---

## Dependencies

### Python Packages
```
freetype-py>=2.3.0    # FreeType bindings
Pillow>=10.0.0        # Image handling
click>=8.0.0          # CLI framework
```

### System Dependencies
```bash
# Ubuntu/Debian
sudo apt install libfreetype6 fontconfig

# macOS
brew install freetype fontconfig
```

---

## Implementation Priority

1. **font_renderer.py** — Core FreeType wrapper
2. **font_cache.py** — LRU caching for performance
3. **font_atlas.py** — GPU-ready texture generation
4. **cli.py** — Agent-controllable interface
5. **font_discovery.py** — System font finding
6. **state.py** — Persistence layer

---

## Next Steps

After this component:
1. **terminal_emulator** — Uses fonts to display shell output
2. **geos_cli** — Provides `ls`, `cat`, `cd` commands
3. **compositor integration** — Display fonts on infinite map

---

*Phase 1-2 complete. Ready for Phase 3: Implementation*
