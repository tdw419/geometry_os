//! Boot-to-Glyph Binary
//!
//! Boots directly into a glyph program, bypassing X11/Wayland.
//! Requires the `drm` feature to be enabled.

#[cfg(feature = "drm")]
use clap::Parser;
#[cfg(feature = "drm")]
use glyph_framework_rs::{AppCoordinator, AppLayout, DrmBackend};
#[cfg(feature = "drm")]
use std::path::PathBuf;

#[cfg(feature = "drm")]
#[derive(Parser, Debug)]
#[command(author, version, about, long_about = None)]
struct Args {
    /// Path to the glyph program JSON file
    #[arg(short, long)]
    app: PathBuf,

    /// DRM device path (default: /dev/dri/card0)
    #[arg(short, long, default_value = "/dev/dri/card0")]
    device: String,
}

#[cfg(feature = "drm")]
#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    env_logger::init();
    let args = Args::parse();

    log::info!("🚀 Booting to Glyph on {}", args.device);

    // 1. Initialize DrmBackend
    let backend = DrmBackend::new().await?;
    let mut coordinator = AppCoordinator::new(backend)?;

    // 2. Load glyph program
    let program_json = std::fs::read_to_string(&args.app)?;
    let program: serde_json::Value = serde_json::from_str(&program_json)?;

    // Convert to flat format for DrmGlyphExecutor
    let glyphs_val = program.get("glyphs").ok_or("No glyphs in program")?;
    let mut spirv_glyphs = Vec::new();

    if let Some(arr) = glyphs_val.as_array() {
        for g in arr {
            let opcode = g.get("opcode").and_then(|v| v.as_u64()).unwrap_or(0) as u32;
            let p1 = g.get("p1").and_then(|v| v.as_f64()).unwrap_or(0.0) as f32;
            let p2 = g.get("p2").and_then(|v| v.as_f64()).unwrap_or(0.0) as f32;
            let dst = g.get("dst").and_then(|v| v.as_u64()).unwrap_or(0) as u32;

            spirv_glyphs.push(glyph_compiler::Glyph { opcode, p1, p2, dst });
        }
    } else {
        return Err("Invalid glyphs format (expected array)".into());
    }

    let glyph_program = glyph_compiler::GlyphProgram { glyphs: spirv_glyphs };
    let mut builder = glyph_compiler::BinaryBuilder::new();
    let spirv = builder.compile(&glyph_program);

    // 3. Spawn WindowManager (App #0)
    let wm_layout = AppLayout { x: 0, y: 0, width: 32, height: 32 };
    let wm_id = coordinator.spawn_app("window_manager", wm_layout)?;

    // Load WindowManager program
    let wm_json = std::fs::read_to_string("examples/window_manager.glyph")?;
    let wm_spirv = compile_glyph_json(&wm_json)?;
    coordinator.load_spirv(wm_id, &wm_spirv)?;

    // 4. Initialize WindowManager Memory (Region Table)
    // App 1: 100, 100, 400, 300, ID=1.0
    coordinator.set_state(wm_id, 10, 1.0)?; // APP_COUNT = 1
    coordinator.set_state(wm_id, 20, 100.0)?; // X
    coordinator.set_state(wm_id, 21, 100.0)?; // Y
    coordinator.set_state(wm_id, 22, 400.0)?; // W
    coordinator.set_state(wm_id, 23, 300.0)?; // H
    coordinator.set_state(wm_id, 24, 1.0)?;   // ID

    // 5. Spawn test app (App #1)
    let app_layout = AppLayout { x: 100, y: 100, width: 400, height: 300 };
    let app_id = coordinator.spawn_app("test_app", app_layout)?;
    coordinator.load_spirv(app_id, &spirv)?;

    log::info!("✅ Apps spawned. App #0: WM, App #1: Test App.");
    log::info!("Simulation: Move mouse to (150, 150) and click...");

    // 6. Main loop
    let mut click_simulated = false;
    loop {
        if !click_simulated {
            // Simulate mouse state in WM memory
            coordinator.set_state(wm_id, 1, 150.0)?; // MOUSE_X
            coordinator.set_state(wm_id, 1, 150.0)?; // MOUSE_Y
            coordinator.set_state(wm_id, 2, 1.0)?;   // MOUSE_BTN
            click_simulated = true;
        }

        coordinator.step()?;
        coordinator.sync_spatial_state()?;

        // In a real DRM loop we'd wait for page flip or VSync
        tokio::time::sleep(std::time::Duration::from_millis(16)).await;
    }
}

#[cfg(feature = "drm")]
fn compile_glyph_json(json: &str) -> Result<Vec<u32>, Box<dyn std::error::Error>> {
    let program: serde_json::Value = serde_json::from_str(json)?;
    let glyphs_val = program.get("glyphs").ok_or("No glyphs in program")?;
    let mut spirv_glyphs = Vec::new();

    if let Some(arr) = glyphs_val.as_array() {
        for g in arr {
            let opcode = g.get("opcode").and_then(|v| v.as_u64()).unwrap_or(0) as u32;
            let p1 = g.get("p1").and_then(|v| v.as_f64()).unwrap_or(0.0) as f32;
            let p2 = g.get("p2").and_then(|v| v.as_f64()).unwrap_or(0.0) as f32;
            let dst = g.get("dst").and_then(|v| v.as_u64()).unwrap_or(0) as u32;
            spirv_glyphs.push(glyph_compiler::Glyph { opcode, p1, p2, dst });
        }
    }

    let glyph_program = glyph_compiler::GlyphProgram { glyphs: spirv_glyphs };
    let mut builder = glyph_compiler::BinaryBuilder::new();
    Ok(builder.compile(&glyph_program))
}

// When drm feature is not enabled, provide a helpful error
#[cfg(not(feature = "drm"))]
fn main() {
    eprintln!("Error: boot_to_glyph requires the 'drm' feature to be enabled.");
    eprintln!("Rebuild with: cargo build --features drm --bin boot_to_glyph");
    std::process::exit(1);
}
