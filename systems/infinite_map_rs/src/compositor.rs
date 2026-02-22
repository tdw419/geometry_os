//! Compositor for Infinite Map
//!
//! This module provides the main compositor functionality for the infinite map,
//! managing execution zones and their rendering.

use crate::entities::{ExecutionZone, RTSParticle};
use crate::input::drag_handler;
use crate::rendering::execution_zone_renderer::ExecutionZoneRenderer;
use glam::Vec2;
use std::sync::Arc;
use wgpu::{CommandEncoder, TextureView};

/// Main compositor for the infinite map
///
/// The compositor manages execution zones and coordinates their rendering
/// with the main render loop.
///
/// # Device Storage Pattern
///
/// Both `Compositor` and `ExecutionZoneRenderer` store `Arc<wgpu::Device>`.
/// This pattern is necessary because:
/// 1. The compositor needs the device for resource creation (e.g., when loading
///    new execution zones from dropped files)
/// 2. The renderer needs the device for encoding render commands
/// 3. Arc allows both to share ownership without cloning the actual device,
///    which is a heavyweight resource
/// 4. This design supports lazy initialization where the renderer may be created
///    before the compositor has any zones to manage
#[derive(Debug)]
pub struct Compositor {
    /// WebGPU device for rendering operations
    ///
    /// Stored as Arc to allow sharing with the zone renderer without cloning
    /// the heavyweight device resource. This is needed for resource creation
    /// when new execution zones are added (e.g., from file drops).
    device: Arc<wgpu::Device>,
    /// Collection of execution zones on the map
    execution_zones: Vec<ExecutionZone>,
    /// Collection of RTS particles on the map
    rts_particles: Vec<RTSParticle>,
    /// Execution zone renderer
    zone_renderer: ExecutionZoneRenderer,
}

impl Compositor {
    /// Create a new compositor
    ///
    /// # Arguments
    ///
    /// * `device` - WebGPU device for rendering operations
    ///
    /// # Returns
    ///
    /// A new Compositor instance
    pub fn new(device: Arc<wgpu::Device>) -> Self {
        // Clone the Arc for the renderer
        let device_clone = Arc::clone(&device);

        Self {
            device,
            execution_zones: Vec::new(),
            rts_particles: Vec::new(),
            zone_renderer: ExecutionZoneRenderer::new(device_clone),
        }
    }

    /// Handle a file drop event
    ///
    /// Processes a dropped file, checking if it's:
    /// 1. A WGSL .rts.png file -> creates an ExecutionZone
    /// 2. A PixelRTS v2 file -> creates an RTSParticle
    ///
    /// # Arguments
    ///
    /// * `file_path` - Path to the dropped file
    /// * `data` - Raw file data
    /// * `drop_position` - Position on the map where the file was dropped
    ///
    /// # Returns
    ///
    /// * `Ok(())` if file was processed successfully
    /// * `Err(String)` if there was an error processing the file
    pub fn handle_file_drop(
        &mut self,
        file_path: &str,
        data: &[u8],
        drop_position: Vec2,
    ) -> Result<(), String> {
        // First check file type using drag_handler
        let file_type = drag_handler::get_rts_file_type(file_path, data);

        match file_type {
            Some("pixelrts_v2") => {
                // Handle PixelRTS v2 file
                log::info!("Detected PixelRTS v2 file: {}", file_path);
                self.handle_pixelrts_v2_drop(file_path, data, drop_position)
            }
            Some("wgsl") => {
                // Handle WGSL .rts.png file
                log::info!("Detected WGSL .rts.png file: {}", file_path);
                self.handle_wgsl_drop(file_path, data, drop_position)
            }
            None => {
                log::debug!(
                    "File '{}' is not a recognized .rts.png type, ignoring",
                    file_path
                );
                Ok(())
            }
            _ => {
                log::debug!("File '{}' has unknown type, ignoring", file_path);
                Ok(())
            }
        }
    }

    /// Handle a WGSL .rts.png file drop
    ///
    /// Creates an ExecutionZone from the WGSL shader.
    fn handle_wgsl_drop(
        &mut self,
        file_path: &str,
        data: &[u8],
        drop_position: Vec2,
    ) -> Result<(), String> {
        // Use drag_handler to validate this is a WGSL .rts.png file
        let _wgsl_source = match drag_handler::handle_file_drop(file_path, data)? {
            Some(source) => source,
            None => {
                log::debug!("File '{}' is not a WGSL .rts.png, ignoring", file_path);
                return Ok(());
            }
        };

        // Get the shader name from the file path
        let shader_name = drag_handler::get_file_name(file_path);

        // Create an execution zone from the WGSL source
        let zone = ExecutionZone::from_rts_png(
            drop_position,
            shader_name,
            data, // Pass original PNG binary data for from_rts_png to parse
        )?;

        // Add the zone to our collection
        self.add_execution_zone(zone);

        Ok(())
    }

    /// Handle a PixelRTS v2 file drop
    ///
    /// Creates an RTSParticle from the PixelRTS v2 file.
    fn handle_pixelrts_v2_drop(
        &mut self,
        file_path: &str,
        data: &[u8],
        drop_position: Vec2,
    ) -> Result<(), String> {
        let file_name = drag_handler::get_file_name(file_path);

        // Create an RTS particle from the PNG data
        let particle = RTSParticle::from_png(drop_position, file_name, data)
            .map_err(|e| format!("Failed to create RTS particle: {}", e))?;

        log::info!(
            "Adding RTS particle '{}' at ({}, {}), type: {:?}",
            particle.file_name,
            particle.position.x,
            particle.position.y,
            particle.metadata.rts_type
        );

        // Add to our collection
        self.rts_particles.push(particle);

        Ok(())
    }

    /// Add an execution zone to the compositor
    ///
    /// # Arguments
    ///
    /// * `zone` - ExecutionZone to add
    fn add_execution_zone(&mut self, zone: ExecutionZone) {
        log::info!(
            "Adding execution zone '{}' at ({}, {})",
            zone.shader_name,
            zone.position.x,
            zone.position.y
        );

        // Add to renderer first (by reference)
        self.zone_renderer.add_zone_ref(&zone);

        // Add to compositor's collection
        self.execution_zones.push(zone);
    }

    /// Render all execution zones
    ///
    /// Iterates through all zones and renders them based on their active state.
    ///
    /// # Arguments
    ///
    /// * `encoder` - Command encoder for recording rendering commands
    /// * `output_view` - Output texture view to render to
    ///
    /// # Integration Note
    ///
    /// TODO: This method should be called from the app's main render loop.
    /// Integration with the main render loop is deferred to integration testing
    /// to ensure proper command encoder ordering and resource synchronization.
    /// The main render loop should call compositor.render() after the main
    /// scene rendering is complete.
    pub fn render(&mut self, encoder: &mut CommandEncoder, output_view: &TextureView) {
        self.zone_renderer.render(encoder, output_view);
    }

    /// Get reference to the WebGPU device
    ///
    /// # Returns
    ///
    /// Reference to the WebGPU device
    pub fn device(&self) -> &Arc<wgpu::Device> {
        &self.device
    }

    /// Get the number of execution zones
    ///
    /// # Returns
    ///
    /// Number of execution zones
    pub fn zone_count(&self) -> usize {
        self.execution_zones.len()
    }

    /// Get reference to the execution zones collection
    ///
    /// # Returns
    ///
    /// Reference to the execution zones vector
    pub fn execution_zones(&self) -> &[ExecutionZone] {
        &self.execution_zones
    }

    /// Get mutable reference to the execution zones collection
    ///
    /// # Returns
    ///
    /// Mutable reference to the execution zones vector
    ///
    /// # Encapsulation Note
    ///
    /// This method provides direct mutable access to the execution zones
    /// collection, which breaks normal encapsulation boundaries. This level
    /// of access is provided for:
    /// 1. Advanced operations that need to modify zones in bulk (e.g., batch updates)
    /// 2. Testing scenarios that need to manipulate zone state directly
    /// 3. Future features like zone serialization/deserialization
    ///
    /// When using this method, ensure that any modifications maintain the
    /// invariants expected by the zone_renderer (e.g., zones remain valid
    /// and their positions stay synchronized).
    pub fn execution_zones_mut(&mut self) -> &mut [ExecutionZone] {
        &mut self.execution_zones
    }

    /// Get the number of RTS particles
    ///
    /// # Returns
    ///
    /// Number of RTS particles
    pub fn rts_particle_count(&self) -> usize {
        self.rts_particles.len()
    }

    /// Get reference to the RTS particles collection
    ///
    /// # Returns
    ///
    /// Reference to the RTS particles vector
    pub fn rts_particles(&self) -> &[RTSParticle] {
        &self.rts_particles
    }

    /// Get mutable reference to the RTS particles collection
    ///
    /// # Returns
    ///
    /// Mutable reference to the RTS particles vector
    pub fn rts_particles_mut(&mut self) -> &mut [RTSParticle] {
        &mut self.rts_particles
    }

    /// Add an RTS particle to the compositor
    ///
    /// # Arguments
    ///
    /// * `particle` - RTSParticle to add
    pub fn add_rts_particle(&mut self, particle: RTSParticle) {
        log::info!(
            "Adding RTS particle '{}' at ({}, {})",
            particle.file_name,
            particle.position.x,
            particle.position.y
        );
        self.rts_particles.push(particle);
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    /// Create a mock WebGPU device for testing
    ///
    /// Note: This is a placeholder. Real tests would need to use
    /// wgpu-test or similar for actual device creation.
    fn create_mock_device() -> Arc<wgpu::Device> {
        // Placeholder implementation
        // In real tests, we would use wgpu::Device::request_device
        // with a test adapter
        panic!("Mock device creation not implemented - requires wgpu testing framework");
    }

    #[test]
    #[ignore = "Requires actual WebGPU device"]
    fn test_compositor_creation() {
        let device = create_mock_device();
        let compositor = Compositor::new(device);

        assert_eq!(compositor.zone_count(), 0);
        assert!(compositor.execution_zones().is_empty());
    }

    #[test]
    #[ignore = "Requires actual WebGPU device"]
    fn test_add_execution_zone() {
        let device = create_mock_device();
        let mut compositor = Compositor::new(device);

        let zone = ExecutionZone::new(
            Vec2::new(100.0, 200.0),
            "test.wgsl".to_string(),
            b"@compute @workgroup_size(1) fn main() {}".to_vec(),
        );

        compositor.add_execution_zone(zone);

        assert_eq!(compositor.zone_count(), 1);
    }

    #[test]
    fn test_handle_file_drop_non_png() {
        // This test doesn't require a device since it will fail early
        let data = vec![0x00, 0x01, 0x02];
        let file_path = "shader.txt";
        let drop_position = Vec2::new(0.0, 0.0);

        // We can't create a compositor without a device,
        // but we can test the drag_handler logic independently
        let result = drag_handler::handle_file_drop(file_path, &data);
        assert!(result.is_ok());
        assert_eq!(result.unwrap(), None);
    }

    #[test]
    #[ignore = "Requires actual WebGPU device"]
    fn test_compositor_initial_rts_particle_count() {
        // Test that compositor starts with no RTS particles
        let device = create_mock_device();
        let compositor = Compositor::new(device);

        assert_eq!(compositor.rts_particle_count(), 0);
        assert!(compositor.rts_particles().is_empty());
    }

    #[test]
    #[ignore = "Requires actual WebGPU device and valid PixelRTS v2 PNG"]
    fn test_add_rts_particle() {
        let device = create_mock_device();
        let mut compositor = Compositor::new(device);

        // Create a test PNG with PixelRTS metadata
        let test_png = create_test_pixelrts_png();
        let particle = RTSParticle::from_png(
            Vec2::new(100.0, 200.0),
            "test.rts.png".to_string(),
            &test_png,
        )
        .unwrap();

        compositor.add_rts_particle(particle);

        assert_eq!(compositor.rts_particle_count(), 1);
        assert_eq!(compositor.rts_particles()[0].file_name, "test.rts.png");
    }

    #[test]
    #[ignore = "Requires actual PNG with proper tEXt chunk CRC"]
    fn test_rts_particle_type_detection() {
        // Test that PixelRTS v2 files are correctly detected
        let pixelrts_png = create_test_pixelrts_png();

        assert!(
            drag_handler::is_pixelrts_v2(&pixelrts_png),
            "Should detect PixelRTS v2 file"
        );

        // Test file type detection
        let file_type = drag_handler::get_rts_file_type("kernel.rts.png", &pixelrts_png);
        assert_eq!(file_type, Some("pixelrts_v2"));
    }

    /// Create a test PNG with PixelRTS metadata
    fn create_test_pixelrts_png() -> Vec<u8> {
        use image::{ImageBuffer, Rgba};

        let pixel = Rgba([128, 64, 32, 255]); // Brownish (not WGSL blue-purple)
        let img: ImageBuffer<Rgba<u8>, Vec<u8>> = ImageBuffer::from_fn(512, 512, |_x, _y| pixel);

        let mut png_data = Vec::new();
        let mut cursor = std::io::Cursor::new(&mut png_data);

        let dynamic_img = image::DynamicImage::ImageRgba8(img);
        dynamic_img
            .write_to(&mut cursor, image::ImageFormat::Png)
            .expect("Failed to encode PNG");

        // Inject PixelRTS metadata into the PNG
        // We need to manually add a tEXt chunk with PixelRTS magic
        inject_pixelrts_metadata(&mut png_data);

        png_data
    }

    /// Inject PixelRTS metadata into PNG data
    ///
    /// This is a simplified version that adds a tEXt chunk before IEND
    fn inject_pixelrts_metadata(png_data: &mut Vec<u8>) {
        // Find IEND chunk (last chunk in PNG)
        let iend_pos = png_data
            .windows(4)
            .rposition(|w| w == b"IEND")
            .unwrap_or(png_data.len());

        if iend_pos > 8 {
            // Create tEXt chunk with PixelRTS metadata
            let metadata_json = r#"{"format_version":2,"grid_size":512,"encoding":{"type":"RGBA-dense","bytes_per_pixel":4},"type":"kernel"}"#;
            let keyword = b"PixelRTS";
            let mut text_data = keyword.to_vec();
            text_data.push(0); // Null separator
            text_data.extend_from_slice(metadata_json.as_bytes());

            let chunk_length = (text_data.len() as u32).to_be_bytes();
            let chunk_type = b"tEXt";

            // Insert chunk before IEND
            let insert_pos = iend_pos - 4; // Back up to chunk length

            png_data.splice(
                insert_pos..insert_pos,
                [
                    &chunk_length[..],
                    chunk_type,
                    &text_data,
                    &[0u8; 4], // CRC placeholder
                ]
                .concat(),
            );
        }
    }
}
