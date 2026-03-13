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
        eprintln!("Usage: glyph_compiler <compile|execute>");
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
    // Execute glyph program via Vulkan or DRM
    #[cfg(feature = "vulkan")]
    {
        use glyph_compiler::VulkanExecutor;

        match VulkanExecutor::new() {
            Ok(executor) => {
                eprintln!("[INFO] Vulkan executor initialized");
                // Would execute SPIR-V here
                eprintln!("[INFO] Execution ready (Vulkan backend)");
                return;
            }
            Err(e) => {
                eprintln!("[WARN] Vulkan not available: {}", e);
            }
        }
    }

    #[cfg(feature = "wgpu")]
    {
        eprintln!("[INFO] wgpu executor available - use 'compile' to generate SPIR-V");
    }

    eprintln!("No GPU backend available. Enable 'vulkan' or 'wgpu' feature.");
    std::process::exit(1);
}
