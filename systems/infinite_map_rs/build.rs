//! Build script for compiling WGSL shaders to SPIR-V
//!
//! This pre-compiles shaders at build time for:
//! - Faster startup (no runtime WGSL parsing)
//! - Driver optimization (specialization constants)
//! - Smaller binary (no shader source strings)

use std::env;
use std::fs;
use std::path::{Path, PathBuf};

fn main() {
    println!("cargo:rerun-if-changed=shaders/");
    println!("cargo:rerun-if-changed=build.rs");

    let out_dir = PathBuf::from(env::var("OUT_DIR").unwrap());
    let manifest_dir = PathBuf::from(env::var("CARGO_MANIFEST_DIR").unwrap());
    let shaders_dir = manifest_dir.join("shaders");

    // Create output directory for SPIR-V
    let spv_dir = out_dir.join("spirv");
    fs::create_dir_all(&spv_dir).expect("Failed to create SPIR-V output directory");

    // Priority shaders (most performance-critical)
    let priority_shaders = [
        "riscv_executor.wgsl",
        "riscv_linux_vm.wgsl",
        "pixel_cpu.wgsl",
        "visual_cpu.wgsl",
        "cortex_compute.wgsl",
        "tectonic_kernel.wgsl",
        "geometric_programming.wgsl",
        "terminal_renderer.wgsl",
    ];

    println!("cargo:warning=Compiling WGSL shaders to SPIR-V...");
    let mut compiled_count = 0;

    for shader in &priority_shaders {
        let shader_path = shaders_dir.join(shader);
        if shader_path.exists() {
            if compile_wgsl_to_spirv_with_naga(&shader_path, &spv_dir) {
                compiled_count += 1;
            }
        }
    }

    // Compile remaining shaders
    if let Ok(entries) = fs::read_dir(&shaders_dir) {
        for entry in entries.flatten() {
            let path = entry.path();
            if path.extension().map_or(false, |ext| ext == "wgsl") {
                let name = path.file_name().unwrap().to_str().unwrap();
                if !priority_shaders.contains(&name) {
                    if compile_wgsl_to_spirv_with_naga(&path, &spv_dir) {
                        compiled_count += 1;
                    }
                }
            }
        }
    }

    // Set environment variable for runtime discovery
    println!("cargo:rustc-env=SPIRV_DIR={}", spv_dir.display());
    println!("cargo:warning=Compiled {} shaders to SPIR-V", compiled_count);

    // Generate shader manifest
    generate_shader_manifest(&spv_dir, &out_dir);
}

/// Compile WGSL to SPIR-V using naga library
fn compile_wgsl_to_spirv_with_naga(wgsl_path: &Path, output_dir: &Path) -> bool {
    use std::io::Write;

    let shader_name = wgsl_path.file_stem().unwrap().to_str().unwrap();
    let spv_path = output_dir.join(format!("{}.spv", shader_name));

    println!("cargo:warning=  Compiling: {}...", shader_name);

    // Read WGSL source
    let source = match fs::read_to_string(wgsl_path) {
        Ok(s) => s,
        Err(e) => {
            println!("cargo:warning=    ✗ Failed to read: {}", e);
            return false;
        }
    };

    // Parse WGSL using naga
    let module = match naga::front::wgsl::parse_str(&source) {
        Ok(m) => m,
        Err(e) => {
            // Log parse errors but don't fail the build
            println!("cargo:warning=    ⚠ Parse error (using WGSL at runtime): {:?}", e);
            return false;
        }
    };

    // Validate module
    let mut validator = naga::valid::Validator::new(
        naga::valid::ValidationFlags::all(),
        naga::valid::Capabilities::all(),
    );

    let module_info = match validator.validate(&module) {
        Ok(info) => info,
        Err(e) => {
            println!("cargo:warning=    ⚠ Validation error: {:?}", e);
            return false;
        }
    };

    // Generate SPIR-V
    let mut writer_flags = naga::back::spv::WriterFlags::empty();
    writer_flags.set(naga::back::spv::WriterFlags::DEBUG, true);

    let options = naga::back::spv::Options {
        flags: writer_flags,
        ..Default::default()
    };

    let spv_bytes = match naga::back::spv::write_vec(&module, &module_info, &options, None) {
        Ok(bytes) => bytes,
        Err(e) => {
            println!("cargo:warning=    ✗ SPIR-V generation failed: {:?}", e);
            return false;
        }
    };

    // Write SPIR-V binary
    let mut file = match fs::File::create(&spv_path) {
        Ok(f) => f,
        Err(e) => {
            println!("cargo:warning=    ✗ Failed to create output: {}", e);
            return false;
        }
    };

    // Calculate size before moving
    let size_bytes = spv_bytes.len() * 4;

    // Write as u32 words
    for word in spv_bytes {
        if file.write_all(&word.to_le_bytes()).is_err() {
            println!("cargo:warning=    ✗ Failed to write output");
            return false;
        }
    }

    println!("cargo:warning=    ✓ {} bytes", size_bytes);
    true
}

fn generate_shader_manifest(spv_dir: &Path, out_dir: &Path) {
    let manifest_path = out_dir.join("shader_manifest.json");

    let mut shaders = Vec::new();

    if let Ok(entries) = fs::read_dir(spv_dir) {
        for entry in entries.flatten() {
            let path = entry.path();
            if path.extension().map_or(false, |ext| ext == "spv") {
                if let Some(name) = path.file_stem() {
                    if let Ok(metadata) = entry.metadata() {
                        shaders.push(serde_json::json!({
                            "name": name.to_str().unwrap(),
                            "path": path.to_str().unwrap(),
                            "size": metadata.len(),
                        }));
                    }
                }
            }
        }
    }

    let manifest = serde_json::json!({
        "version": 1,
        "shaders": shaders,
        "generated_at": chrono::Utc::now().to_rfc3339(),
    });

    if let Ok(json) = serde_json::to_string_pretty(&manifest) {
        let _ = fs::write(&manifest_path, json);
        println!("cargo:warning=Generated shader manifest: {:?}", manifest_path);
    }
}
