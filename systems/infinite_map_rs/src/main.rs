use anyhow::Result;
use std::sync::{Arc, Mutex};
use std::time::Instant;

use smithay::reexports::wayland_server::Display;

use infinite_map_rs::backend::winit::WinitBackend;
use infinite_map_rs::compositor_state::GeometryCompositorState;

#[tokio::main]
async fn main() -> Result<()> {
    env_logger::init();
    log::info!("🚀 Starting Geometry OS Infinite Map (Rust)...");

    // 1. Initialize Wayland Display
    let display = Display::<GeometryCompositorState>::new()?;
    let dh = display.handle();

    // 2. Initialize Compositor State
    let mut state = GeometryCompositorState::new(dh);

    // 3. Initialize Winit Backend
    let mut backend = WinitBackend::new();

    log::info!("🪟 Window created, entering main loop...");

    // Phase 41.5: Initialize and Start GlyphStratum API Server
    let runtime_state = std::sync::Arc::new(std::sync::Mutex::new(
        infinite_map_rs::api_server::RuntimeState::default(),
    ));
    let synaptic_layer = std::sync::Arc::new(std::sync::Mutex::new(
        infinite_map_rs::synapse::SynapticLayer::new(),
    ));
    // let glyph_stratum_engine = std::sync::Arc::new(std::sync::Mutex::new(infinite_map_rs::glyph_stratum::GlyphStratumEngine::new(80, 40)));

    let rs_clone = std::sync::Arc::clone(&runtime_state);
    let sl_clone = std::sync::Arc::clone(&synaptic_layer);
    // let ge_clone = std::sync::Arc::clone(&glyph_stratum_engine);

    tokio::spawn(async move {
        infinite_map_rs::api_server::start_api_server(
            3000,
            std::path::PathBuf::from("maps/default"),
            rs_clone,
            sl_clone,
            // ge_clone
        )
        .await;
    });
    log::info!("🚀 GlyphStratum API Server active on port 3000");

    // 4. Run the loop
    // The actual rendering happens in WinitBackend::run via the calloop idle callback
    // and the compositor state's render logic
    let last_update = Arc::new(Mutex::new(Instant::now()));
    let last_update_clone = Arc::clone(&last_update);
    backend.run(display, state, move |state, _graphics_backend, event| {
        // Update Wave-Logic Unit on every frame (approximated by event loop iterations)
        let now = Instant::now();
        let dt = {
            let mut last = last_update_clone.lock().unwrap();
            let dt = now.duration_since(*last).as_secs_f32();
            *last = now;
            dt
        };

        if let Some(app) = state.app.as_deref_mut() {
            app.update_wave_logic_unit(dt);
        }

        match event {
            smithay::backend::winit::WinitEvent::CloseRequested => {
                log::info!("Shutdown requested");
                std::process::exit(0);
            },
            smithay::backend::winit::WinitEvent::Resized { size, scale_factor } => {
                log::info!("Window resized: {:?} (scale: {})", size, scale_factor);
            },
            smithay::backend::winit::WinitEvent::Input(_) => {
                // Input events handled by compositor state
            },
            _ => {},
        }
    });

    Ok(())
}
