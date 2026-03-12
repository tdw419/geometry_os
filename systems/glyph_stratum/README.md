# GlyphStratum Documentation

## Overview

GlyphStratum is an AI-native visual programming language designed to solve "the AI coding problem" where AI assistants start strong but get lost in program complexity. By representing code as a structured graph of glyphs across 5 strata, GlyphStratum provides:

- **Visual clarity** - See the entire program structure at a glance
- **Dependency tracking** - Understand how components relate
- **Coherence validation** - Enforce architectural constraints
- **AI-friendly representation** - Better context for LLMs

## The 5 Strata

Programs are organized into 5 hierarchical layers (strata):

```
INTENT (4)     ← Goals, module definitions, entry points
    ↓
SPEC (3)       ← Interfaces, type definitions, exports
    ↓
LOGIC (2)      ← Computations, control flow, operations
    ↓
MEMORY (1)     ← Variables, storage, data movement
    ↓
SUBSTRATE (0)  ← Raw data, literals, constants
```

**Coherence Rule:** Dependencies must point DOWNWARD (higher strata depend on lower strata). This ensures clean architecture and prevents circular dependencies.

## Opcodes

Each glyph has an opcode describing its operation:

| Opcode | Stratum | Description |
|--------|---------|-------------|
| `DATA` | SUBSTRATE | Raw data/literal |
| `LOAD` | MEMORY | Load from memory |
| `STORE` | MEMORY | Store to memory |
| `ALLOC` | MEMORY | Allocate memory |
| `FREE` | MEMORY | Free memory |
| `CALL` | LOGIC | Function/method call |
| `BRANCH` | LOGIC | Conditional branch |
| `LOOP` | LOGIC | Loop/iteration |
| `RETURN` | LOGIC | Return value |
| `EXPORT` | SPEC | Export interface |
| `TYPE` | SPEC | Type definition |
| `MODULE` | INTENT | Module/program entry |
| `NOP` | Any | No operation |
| `HALT` | Any | Stop execution |

## Installation

```bash
cd systems/glyph_stratum
pip install -r requirements.txt  # If available
```

No external dependencies required for core functionality. D3.js is loaded from CDN for visualizations.

## Quick Start

### 1. Visual Editor

Open `glyph_editor.html` in a browser:

```bash
# Using Python's built-in server
python3 -m http.server 8000
# Then open: http://localhost:8000/glyph_editor.html
```

**Controls:**
- **Double-click canvas** - Add new glyph
- **Click palette** - Add glyph by stratum
- **Drag nodes** - Reposition
- **Right-click node** - Add dependency from selected
- **Ctrl+Z / Ctrl+Y** - Undo/Redo
- **Layout button** - Auto-arrange nodes

### 2. Command Line Interface

```bash
# Create new program
python3 glyph_cli.py new my_program -o program.json

# Validate
python3 glyph_cli.py validate program.json

# Get info
python3 glyph_cli.py info program.json

# Profile performance
python3 glyph_cli.py profile program.json

# Export to different formats
python3 glyph_cli.py export program.json dot -o graph.dot
python3 glyph_cli.py export program.json mermaid -o graph.mmd

# List sample programs
python3 glyph_cli.py samples

# Generate from description
python3 glyph_cli.py generate multiply "multiply two numbers"
```

### 3. Python API

```python
from glyph_api import GlyphBuilder, GlyphExporter

# Build program using fluent API
program = (GlyphBuilder("multiply")
    .substrate("a", 7, "First operand")
    .substrate("b", 6, "Second operand")
    .memory("load_a", ["a"], "Load operand a")
    .memory("load_b", ["b"], "Load operand b")
    .logic("multiply", ["load_a", "load_b"], "a * b")
    .spec("export", ["multiply"], "multiply(a, b) interface")
    .intent("module", ["export"], "Multiply two numbers")
)

# Get registry
registry = program.build()

# Export to JSON
json_str = program.export()

# Save to file
program.save("multiply.json")
```

### 4. Python Parser

Convert Python code to glyphs:

```bash
# Parse file
python3 python_parser.py my_script.py -o output.json

# Parse code string
python3 python_parser.py -c "def add(a, b): return a + b"

# With verbose output
python3 python_parser.py my_script.py -v
```

```python
from python_parser import parse_python_code, parse_python_file

# Parse code string
result = parse_python_code("def add(a, b): return a + b")

# Parse file
result = parse_python_file("my_script.py")

# Result is a dict with 'name' and 'glyphs'
print(f"Parsed {len(result['glyphs'])} glyphs")
```

## File Formats

### Program JSON Format

```json
{
  "name": "program_name",
  "glyphs": {
    "0": {
      "stratum": "SUBSTRATE",
      "opcode": "DATA",
      "rationale": "Description of this glyph",
      "dependencies": [],
      "invariants": {"value": 42}
    },
    "1": {
      "stratum": "LOGIC",
      "opcode": "CALL",
      "rationale": "a + b",
      "dependencies": [0],
      "invariants": {}
    }
  }
}
```

### Export Formats

**DOT (Graphviz):**
```bash
python3 glyph_cli.py export program.json dot
```

**Mermaid:**
```bash
python3 glyph_cli.py export program.json mermaid
```

## Visualization Tools

### Graph Viewer (`graph_viewer.html`)

Interactive dependency graph with:
- 3 layout modes: Dagre (hierarchical), Force, Radial
- Search and filter by stratum/opcode
- Sample program loader
- Export to SVG

### Execution Replay (`execution_replay.html`)

Step-by-step execution visualization:
- Play/Pause/Reset controls
- Step forward/back navigation
- Speed control
- Trace log sidebar

### Flame Graph (`flame_graph.html`)

Performance profiling visualization:
- Hierarchical time breakdown by stratum
- Bottleneck highlighting
- Interactive tooltips
- Zoom controls

## Coherence Validation

A program is **coherent** if all dependencies point downward:

```
✓ Valid:   INTENT → SPEC → LOGIC → MEMORY → SUBSTRATE
✗ Invalid: SUBSTRATE → LOGIC (dependency points up!)
```

```bash
# Validate coherence
python3 glyph_cli.py validate program.json

# Output:
# ✓ program.json is valid
#   Coherence: 100.0%
#   Glyphs: 7
```

## Sample Programs

Located in `sample_programs_loader.json`:

| Program | Glyphs | Difficulty | Description |
|---------|--------|------------|-------------|
| add_two_numbers | 7 | Easy | Add two integers |
| is_even | 11 | Easy | Check if even |
| sum_array | 10 | Easy | Sum array elements |
| factorial | 12 | Medium | Recursive factorial |
| fibonacci | 20 | Medium | Fibonacci sequence |
| calculator | 17 | Medium | Multi-op calculator |
| json_parser | 24 | Hard | JSON parser |

## API Reference

### GlyphBuilder

```python
class GlyphBuilder:
    def __init__(self, name: str = "program")

    def substrate(self, name: str, value: Any, rationale: str = "") -> GlyphBuilder
    def memory(self, name: str, deps: List[str], rationale: str = "", opcode: str = "LOAD") -> GlyphBuilder
    def logic(self, name: str, deps: List[str], rationale: str = "", opcode: str = "CALL", runtime_refs: List[str] = None) -> GlyphBuilder
    def spec(self, name: str, deps: List[str], rationale: str = "", opcode: str = "EXPORT") -> GlyphBuilder
    def intent(self, name: str, deps: List[str], rationale: str = "") -> GlyphBuilder

    def build(self) -> GlyphRegistry
    def export(self) -> str
    def save(self, path: str)
```

### GlyphExporter

```python
class GlyphExporter:
    @staticmethod
    def to_json(registry: GlyphRegistry, name: str = "program") -> str

    @staticmethod
    def to_dict(registry: GlyphRegistry, name: str = "program") -> Dict

    @staticmethod
    def save(registry: GlyphRegistry, path: str, name: str = "program")
```

### GlyphProfiler

```python
class GlyphProfiler:
    def __init__(self, registry: GlyphRegistry, name: str = "program")

    def profile_execution(self, iterations: int = 1) -> ProfileReport
```

### PythonToGlyphParser

```python
class PythonToGlyphParser(ast.NodeVisitor):
    def __init__(self, source_name: str = "module")
    def parse(self, source: str) -> Dict
    def to_dict(self) -> Dict

def parse_python_file(filepath: str) -> Dict
def parse_python_code(code: str, name: str = "inline") -> Dict
```

## Running Tests

```bash
# Run integration tests
python3 -m pytest test_integration.py -v

# Run specific test class
python3 -m pytest test_integration.py::TestPythonParser -v

# Run with coverage
python3 -m pytest test_integration.py --cov=. --cov-report=html
```

## Architecture

```
glyph_stratum/
├── core/
│   ├── stratum.py         # Core types: Stratum, Opcode, GlyphInfo
│   ├── glyph_registry.py   # Glyph registry and validation
│   └── executor.py         # Execution engine
├── glyph_editor.html       # Visual editor
├── graph_viewer.html       # Dependency graph viewer
├── execution_replay.html   # Execution visualizer
├── flame_graph.html        # Performance flame graph
├── glyph_cli.py            # Command-line interface
├── glyph_api.py            # Python fluent API
├── glyph_profiler.py       # Performance profiler
├── python_parser.py        # Python → Glyphs parser
├── test_integration.py     # Integration tests
└── sample_programs_loader.json  # Sample programs
```

## Troubleshooting

### "Invalid JSON" error
- Ensure JSON is valid (use a linter)
- Check for trailing commas
- Verify all string keys are quoted

### "Coherence < 100%" error
- Check dependency directions
- Ensure higher strata depend on lower strata only
- Use `glyph_cli.py validate -v` for details

### Editor not loading
- Check browser console for errors
- Ensure D3.js CDN is accessible
- Try a different browser

## Contributing

1. Fork the repository
2. Create a feature branch
3. Add tests for new functionality
4. Run `python3 -m pytest test_integration.py`
5. Submit a pull request

## License

MIT License - See LICENSE file for details.

---

**Version:** 1.0.0
**Last Updated:** 2026-03-12
