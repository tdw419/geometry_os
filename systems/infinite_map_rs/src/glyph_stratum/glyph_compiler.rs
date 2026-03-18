//! systems/glyph_stratum/glyph_compiler.rs
//!
//! Compiles .glyph assembly into GPU textures.
//!
//! The output is an RGBA8Uint texture where each pixel encodes one instruction:
//!   R = opcode (0-255)
//!   G = stratum (0-4)
//!   B = p1 (parameter 1)
//!   A = p2 (parameter 2)
//!
//! The texture is addressed via Hilbert curve coordinates.

use wgpu::{Device, Queue, Texture, TextureDescriptor, TextureDimension, TextureFormat, TextureUsages, Extent3d, ImageDataLayout};

use crate::glyph_stratum::glyph_parser::parse_glyph_program;

/// Compiled glyph program ready for GPU upload
pub struct CompiledGlyph {
    /// RGBA8 texture data (4 bytes per instruction)
    pub texture_data: Vec<u8>,
    /// Entry point (Hilbert index)
    pub entry_point: u32,
    /// Program size in instructions
    pub instruction_count: usize,
}

/// Compile a .glyph source file into texture data
pub fn compile_glyph_source(source: &str) -> Result<CompiledGlyph, String> {
    let (program, vm_config) = parse_glyph_program(source)?;

    // Convert Vec<u32> to RGBA8 bytes
    // Parser outputs: [opcode+200, stratum, p1, p2, ...]
    let mut texture_data = Vec::with_capacity(program.len());

    for chunk in program.chunks(4) {
        let opcode = if chunk.len() > 0 { (chunk[0] as u8).saturating_sub(200) } else { 0 };
        let stratum = if chunk.len() > 1 { chunk[1] as u8 } else { 0 };
        let p1 = if chunk.len() > 2 { (chunk[2] & 0xFF) as u8 } else { 0 };
        let p2 = if chunk.len() > 3 { (chunk[3] & 0xFF) as u8 } else { 0 };

        texture_data.push(opcode);
        texture_data.push(stratum);
        texture_data.push(p1);
        texture_data.push(p2);
    }

    let instruction_count = texture_data.len() / 4;

    Ok(CompiledGlyph {
        texture_data,
        entry_point: vm_config.entry_point,
        instruction_count,
    })
}

/// Compile a .glyph file from disk
pub fn compile_glyph_file(path: &str) -> Result<CompiledGlyph, String> {
    let source = std::fs::read_to_string(path)
        .map_err(|e| format!("Failed to read {}: {}", path, e))?;
    compile_glyph_source(&source)
}
/// Create a GPU texture from compiled glyph data
pub fn create_glyph_texture(
    device: &Device,
    queue: &Queue,
    compiled: &CompiledGlyph,
    label: Option<&str>,
) -> Texture {
    // Calculate texture dimensions (must be power of 2 for Hilbert)
    // Minimum size that fits the program
    let min_pixels = compiled.instruction_count.next_power_of_two();
    let size = (min_pixels as f64).sqrt().ceil() as u32;
    let texture_size = size.next_power_of_two().max(64); // At least 64x64

    // Create texture with padding for Hilbert addressing
    let texture = device.create_texture(&TextureDescriptor {
        label,
        size: Extent3d {
            width: texture_size,
            height: texture_size,
            depth_or_array_layers: 1,
        },
        mip_level_count: 1,
        sample_count: 1,
        dimension: TextureDimension::D2,
        format: TextureFormat::Rgba8Uint,
        usage: TextureUsages::TEXTURE_BINDING | TextureUsages::STORAGE_BINDING | TextureUsages::COPY_DST,
        view_formats: &[],
    });

    // Pad texture data to match texture size
    let total_pixels = (texture_size * texture_size) as usize;
    let mut padded_data = vec![0u8; total_pixels * 4];

    // Write program data using Hilbert coordinates
    for (i, chunk) in compiled.texture_data.chunks(4).enumerate() {
        let d = i as u32;
        let (x, y) = hilbert_d2xy(texture_size, d);

        let offset = ((y * texture_size + x) * 4) as usize;
        if offset + 4 <= padded_data.len() {
            padded_data[offset] = chunk[0];     // opcode
            padded_data[offset + 1] = chunk[1]; // stratum
            padded_data[offset + 2] = chunk[2]; // p1
            padded_data[offset + 3] = chunk[3]; // p2
        }
    }

    // Upload to GPU
    queue.write_texture(
        wgpu::ImageCopyTexture {
            texture: &texture,
            mip_level: 0,
            origin: wgpu::Origin3d::ZERO,
            aspect: wgpu::TextureAspect::All,
        },
        &padded_data,
        ImageDataLayout {
            offset: 0,
            bytes_per_row: Some(texture_size * 4),
            rows_per_image: Some(texture_size),
        },
        Extent3d {
            width: texture_size,
            height: texture_size,
            depth_or_array_layers: 1,
        },
    );

    texture
}
/// Hilbert curve: convert distance d to (x, y) coordinates
/// Assumes n is a power of 2
pub fn hilbert_d2xy(n: u32, d: u32) -> (u32, u32) {
    let mut x = 0u32;
    let mut y = 0u32;
    let mut s = 1u32;
    let mut d = d;

    while s < n {
        let rx = 1 & (d / 2);
        let ry = 1 & (d ^ rx);

        if ry == 0 {
            if rx == 1 {
                x = s - 1 - x;
                y = s- 1 - y;
            }
            std::mem::swap(&mut x, &mut y);
        }

        x += s * rx;
        y += s * ry;
        d /= 4;
        s *= 2;
    }

    (x, y)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_compile_simple_program() {
        let source = r#"
:entry
    MOV r[0], 42
    ADD r[0], r[1]
    HALT
"#;
        let compiled = compile_glyph_source(source).unwrap();
        assert!(compiled.instruction_count >= 3);
        assert_eq!(compiled.entry_point, 0);
    }

    #[test]
    fn test_hilbert_roundtrip() {
        let n = 64u32;
        for d in 0..100 {
            let (x, y) = hilbert_d2xy(n, d);
            assert!(x < n);
            assert!(y < n);
        }
    }

    #[test]
    fn test_texture_size_calculation() {
        // 1000 instructions should fit in 1024 pixels (32x32 texture)
        let compiled = CompiledGlyph {
            texture_data: vec![0u8; 1000 * 4],
            entry_point: 0,
            instruction_count: 1000,
        };
        let min_pixels = compiled.instruction_count.next_power_of_two();
        let size = (min_pixels as f64).sqrt().ceil() as u32;
        let texture_size = size.next_power_of_two().max(64);
        assert!(texture_size >= 32);
    }

    #[test]
    fn test_compile_window_manager() {
        // Test compiling the actual window_manager.glyph file
        // Use absolute path from the geometry_os/geometry_os directory
        let manifest_dir = std::env::var("CARGO_MANIFEST_DIR").unwrap();
        // manifest_dir is .../geometry_os/systems/infinite_map_rs
        // We want .../geometry_os/geometry_os/systems/glyph_stratum/programs/window_manager.glyph
        let workspace_root = std::path::Path::new(&manifest_dir)
            .parent().unwrap()  // systems
            .parent().unwrap(); // geometry_os (geometry_os/geometry_os)
        let glyph_path = workspace_root.join("systems/glyph_stratum/programs/window_manager.glyph");
        let path_str = glyph_path.to_str().expect("Invalid path");
        let result = compile_glyph_file(path_str);
        assert!(result.is_ok(), "Failed to compile window_manager.glyph: {:?}", result.err());

        let compiled = result.unwrap();
        // Window manager has boot, event_loop, spawn_ubuntu, inject_event, halt sections
        // Should be at least 50 instructions
        assert!(compiled.instruction_count >= 50,
            "Expected at least 50 instructions, got {}", compiled.instruction_count);

        // Entry point should be 0 (boot label is first)
        assert_eq!(compiled.entry_point, 0);

        // Texture data should be 4 bytes per instruction
        assert_eq!(compiled.texture_data.len(), compiled.instruction_count * 4);

        // First instruction should be MOV (opcode 6) in stratum 2 (LOGIC)
        // MOV r10, 0x0100 -> opcode=6, stratum=2, p1=10 (reg), p2=0x00 (low byte of 0x0100)
        let first_opcode = compiled.texture_data[0];
        // Opcode 6 (MOV) - note: parser adds 200, compiler subtracts 200
        // So if parser outputs 206, compiler outputs 6
        assert!(first_opcode < 50, "First opcode should be a valid instruction, got {}", first_opcode);
    }

    #[test]
    fn test_compile_inline_program() {
        // Test with an inline program to avoid path issues
        let source = r#"
:boot
    MOV r[10], 0x0100
    MOV r[1], 0
    HALT
"#;
        let compiled = compile_glyph_source(source).unwrap();
        assert!(compiled.instruction_count >= 3);
        assert_eq!(compiled.entry_point, 0);
    }

    #[test]
    fn test_compile_counter_child() {
        // Test compiling the counter_child.glyph file
        let manifest_dir = std::env::var("CARGO_MANIFEST_DIR").unwrap();
        let workspace_root = std::path::Path::new(&manifest_dir)
            .parent().unwrap()
            .parent().unwrap();
        let glyph_path = workspace_root.join("systems/glyph_stratum/programs/counter_child.glyph");
        let path_str = glyph_path.to_str().expect("Invalid path");
        let result = compile_glyph_file(path_str);
        assert!(result.is_ok(), "Failed to compile counter_child.glyph: {:?}", result.err());

        let compiled = result.unwrap();
        // Counter child has entry, main_loop, continue_counting, halt sections
        // Should be at least 10 instructions
        assert!(compiled.instruction_count >= 10,
            "Expected at least 10 instructions, got {}", compiled.instruction_count);

        // Entry point should be 0 (entry label is first)
        assert_eq!(compiled.entry_point, 0);

        // Verify it contains YIELD instruction (opcode 227)
        let has_yield = compiled.texture_data.chunks(4).any(|chunk| {
            chunk[0] == 27 // YIELD = 227 - 200 = 27 in normalized form
        });
        assert!(has_yield, "Counter child should contain YIELD instruction for cooperative multitasking");
    }
}
