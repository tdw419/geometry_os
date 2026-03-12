# GlyphStratum Runtime

An AI-native visual programming language with a 5-layer stratum architecture and pure JavaScript fallback runtime.

## Overview

GlyphStratum represents programs as interconnected glyphs organized into 5 hierarchical strata. Each glyph is a computational unit with dependencies that must flow downward (higher strata depend on lower strata).

## The 5 Strata

| Stratum | ID | Purpose |
|---------|-----|---------|
| SUBSTRATE | 0 | Raw data values (literals) |
| MEMORY | 1 | Named storage (variables) |
| LOGIC | 2 | Computation (operations) |
| SPEC | 3 | Specifications (constraints) |
| INTENT | 4 | High-level goals |

### Coherence Rule

Dependencies must point **DOWNWARD** only. A glyph in stratum N can only depend on glyphs in strata 0 to N-1.

```
INTENT (4)    ← Goals
    ↓
SPEC (3)      ← Constraints
    ↓
LOGIC (2)     ← Operations
    ↓
MEMORY (1)    ← Variables
    ↓
SUBSTRATE (0) ← Data
```

## Opcodes

### Core Opcodes

| Opcode | Stratum | Description |
|--------|---------|-------------|
| `NOP` | SUBSTRATE | No operation |
| `DATA` | SUBSTRATE | Literal value |
| `LOAD` | MEMORY | Load from named storage |
| `STORE` | MEMORY | Store to named storage |

### Math Opcodes

| Opcode | Args | Description |
|--------|------|-------------|
| `ADD` | 2 | Addition (a + b) |
| `SUB` | 2 | Subtraction (a - b) |
| `MUL` | 2 | Multiplication (a * b) |
| `DIV` | 2 | Division (a / b) |
| `MOD` | 2 | Modulo (a % b) |
| `NEG` | 1 | Negation (-a) |
| `ABS` | 1 | Absolute value (\|a\|) |

### Bitwise Opcodes

| Opcode | Args | Description |
|--------|------|-------------|
| `BITAND` | 2 | Bitwise AND (a & b) |
| `BITOR` | 2 | Bitwise OR (a \| b) |
| `BITXOR` | 2 | Bitwise XOR (a ^ b) |
| `BITNOT` | 1 | Bitwise NOT (~a) |
| `SHIFTL` | 2 | Left shift (a << b) |
| `SHIFTR` | 2 | Unsigned right shift (a >>> b) |

### Comparison Opcodes

| Opcode | Args | Description |
|--------|------|-------------|
| `EQ` | 2 | Equal (a == b) |
| `NE` | 2 | Not equal (a != b) |
| `LT` | 2 | Less than (a < b) |
| `LE` | 2 | Less or equal (a <= b) |
| `GT` | 2 | Greater than (a > b) |
| `GE` | 2 | Greater or equal (a >= b) |

### String Opcodes

| Opcode | Args | Description |
|--------|------|-------------|
| `CONCAT` | 2 | Concatenate strings |
| `LEN` | 1 | String length |
| `SUBSTR` | 3 | Substring (str, start, len) |

### Array Opcodes

| Opcode | Args | Description |
|--------|------|-------------|
| `PUSH` | 2 | Push element to array |
| `POP` | 1 | Pop last element |
| `ARRAYLEN` | 1 | Array length |
| `GET` | 2 | Get element at index |
| `SET` | 3 | Set element at index |

### Control Flow Opcodes

| Opcode | Args | Description |
|--------|------|-------------|
| `BRANCH` | 3 | Conditional (cond, true_val, false_val) |
| `LOOP` | 2 | Loop back (update, condition) |
| `IFTRUE` | 1 | Check if truthy |
| `IFFALSE` | 1 | Check if falsy |

## Glyph Structure

```json
{
  "stratum": "LOGIC",
  "opcode": "ADD",
  "dependencies": [1, 2],
  "invariants": {}
}
```

### Fields

- **stratum**: Layer name (SUBSTRATE, MEMORY, LOGIC, SPEC, INTENT)
- **opcode**: Operation to perform
- **dependencies**: Array of glyph IDs this depends on
- **invariants**: Additional properties (value, name, etc.)

## API Reference

### GlyphRuntime Class

```javascript
const runtime = new GlyphRuntime();

// Value management
runtime.makeValue(value);        // Create typed value
runtime.getValue(glyphId);       // Get value by glyph ID

// Glyph management
runtime.addGlyph(id, glyph);     // Add a glyph
runtime.getGlyph(id);            // Get glyph by ID

// Execution
runtime.computeExecutionOrder(); // Get execution order
runtime.execute();               // Execute all glyphs
runtime.executeWithTrace();      // Execute with trace log

// Program loading
runtime.loadProgram(json);       // Load JSON program
runtime.checkCoherence();        // Verify strata rules
```

### Value Types

```javascript
// Integer
{ type: 'int', value: 42 }

// Float
{ type: 'float', value: 3.14 }

// Boolean
{ type: 'bool', value: true }

// String
{ type: 'string', value: 'hello' }

// Array
{ type: 'array', value: [1, 2, 3] }
```

## Example: Arithmetic Expression

Calculate `(10 + 5) * 2`:

```json
{
  "glyphs": {
    "1": {
      "stratum": "SUBSTRATE",
      "opcode": "DATA",
      "invariants": { "value": 10 }
    },
    "2": {
      "stratum": "SUBSTRATE",
      "opcode": "DATA",
      "invariants": { "value": 5 }
    },
    "3": {
      "stratum": "LOGIC",
      "opcode": "ADD",
      "dependencies": [1, 2]
    },
    "4": {
      "stratum": "SUBSTRATE",
      "opcode": "DATA",
      "invariants": { "value": 2 }
    },
    "5": {
      "stratum": "LOGIC",
      "opcode": "MUL",
      "dependencies": [3, 4]
    }
  }
}
```

Execution order: 1 → 2 → 3 → 4 → 5
Result: 30

## Example: Variable Storage

Store and retrieve values:

```json
{
  "glyphs": {
    "1": {
      "stratum": "SUBSTRATE",
      "opcode": "DATA",
      "invariants": { "value": 42 }
    },
    "2": {
      "stratum": "MEMORY",
      "opcode": "STORE",
      "dependencies": [1],
      "invariants": { "name": "answer" }
    },
    "3": {
      "stratum": "MEMORY",
      "opcode": "LOAD",
      "invariants": { "name": "answer" }
    }
  }
}
```

## Example: Conditional

```json
{
  "glyphs": {
    "1": { "stratum": "SUBSTRATE", "opcode": "DATA", "invariants": { "value": 10 } },
    "2": { "stratum": "SUBSTRATE", "opcode": "DATA", "invariants": { "value": 5 } },
    "3": { "stratum": "LOGIC", "opcode": "GT", "dependencies": [1, 2] },
    "4": { "stratum": "SUBSTRATE", "opcode": "DATA", "invariants": { "value": "yes" } },
    "5": { "stratum": "SUBSTRATE", "opcode": "DATA", "invariants": { "value": "no" } },
    "6": { "stratum": "LOGIC", "opcode": "BRANCH", "dependencies": [3, 4, 5] }
  }
}
```

Result: "yes" (because 10 > 5)

## Running Tests

```bash
node test_js_runtime.js
```

Expected output: `Tests: 46 passed, 0 failed`

## Building WASM (Optional)

If you have emscripten installed:

```bash
./build.sh
```

Output: `wasm/glyph_runtime.wasm`

## VS Code Extension

The extension provides:
- Syntax highlighting for `.glyph` files
- Interactive graph preview
- Snippets for common patterns

### Installation

```bash
cd vscode-extension
npm install
npm run compile
# Press F5 in VS Code to launch extension
```

## File Structure

```
wasm/
├── glyph_runtime.c           # C source for WASM
├── glyph_runtime_extended.c  # Extended C source
├── glyph_runtime_f_fallback.js  # Pure JS runtime
├── test_js_runtime.js        # Test suite (46 tests)
├── build.sh                  # WASM build script
└── examples/
    ├── factorial.glyph       # Factorial with loop
    ├── fibonacci.glyph       # Fibonacci sequence
    ├── sorting.glyph         # Bubble sort
    ├── string_ops.glyph      # String operations
    └── array_ops.glyph       # Array operations

vscode-extension/
├── package.json
├── syntaxes/glyph.tmLanguage.json
├── src/extension.ts
├── src/previewProvider.ts
└── snippets.json
```

## Design Philosophy

### AI-Native

GlyphStratum is designed for AI code generation:
- Simple, declarative JSON structure
- Explicit dependencies (no hidden state)
- Type inference from values
- Visual graph representation

### Visual Programming

Each glyph is a node in a directed acyclic graph:
- Nodes = glyphs
- Edges = dependencies
- Layers = strata
- Execution = topological sort

### Safety

- Coherence checking prevents invalid programs
- Type checking at runtime
- No null/undefined values
- Immutable glyph definitions

## License

MIT
