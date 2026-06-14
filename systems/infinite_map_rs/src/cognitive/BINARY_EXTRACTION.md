# ACE Binary Extraction from .rts.png Textures

## Overview

The ACE binary extractor is a critical component that enables the Geometry OS compositor to extract executable cognitive logic from .rts.png texture files. This reverses the serialization process performed by [`ace_to_rts.py`](../../../../systems/ace/rts/ace_to_rts.py).

## Architecture

### Hilbert Curve Mapping

The .rts.png file stores binary data using a Hilbert curve space-filling pattern:

```
┌─────────────────────────────────────┐
│  0 →  1 →  2 →  3                  │
│              ↓                      │
│ 15 ← 14 ← 13 ← 12                  │
│  ↓              ↑                  │
│  4 →  5 →  6 →  7                  │
│              ↓                      │
│ 11 ← 10 ←  9 ←  8                  │
└─────────────────────────────────────┘
```

**Why Hilbert Curve?**
- **Locality Preservation**: Related data stays physically close
- **Efficient Encoding**: Good compression properties
- **Visual Patterns**: Creates recognizable visual signatures

### Data Encoding

Each pixel stores 4 bytes (RGBA):

```
Pixel[d] = {
    R: data[4*d + 0]
    G: data[4*d + 1]
    B: data[4*d + 2]
    A: data[4*d + 3]
}
```

For a 512×512 texture:
- Total pixels: 262,144
- Total bytes: 1,048,576 (1 MB)
- Usable for: WASM binaries, ELF binaries, or custom formats

## Implementation

### Binary Extractor

**File**: [`binary_extractor.rs`](binary_extractor.rs)

```rust
use crate::cognitive::binary_extractor::ACEBinaryExtractor;

// Create extractor
let extractor = ACEBinaryExtractor::default();

// Extract from texture file
let binary = extractor.extract_from_texture("ace.rts.png")?;

// Or extract from loaded image
let img = image::open("ace.rts.png")?;
let binary = extractor.extract_from_image(&img)?;
```

### Layer-Specific Extraction

The extractor can also extract specific layer regions:

```rust
// Extract layer 0 (Aspirational)
let layer_data = extractor.extract_layer_region(&img, 0)?;

// Extract diagnostics block
let diag_data = extractor.extract_diagnostics(&img)?;
```

### Layer Regions

| Layer | ID | Range | Purpose |
|-------|----|----|---------|
| Aspirational | 0 | 0-5% | Ethical imperatives |
| Global Strategy | 1 | 5-20% | Strategic planning |
| Agent Model | 2 | 20-35% | Self-awareness |
| Executive Function | 3 | 35-55% | Task decomposition |
| Cognitive Control | 4 | 55-75% | Task scheduling |
| Task Prosecution | 5 | 75-100% | Action execution |

## Integration with ACE Runtime

The binary extractor is integrated into the ACE runtime boot process:

```rust
// In ace_runtime.rs
impl ACERuntime {
    pub fn boot_from_texture(id: String, texture_path: &Path) -> Result<Self> {
        // 1. Load PNG
        let img = image::open(texture_path)?;
        
        // 2. Extract ACE binary using Hilbert mapping
        let binary = Self::extract_ace_binary(&img)?;
        
        // 3. Initialize WASM runtime
        let engine = Engine::default();
        let module = Module::new(&engine, &binary)?;
        
        // 4. Create store and instantiate
        let mut store = Store::new(&engine, ACEState::new(id, texture_path));
        let mut linker = Linker::new(&engine);
        let instance = linker.instantiate(&mut store, &module)?;
        
        Ok(Self { engine, module, store, instance })
    }
    
    fn extract_ace_binary(img: &DynamicImage) -> Result<Vec<u8>> {
        let extractor = ACEBinaryExtractor::default();
        let binary = extractor.extract_from_image(img)?;
        extractor.validate_binary(&binary)?;
        Ok(binary)
    }
}
```

## Binary Validation

The extractor validates extracted binaries:

```rust
// Check for WASM magic number
if data[0..4] == b"\0asm" {
    tracing::info!("Detected WASM binary");
}

// Check for ELF magic number
if data[0..4] == b"\x7fELF" {
    tracing::info!("Detected ELF binary");
}
```

## Performance Considerations

### Extraction Speed

- **512×512 texture**: ~10-50ms extraction time
- **Hilbert LUT generation**: One-time cost, cached
- **Memory usage**: ~4MB for LUT + texture data

### Optimization Strategies

1. **LUT Caching**: Generate LUT once per grid size
2. **Parallel Extraction**: Use rayon for multi-threaded extraction
3. **Region Extraction**: Only extract needed regions
4. **Lazy Loading**: Extract on-demand during execution

## Usage Examples

### Example 1: Extract and Validate

```rust
use crate::cognitive::binary_extractor::ACEBinaryExtractor;

let extractor = ACEBinaryExtractor::default();

// Extract binary
let binary = extractor.extract_from_texture("ace.rts.png")?;

// Validate
extractor.validate_binary(&binary)?;

println!("Extracted {} bytes", binary.len());
```

### Example 2: Extract Specific Layer

```rust
let img = image::open("ace.rts.png")?;

// Extract aspirational layer
let layer_data = extractor.extract_layer_region(&img, 0)?;

println!("Layer 0: {} bytes", layer_data.len());
```

### Example 3: Extract Diagnostics

```rust
let img = image::open("ace.rts.png")?;

// Extract diagnostics block
let diag_data = extractor.extract_diagnostics(&img)?;

// Parse diagnostics
let health = parse_diagnostics(&diag_data);
println!("Entity health: {}", health);
```

## Testing

### Unit Tests

```rust
#[cfg(test)]
mod tests {
    use super::*;
    
    #[test]
    fn test_hilbert_d2xy() {
        let extractor = ACEBinaryExtractor::new(4);
        let (x, y) = extractor.hilbert_d2xy(4, 0);
        assert_eq!(x, 0);
        assert_eq!(y, 0);
    }
    
    #[test]
    fn test_trim_padding() {
        let extractor = ACEBinaryExtractor::default();
        let data = vec![1, 2, 3, 0, 0, 0];
        let trimmed = extractor.trim_padding(&data);
        assert_eq!(trimmed, vec![1, 2, 3]);
    }
}
```

### Integration Tests

```rust
#[test]
fn test_extract_from_sample_texture() {
    let extractor = ACEBinaryExtractor::default();
    let binary = extractor.extract_from_texture("test_data/ace.rts.png");
    assert!(binary.is_ok());
}
```

## Error Handling

The extractor provides detailed error messages:

```rust
use anyhow::{Result, Context};

pub fn extract_from_texture<P: AsRef<Path>>(&self, texture_path: P) -> Result<Vec<u8>> {
    let img = image::open(texture_path)
        .context("Failed to open texture file")?;
    
    // ... extraction logic ...
    
    if width != self.grid_size {
        anyhow::bail!("Unexpected texture size: expected {}×{}, got {}×{}",
                      self.grid_size, self.grid_size, width, height);
    }
    
    Ok(binary_data)
}
```

## Security Considerations

### Binary Validation

- **Magic Number Check**: Verify binary format
- **Size Limits**: Enforce maximum binary size
- **Sandboxing**: Execute in WASM sandbox
- **Permission Checks**: Verify texture read permissions

### Resource Limits

```rust
// Enforce maximum binary size
const MAX_BINARY_SIZE: usize = 10 * 1024 * 1024; // 10 MB

if binary.len() > MAX_BINARY_SIZE {
    anyhow::bail!("Binary too large: {} bytes", binary.len());
}
```

## Future Enhancements

1. **Compression**: Add support for compressed binaries
2. **Encryption**: Support encrypted cognitive payloads
3. **Streaming**: Stream large binaries during extraction
4. **Caching**: Cache extracted binaries for performance
5. **Validation**: Enhanced binary validation and verification

## References

- [Hilbert Curve](https://en.wikipedia.org/wiki/Hilbert_curve)
- [WASM Specification](https://webassembly.github.io/spec/)
- [ACE-RTS Architecture](../../../../systems/ace/rts/ACE_RTS_ARCHITECTURE.md)
- [Serializer Implementation](../../../../systems/ace/rts/ace_to_rts.py)

---

**"Extracting cognition from pixels - where data becomes thought."**
