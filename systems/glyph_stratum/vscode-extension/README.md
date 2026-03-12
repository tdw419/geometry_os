# GlyphStratum VS Code Extension

AI-native visual programming language support for VS Code.

## Features

- **Syntax Highlighting** - Full support for GlyphStratum syntax with color-coded strata
- **Live Preview** - Visual graph representation of glyph programs
- **Code Execution** - Run glyph programs directly in VS Code
- **Snippets** - Quick insertion of common glyph patterns

## Strata Colors

| Stratum | Color | Purpose |
|---------|-------|---------|
| SUBSTRATE | Blue | Raw data values |
| MEMORY | Green | Storage operations |
| LOGIC | Orange | Computation |
| SPEC | Purple | Type specifications |
| INTENT | Red | High-level goals |

## Usage

### Open Preview

1. Open a `.glyph` or `.glyph.json` file
2. Run command `GlyphStratum: Open Preview` (Ctrl+Shift+P)
3. See visual graph of glyphs and dependencies

### Execute Program

1. Open a glyph program file
2. Run command `GlyphStratum: Execute Program`
3. View execution trace in output panel

## Snippets

Type the prefix and press Tab:

- `gdata` - DATA glyph with value
- `gadd` - ADD operation
- `gsub` - SUB operation
- `geq` - Equality comparison
- `gbranch` - Conditional branch
- `gconcat` - String concatenation
- `gpush` - Array push
- `gprogram` - Full program template

## Installation

```bash
cd vscode-extension
npm install
npm run compile
```

Then in VS Code: Extensions → Install from VSIX

## License

MIT
