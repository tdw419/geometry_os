use glyph_compiler::{BinaryBuilder, Glyph, GlyphProgram};
use serde::Deserialize;
use std::io::{self, Read};

#[derive(Deserialize)]
struct JsonProgram {
    glyphs: Vec<JsonGlyph>,
}

#[derive(Deserialize)]
struct JsonGlyph {
    opcode: u32,
    p1: f32,
    p2: f32,
    dst: u32,
}

fn main() {
    let args: Vec<String> = std::env::args().collect();

    if args.len() < 2 {
        eprintln!("Usage: glyph_compiler <compile|execute> [--drm]");
        std::process::exit(1);
    }

    match args[1].as_str() {
        "compile" => compile_command(),
        "execute" => execute_command(),
        _ => {
            eprintln!("Unknown command: {}", args[1]);
            std::process::exit(1);
        }
    }
}

fn compile_command() {
    // Read JSON from stdin
    let mut input = String::new();
    io::stdin()
        .read_to_string(&mut input)
        .expect("Failed to read stdin");

    let json: JsonProgram = serde_json::from_str(&input).expect("Invalid JSON");

    // Convert to GlyphProgram
    let program = GlyphProgram {
        glyphs: json
            .glyphs
            .into_iter()
            .map(|g| Glyph {
                opcode: g.opcode,
                p1: g.p1,
                p2: g.p2,
                dst: g.dst,
            })
            .collect(),
    };

    // Compile to SPIR-V
    let mut builder = BinaryBuilder::new();
    let spirv = builder.compile(&program);

    // Output as JSON (for now, just size info)
    let output = serde_json::json!({
        "spirv_size": spirv.len() * 4,
        "word_count": spirv.len(),
        "magic": format!("0x{:08x}", spirv[0]),
    });

    println!("{}", serde_json::to_string(&output).unwrap());
}

fn execute_command() {
    let args: Vec<String> = std::env::args().collect();
    let use_drm = args.contains(&"--drm".to_string());

    // Read JSON from stdin
    let mut input = String::new();
    io::stdin()
        .read_to_string(&mut input)
        .expect("Failed to read stdin");

    let json: JsonProgram = match serde_json::from_str(&input) {
        Ok(j) => j,
        Err(e) => {
            eprintln!("JSON parse error: {}", e);
            std::process::exit(1);
        }
    };

    // Convert to GlyphProgram
    let program = GlyphProgram {
        glyphs: json
            .glyphs
            .into_iter()
            .map(|g| Glyph {
                opcode: g.opcode,
                p1: g.p1,
                p2: g.p2,
                dst: g.dst,
            })
            .collect(),
    };

    // Compile to SPIR-V
    let mut builder = BinaryBuilder::new();
    let spirv = builder.compile(&program);

    if use_drm {
        #[cfg(feature = "drm")]
        {
            match execute_via_drm(&spirv) {
                Ok(output) => println!("{}", serde_json::to_string(&output).unwrap()),
                Err(e) => {
                    eprintln!("DRM execution error: {}", e);
                    std::process::exit(1);
                }
            }
        }
        #[cfg(not(feature = "drm"))]
        {
            eprintln!("DRM support not compiled in. Rebuild with --features drm");
            std::process::exit(1);
        }
    } else {
        // Standard output
        let output = serde_json::json!({
            "spirv_size": spirv.len() * 4,
            "word_count": spirv.len(),
            "magic": format!("0x{:08x}", spirv[0]),
        });
        println!("{}", serde_json::to_string(&output).unwrap());
    }
}

#[cfg(feature = "drm")]
fn execute_via_drm(spirv: &[u32]) -> Result<serde_json::Value, String> {
    // For now, just return SPIR-V info with drm flag set
    // Full DRM execution would require async runtime
    Ok(serde_json::json!({
        "spirv_size": spirv.len() * 4,
        "word_count": spirv.len(),
        "magic": format!("0x{:08x}", spirv[0]),
        "drm": true,
        "status": "compiled_for_drm",
    }))
}
