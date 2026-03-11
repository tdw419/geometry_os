use anyhow::Result;

use smithay::reexports::wayland_server::Display;
use smithay::backend::winit::WinitGraphicsBackend;
use smithay::backend::renderer::gles::GlesRenderer;

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
    let state = GeometryCompositorState::new(dh);

    // 3. Initialize Winit Backend
    let mut backend = WinitBackend::new();

    log::info!("🪟 Window created, entering main loop...");

    // 4. Run the loop
    // The actual rendering happens in WinitBackend::run via the calloop idle callback
    // and the compositor state's render logic
    backend.run(display, state, |_state, _graphics_backend, event| {
        match event {
            smithay::backend::winit::WinitEvent::CloseRequested => {
                log::info!("Shutdown requested");
                std::process::exit(0);
            }
            smithay::backend::winit::WinitEvent::Resized { size, scale_factor } => {
                log::info!("Window resized: {:?} (scale: {})", size, scale_factor);
            }
            smithay::backend::winit::WinitEvent::Input(_) => {
                // Input events handled by compositor state
            }
            _ => {}
        }
    });

    Ok(())
}
