# GlyphStratum User Guide

## Getting Started

GlyphStratum is an AI-native visual programming language that represents programs as structured graphs across 5 hierarchical layers (strata). This guide will help you get up and running quickly.

## Quick Start

### 1. Open the Visual Editor

```bash
cd systems/glyph_stratum
python3 -m http.server 8000
```

Then open your browser to:
- http://localhost:8000/glyph_editor.html

### 2. Create Your First Program

1. **Double-click** on canvas to add a glyph
2. Use the properties panel to change stratum/opcode
3. **Right-click** on one glyph, then **left-click** in another to add a dependency
4. Click **Validate** to check coherence

### 3. Try a Sample

Click **Load Sample** button and select a program like "add_two_numbers" to see a complete example.

## Core Concepts

### The 5 Strata

| Stratum | Level | Purpose |
|---------|-------|---------|
| SUBSTRATE | 0 | Raw data, literals, constants |
| MEMORY | 1 | Variables, storage, parameters |
| LOGIC | 2 | Operations, control flow, calls |
| SPEC | 3 | Interfaces, types, exports |
| INTENT | 4 | Goals, modules, entry points |

### Coherence Rule

**Dependencies must point downward** (from higher to lower strata).

```
INTENT (4) → depends on → SPEC (3) → depends on → LOGIC (2) → depends on → MEMORY (1) → depends on → SUBSTRATE (0)
```

Valid: INTENT → LOGIC ✓
Invalid: LOGIC → INTENT ✗

### Opcodes

| Opcode | Description |
|--------|-------------|
| DATA | Raw data value |
| LOAD | Load from memory |
| STORE | Store to memory |
| ALLOC | Allocate memory |
| CALL | Function call |
| BRANCH | Conditional branch |
| LOOP | Iteration |
| RETURN | Return value |
| EXPORT | Export interface |
| MODULE | Module definition |

## Visual Editor

### Controls

| Action | Input |
|--------|-------|
| Add glyph | Double-click canvas |
| Delete glyph | Select + Delete button |
| Add dependency | Right-click source → left-click target |
| Deselect | Click empty canvas |
| Undo | Ctrl+Z |
| Redo | Ctrl+Y |
| Auto-layout | Click Layout button |

### Layout Algorithms

1. **Layered** - Organize by stratum (default)
2. **Tree** - Organize by dependency depth
3. **Force-directed** - Spring simulation
4. **Radial** - Circular arrangement

## CLI Reference

```bash
# Create new program
python3 glyph_cli.py new my_program

# Validate
python3 glyph_cli.py validate program.json

# Get info
python3 glyph_cli.py info program.json -v

# Export to DOT
python3 glyph_cli.py export program.json dot -o graph.dot

# Export to Mermaid
python3 glyph_cli.py export program.json mermaid -o graph.mmd

# Profile performance
python3 glyph_cli.py profile program.json

# List samples
python3 glyph_cli.py samples

# Generate from description
python3 glyph_cli.py generate multiply "multiply two numbers"
```

## Python Parser

Convert Python code to GlyphStratum:

```bash
# Parse file
python3 python_parser.py my_script.py -o output.json

# Parse code string
python3 python_parser.py -c "def add(a, b): return a + b"

# With verbose output
python3 python_parser.py my_script.py -v
```

### Python → Glyph Mapping

| Python | Glyph |
|--------|-------|
| Literals | SUBSTRATE/DATA |
| Variables | MEMORY/LOAD or STORE |
| Parameters | MEMORY/LOAD |
| Operators | LOGIC/CALL |
| If/else | LOGIC/BRANCH |
| For/while | LOGIC/LOOP |
| return | LOGIC/RETURN |
| def | SPEC/EXPORT |
| class | SPEC/TYPE |

## API Usage

```python
from glyph_api import GlyphBuilder, build_program

# Build program fluently
program = (build_program("multiply")
    .substrate("a", 7, "First operand")
    .substrate("b", 6, "Second operand")
    .memory("load_a", ["a"], "Load a")
    .memory("load_b", ["b"], "Load b")
    .logic("multiply", ["load_a", "load_b"], "a * b")
    .spec("export", ["multiply"], "multiply(a, b) interface")
    .intent("module", ["export"], "Multiply two numbers")
)

# Export to JSON
json_str = program.export()

# Save to file
program.save("multiply.json")
```

## Visualization Tools

### Graph Viewer (`graph_viewer.html`)

- **3 layout modes**: Dagre, Force, Radial
- **Search**: Filter by stratum or opcode
- **Load samples**: Dropdown menu
- **Export**: SVG download

### Execution Replay (`execution_replay.html`)

- **Step controls**: Play, Pause, Step forward/back
- **Speed control**: Adjust execution speed
- **Trace log**: View execution history

### Flame Graph (`flame_graph.html`)

- **Performance visualization**: Time-proportional bars
- **Bottleneck highlighting**: Red borders
- **Strata grouping**: Organized by layer
- **Interactive tooltips**: Hover for details

## Sample Programs

Located in `sample_programs_loader.json`:

| Program | Glyphs | Difficulty |
|---------|-------|------------|
| add_two_numbers | 7 | Easy |
| is_even | 11 | Easy |
| sum_array | 10 | Easy |
| factorial | 12 | Medium |
| fibonacci | 20 | Medium |
| calculator | 17 | Medium |
| json_parser | 24 | Hard |

## Testing

Run the integration test suite:

```bash
python3 -m pytest test_integration.py -v
```

Expected output: **23 passed**

## Troubleshooting

### "Invalid JSON" error
- Ensure JSON is valid
- Check for trailing commas
- Verify all string keys are quoted

### "Coherence < 100%" error
- Dependencies pointing upward (higher strata depending on lower)
- Use the auto-layout feature to reorganize
- Check dependency directions in properties panel

### "Missing INTENT glyph" warning
- Add a MODULE glyph at INTENT level
- Ensure it has no dependencies or only valid ones

## File Structure

```
glyph_stratum/
├── core/
│   ├── stratum.py          # Core types
│   ├── glyph_registry.py  # Registry
│   └── executor.py       # Execution engine
├── glyph_editor.html     # Visual editor
├── graph_viewer.html     # Graph visualization
├── execution_replay.html # Execution replay
├── flame_graph.html     # Performance flame graph
├── glyph_cli.py          # Command-line interface
├── glyph_api.py          # Python API
├── glyph_profiler.py     # Performance profiler
├── python_parser.py     # Python → Glyphs
├── test_integration.py  # Integration tests
├── sample_programs_loader.json  # Sample programs
└── README.md            # This file
```

## License

MIT License
