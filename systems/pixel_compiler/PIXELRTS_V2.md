# PixelRTS v2 - Visual Bootable Container Format

## Overview

PixelRTS v2 is a **Visual Bootable Container** format that encodes arbitrary binary data into standard PNG images. The visual aesthetic *is* the data itself, mapped using Hilbert space-filling curves for optimal locality preservation.

### Key Features

- **4 bytes/pixel RGBA dense packing** - 100% data density
- **Hilbert space-filling curve mapping** - Preserves data locality in 2D
- **PNG tEXt chunk metadata** - Embedded + sidecar JSON for redundancy
- **SHA256 hash verification** - Guaranteed lossless encoding/decoding
- **Standard + Code (WASM) encoding modes** - Generic binary and semantic visualization
- **Automatic boot script generation** - QEMU/KVM integration
- **RTS registry integration** - Centralized catalog management

### Quick Start

```bash
# Convert a binary to visual PNG
python3 pixelrts_v2_converter.py kernel.bin kernel.rts.png

# Extract with verification
python3 pixelrts_v2_extractor.py kernel.rts.png --verify

# Generate boot script
python3 pixelrts_v2_converter.py kernel.bin kernel.rts.png \
  --generate-boot-script --type kernel

# Register in RTS catalog
python3 rts_registry_manager.py register kernel.rts.png --type kernel
```

## File Format

### Structure

- **Base Format**: PNG (Portable Network Graphics)
- **Channels**: RGBA (4 channels × 8 bits = 32 bits/pixel)
- **Mapping**: Hilbert space-filling curve
- **Density**: 4 bytes/pixel (100% data density)

### Metadata

Metadata is stored in two locations for redundancy:

1. **PNG tEXt chunk**: Embedded in the image (key: "PixelRTS")
2. **Sidecar JSON**: `{filename}.meta.json`

### Metadata Structure

```json
{
  "format": "PixelRTS-2.0",
  "version": 2,
  "grid_size": 1024,
  "encoding": {
    "type": "RGBA-dense",
    "bytes_per_pixel": 4,
    "description": "4 consecutive raw bytes packed into RGBA channels",
    "mapping": "Hilbert space-filling curve (precomputed LUT)"
  },
  "offsets": {
    "kernel": {
      "start": 0,
      "end": 1048576,
      "size": 1048576,
      "sha256": "abc123..."
    }
  },
  "hashes": {
    "kernel": "abc123..."
  },
  "entropy": {
    "block_size": 16384,
    "mean_entropy": 127.5,
    "max_entropy": 255,
    "min_entropy": 0
  }
}
```

### Encoding Modes

#### Standard Mode
Used for OS images, kernels, and generic binary data.
- RGBA dense packing (4 consecutive bytes per pixel)
- Hilbert curve mapping
- Visual output: Colored noise with structural patterns

#### Code Mode (WASM)
Used for WASM modules and executable code with semantic visualization.
- **RGBA-semantic coloring**:
  - **Red (R)**: Opcode entropy (hot = high complexity/control flow)
  - **Green (G)**: Operand 1 value
  - **Blue (B)**: Operand 2 value / immediate
  - **Alpha (A)**: Execution mask (255 = executable, 0 = data/padding)

## Tools

### pixelrts_v2_converter.py

Convert binary files to .rts.png visual containers.

#### Usage

```bash
python3 pixelrts_v2_converter.py <input> <output.rts.png> [options]
```

#### Options

| Option | Description |
|--------|-------------|
| `--mode {standard,code}` | Encoding mode (default: standard) |
| `--type <type>` | Content type (kernel, initrd, wasm, etc.) |
| `--name <name>` | Content name |
| `--version <version>` | Content version |
| `--description <desc>` | Content description |
| `--grid-size <size>` | Explicit grid size (power of 2, auto-calculated if not specified) |
| `--generate-boot-script` | Generate .boot.sh file for QEMU/KVM |
| `--qemu-arch <arch>` | QEMU architecture (default: x86_64) |

#### Examples

```bash
# Standard OS image
python3 pixelrts_v2_converter.py alpine.rts alpine.rts.png

# With metadata and boot script
python3 pixelrts_v2_converter.py kernel.bin kernel.rts.png \
  --type kernel \
  --name "Linux Kernel" \
  --version 6.1.0 \
  --generate-boot-script

# WASM module with semantic coloring
python3 pixelrts_v2_converter.py module.wasm module.rts.png \
  --mode code \
  --type wasm
```

### pixelrts_v2_extractor.py

Extract and verify binary data from .rts.png visual containers.

#### Usage

```bash
python3 pixelrts_v2_extractor.py <input.rts.png> [options]
```

#### Options

| Option | Description |
|--------|-------------|
| `-o, --output <path>` | Output file (default: <input>.extracted) |
| `--verify` | Verify SHA256 hash against metadata |
| `--info` | Show metadata only (no extraction) |

#### Examples

```bash
# Extract to file
python3 pixelrts_v2_extractor.py alpine.rts.png -o alpine.rts

# Extract with verification
python3 pixelrts_v2_extractor.py alpine.rts.png --verify

# Show metadata only
python3 pixelrts_v2_extractor.py alpine.rts.png --info
```

### rts_registry_manager.py

Manage the catalog of .rts and .rts.png cartridges.

#### Usage

```bash
python3 rts_registry_manager.py <command> [options]
```

#### Commands

| Command | Description |
|---------|-------------|
| `register <file>` | Register a cartridge |
| `unregister <id>` | Remove a cartridge |
| `list [--type]` | List all cartridges |
| `find <query>` | Search cartridges |
| `verify <id>` | Verify cartridge integrity |
| `get <id>` | Get cartridge details |

#### Options

| Option | Description |
|--------|-------------|
| `--registry <path>` | Custom registry file path |
| `--id <id>` | Custom cartridge ID |
| `--name <name>` | Cartridge name |
| `--type <type>` | Cartridge type |
| `--version <version>` | Cartridge version |
| `--description <desc>` | Cartridge description |
| `-v, --verbose` | Verbose output |

#### Examples

```bash
# Register a .rts.png cartridge
python3 rts_registry_manager.py register kernel.rts.png \
  --type kernel \
  --name "Linux 6.1" \
  --description "Production kernel"

# List all cartridges
python3 rts_registry_manager.py list

# List only kernels
python3 rts_registry_manager.py list --type kernel

# Find cartridges
python3 rts_registry_manager.py find "linux"

# Verify cartridge
python3 rts_registry_manager.py verify kernel-id

# Get detailed info
python3 rts_registry_manager.py get kernel-id -v

# Unregister
python3 rts_registry_manager.py unregister kernel-id
```

## API Reference

### Python API

```python
from systems.pixel_compiler.pixelrts_v2_core import (
    PixelRTSEncoder,
    PixelRTSDecoder,
    HilbertCurve,
    PixelRTSMetadata,
    calculate_grid_size
)
```

#### HilbertCurve

Generate space-filling curve LUT for locality-preserving 2D mapping.

```python
hilbert = HilbertCurve(order=10)  # 1024×1024 grid
lut = hilbert.generate_lut()  # List of (x, y) tuples
coord = hilbert.index_to_coord(42)  # (x, y) for pixel 42
index = hilbert.coord_to_index(100, 200)  # pixel index for (100, 200)
```

#### PixelRTSEncoder

Encode binary data to PNG image.

```python
encoder = PixelRTSEncoder(mode="standard")
png_buffer = encoder.encode(data, metadata={"type": "kernel"})
```

#### PixelRTSDecoder

Decode binary data from PNG image.

```python
decoder = PixelRTSDecoder()
data = decoder.decode(png_buffer)
metadata = decoder.get_metadata()
```

#### PixelRTSMetadata

Manage metadata encoding/decoding.

```python
# Create metadata
metadata = PixelRTSMetadata.create_metadata(
    grid_size=1024,
    encoding_mode="RGBA-dense",
    segments={"kernel": {"sha256": "..."}}
)

# Hash data
hash_hex = PixelRTSMetadata.hash_data(data)

# Encode for PNG tEXt
png_text = PixelRTSMetadata.encode_png_text(metadata)

# Decode from PNG tEXt
metadata = PixelRTSMetadata.decode_png_text(png_text)
```

#### calculate_grid_size

Calculate minimum power-of-2 grid size for given data.

```python
grid_size = calculate_grid_size(data_size_bytes, bytes_per_pixel=4)
```

## Technical Specifications

### Hilbert Curve

- Preserves data locality in 2D representation
- Enables GPU-friendly texture access patterns
- Precomputed LUT for O(1) index ↔ coordinate mapping
- Order calculation: `order = ceil(log2(sqrt(pixels_needed)))`

### Capacity

| Grid Size | Capacity | Max File Size |
|-----------|----------|---------------|
| 512×512   | 1 MB     | 1,048,576 bytes |
| 1024×1024 | 4 MB     | 4,194,304 bytes |
| 2048×2048 | 16 MB    | 16,777,216 bytes |
| 4096×4096 | 64 MB    | 67,108,864 bytes |
| 8192×8192 | 256 MB   | 268,435,456 bytes |

### Verification

- SHA256 hashes embedded in metadata
- Automatic verification with `--verify` flag
- Sidecar JSON for additional provenance
- Exit code 1 on hash mismatch

## Boot Script Generation

### Automatic Boot Scripts

When using `--generate-boot-script`, the converter creates a `.boot.sh` file for QEMU/KVM launching.

#### Generated Boot Script Example

```bash
#!/bin/bash
# Auto-generated QEMU boot script for PixelRTS v2
set -e

echo "Booting PixelRTS v2 cartridge: Linux Kernel"
echo "Extracting from visual container..."

# Extract using PixelRTS v2 extractor
python3 -m geometry_os.systems.pixel_compiler.pixelrts_v2_extractor \
    "kernel.rts.png" \
    -o "kernel.extracted"

echo "Launching QEMU (x86_64)..."

qemu-system-x86_64 \
    -kernel "kernel.extracted" \
    -m 2048 \
    -enable-kvm \
    -display gtk \
    "$@"
```

#### Supported Architectures

- `x86_64` (default)
- `aarch64` (ARM64)
- `riscv64` (RISC-V)
- `arm` (ARM32)
- `ppc64` (PowerPC 64-bit)

## Integration with Geometry OS

### RTS Registry

```bash
# Register .rts.png cartridge
python3 rts_registry_manager.py register kernel.rts.png \
  --type kernel --name "Linux 6.1"
```

### Universal Runner

```bash
# Run any .rts or .rts.png
python3 universal_rts_runner.py kernel.rts.png
```

## Troubleshooting

### Common Issues

**Problem:** `ImportError: No module named 'PIL'`
**Solution:** Install Pillow: `pip install pillow numpy`

**Problem:** "Not a PixelRTS v2 container"
**Solution:** Ensure file was created with pixelrts_v2_converter.py

**Problem:** Hash mismatch during extraction
**Solution:** File may be corrupted. Verify source file integrity.

**Problem:** "Grid size too large"
**Solution:** Use smaller input or increase system memory.

**Problem:** Permission denied when accessing registry
**Solution:** Use `--registry` flag with user-writable path or set `RTS_REGISTRY_PATH` environment variable.

### Performance Tips

- For large files (>100MB), use `--grid-size` to specify explicit grid size
- Enable PNG compression level 6 for better compression (default)
- Use NumPy-optimized encoding for 10x speedup (automatic in standard mode)

## Examples

### Complete Workflow: Kernel Image

```bash
# 1. Convert kernel to visual format
python3 pixelrts_v2_converter.py vmlinuz vmlinuz.rts.png \
  --type kernel \
  --name "Linux Kernel" \
  --version 6.1.0 \
  --generate-boot-script

# 2. Register in catalog
python3 rts_registry_manager.py register vmlinuz.rts.png \
  --type kernel

# 3. Extract and verify
python3 pixelrts_v2_extractor.py vmlinuz.rts.png \
  --verify \
  -o vmlinuz.extracted

# 4. Boot using generated script
./vmlinuz.boot.sh
```

### Complete Workflow: WASM Module

```bash
# 1. Convert WASM with semantic coloring
python3 pixelrts_v2_converter.py add.wasm add.rts.png \
  --mode code \
  --type wasm

# 2. View metadata
python3 pixelrts_v2_extractor.py add.rts.png --info

# 3. Extract
python3 pixelrts_v2_extractor.py add.rts.png \
  -o add.extracted

# 4. Verify
python3 pixelrts_v2_extractor.py add.rts.png --verify
```

## See Also

- [PixelRTS v2 Specification](../../specs/pixelrts-v2/)
- [RTS Quick Start Guide](RTS_QUICKSTART.md)
- [Hilbert Curves Wikipedia](https://en.wikipedia.org/wiki/Hilbert_curve)
- [PNG Specification](https://www.w3.org/TR/PNG/)

## License

Part of the Geometry OS project. See project LICENSE for details.
