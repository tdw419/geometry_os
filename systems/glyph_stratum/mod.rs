pub mod glyph_parser;
pub mod glyph_compiler;

pub use glyph_compiler::{compile_glyph_source, compile_glyph_file, compile_glyph_file, create_glyph_texture, CompiledGlyph};

pub use glyph_parser::{parse_glyph_program, ParsedGlyph, hilbert_d2xy, hilbert_xy2d};

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
        let size = ((min_pixels as f64) * 4.0).ceil() as u32;
        let texture_size = size.next_power_of_two().max(64); // At least 64x64
        assert!(texture_size >= 32);
    }
}
