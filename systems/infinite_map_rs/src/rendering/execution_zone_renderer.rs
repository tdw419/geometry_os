//! Execution Zone Renderer
//!
//! Renders execution zones on the infinite map. Each execution zone represents
//! a GPU compute shader that can be dispatched and rendered to a texture.
//!
//! The renderer:
//! - Maintains a list of execution zones
//! - Renders active zones by dispatching compute shaders
//! - Renders inactive zones with a visual indicator
//! - Blits results to the output texture

use crate::entities::execution_zone::ExecutionZone;
use std::sync::Arc;
use wgpu::{CommandEncoder, Device, Texture, TextureView};

/// Execution Zone Renderer
///
/// Manages rendering of execution zones on the infinite map.
/// Active zones have their compute shaders dispatched and results blitted.
/// Inactive zones show a visual placeholder indicator.
///
/// # Device Storage Pattern
///
/// The `device` field is stored as `Arc<Device>` to allow sharing with
/// the parent `Compositor` without cloning the heavyweight device resource.
/// See `Compositor` struct documentation for more details on this pattern.
#[derive(Debug)]
pub struct ExecutionZoneRenderer {
    /// WebGPU device for rendering operations
    ///
    /// Stored as Arc to share ownership with the Compositor. This is needed
    /// for encoding render commands and managing GPU resources during the
    /// rendering process.
    device: Arc<Device>,
    /// Collection of execution zones to render
    zones: Vec<ExecutionZone>,
}

impl ExecutionZoneRenderer {
    /// Create a new execution zone renderer
    ///
    /// # Arguments
    ///
    /// * `device` - WebGPU device for rendering operations
    ///
    /// # Returns
    ///
    /// A new ExecutionZoneRenderer instance
    pub fn new(device: Arc<Device>) -> Self {
        Self {
            device,
            zones: Vec::new(),
        }
    }

    /// Add an execution zone to the renderer
    ///
    /// # Arguments
    ///
    /// * `zone` - ExecutionZone to add
    ///
    /// # TODO
    ///
    /// This method should return `Result<(), RenderError>` to handle potential
    /// failures such as duplicate zones, invalid zone configurations, or
    /// resource allocation failures.
    pub fn add_zone(&mut self, zone: ExecutionZone) {
        log::info!(
            "Adding execution zone '{}' at ({}, {})",
            zone.shader_name,
            zone.position.x,
            zone.position.y
        );
        self.zones.push(zone);
    }

    /// Add an execution zone to the renderer (by reference)
    ///
    /// This is a convenience method that clones the zone.
    ///
    /// # Arguments
    ///
    /// * `zone` - Reference to ExecutionZone to add
    pub fn add_zone_ref(&mut self, zone: &ExecutionZone) {
        self.add_zone(zone.clone());
    }

    /// Render all execution zones
    ///
    /// Iterates through all zones and renders them based on their active state.
    /// Active zones have their compute shaders dispatched.
    /// Inactive zones show a visual indicator.
    ///
    /// # Arguments
    ///
    /// * `encoder` - Command encoder for recording rendering commands
    /// * `output_texture` - Output texture to blit results to
    ///
    /// # TODO
    ///
    /// This method should return `Result<(), RenderError>` to handle potential
    /// rendering failures such as pipeline creation errors, resource binding
    /// failures, or command encoding errors.
    pub fn render(&mut self, encoder: &mut CommandEncoder, output_texture: &Texture) {
        for zone in &self.zones {
            if zone.is_active() {
                self.render_zone(encoder, zone);
            } else {
                self.render_inactive_indicator(encoder, zone);
            }
        }

        // Blit all active zone results to output texture
        for zone in &self.zones {
            if zone.is_active() {
                self.blit_results(encoder, zone, output_texture);
            }
        }
    }

    /// Render an active execution zone
    ///
    /// Dispatches the compute shader and blits results to the output.
    /// Also generates overlay text with metrics for the active zone.
    ///
    /// # Arguments
    ///
    /// * `encoder` - Command encoder for recording rendering commands
    /// * `zone` - The active execution zone to render
    ///
    /// # TODO
    ///
    /// This method should return `Result<(), RenderError>` to handle potential
    /// failures such as shader compilation errors, pipeline binding failures,
    /// or dispatch errors.
    fn render_zone(&self, encoder: &mut CommandEncoder, zone: &ExecutionZone) {
        use crate::ui::zone_overlay::{
            generate_zone_overlay_text_with_position, render_zone_border,
        };

        log::debug!(
            "Rendering active zone '{}' at ({}, {})",
            zone.shader_name,
            zone.position.x,
            zone.position.y
        );

        // Generate overlay text for the active zone
        let overlay_text = generate_zone_overlay_text_with_position(
            &zone.shader_name,
            zone.workgroup_size(),
            true,
            zone.position,
        );

        log::trace!("Active zone overlay: {}", overlay_text);

        // Generate border rendering configuration for active zone
        let border_config = render_zone_border(zone.position, (256.0, 256.0), true);

        log::trace!(
            "Active zone border bounds: ({}, {}, {}, {})",
            border_config.bounds().0,
            border_config.bounds().1,
            border_config.bounds().2,
            border_config.bounds().3
        );

        // Dispatch the compute shader
        self.dispatch_shader(encoder, zone);

        // Note: Blitting is done in the main render loop after all zones are dispatched
        // This ensures all compute passes complete before blitting

        // TODO: Render overlay text and border
        // This would integrate with the text engine to display
        // the overlay_text and border_config on screen
    }

    /// Render an inactive zone indicator
    ///
    /// Shows a visual placeholder for zones that haven't been compiled yet.
    /// Generates overlay text with zone information for visual feedback.
    ///
    /// # Arguments
    ///
    /// * `encoder` - Command encoder for recording rendering commands
    /// * `zone` - The inactive execution zone
    fn render_inactive_indicator(&self, _encoder: &mut CommandEncoder, zone: &ExecutionZone) {
        use crate::ui::zone_overlay::{
            generate_zone_overlay_text_with_position, render_zone_border,
        };

        log::debug!(
            "Rendering inactive indicator for zone '{}' at ({}, {})",
            zone.shader_name,
            zone.position.x,
            zone.position.y
        );

        // Generate overlay text for the inactive zone
        let overlay_text = generate_zone_overlay_text_with_position(
            &zone.shader_name,
            zone.workgroup_size(),
            false,
            zone.position,
        );

        log::trace!("Inactive zone overlay: {}", overlay_text);

        // Generate border rendering configuration
        let border_config = render_zone_border(zone.position, (256.0, 256.0), false);

        log::trace!(
            "Zone border bounds: ({}, {}, {}, {})",
            border_config.bounds().0,
            border_config.bounds().1,
            border_config.bounds().2,
            border_config.bounds().3
        );

        // TODO: Implement actual visual indicator rendering
        // This would:
        // 1. Render the border_config using wgpu draw calls
        // 2. Render the overlay_text using the text engine
        // 3. Apply appropriate styling for inactive zones (gray/muted colors)
    }

    /// Dispatch a compute shader for an execution zone
    ///
    /// # Arguments
    ///
    /// * `encoder` - Command encoder for recording rendering commands
    /// * `zone` - The execution zone whose shader to dispatch
    ///
    /// # TODO
    ///
    /// This method should return `Result<(), DispatchError>` to handle potential
    /// failures such as invalid workgroup sizes, missing pipelines, or dispatch
    /// limit exceeded errors.
    fn dispatch_shader(&self, encoder: &mut CommandEncoder, zone: &ExecutionZone) {
        let workgroup_size = zone.workgroup_size();
        log::trace!(
            "Dispatching shader '{}' with workgroup size ({}, {}, {})",
            zone.shader_name,
            workgroup_size.0,
            workgroup_size.1,
            workgroup_size.2
        );

        // Get the compiled pipeline from the zone
        if let Some(pipeline) = zone.pipeline() {
            let mut compute_pass = encoder.begin_compute_pass(&wgpu::ComputePassDescriptor {
                label: Some(&format!("ExecutionZone: {}", zone.shader_name)),
                timestamp_writes: None,
            });

            compute_pass.set_pipeline(&pipeline);
            // Note: Bind groups would be set here if the shader has resources
            // For simple shaders with no bindings, we dispatch directly
            compute_pass.dispatch_workgroups(workgroup_size.0, workgroup_size.1, workgroup_size.2);

            log::debug!(
                "Dispatched compute pass for '{}' with {}x{}x{} workgroups",
                zone.shader_name,
                workgroup_size.0,
                workgroup_size.1,
                workgroup_size.2
            );
        } else {
            log::warn!(
                "Zone '{}' has no compiled pipeline - skipping dispatch",
                zone.shader_name
            );
        }
    }

    /// Blit compute shader results to output texture
    ///
    /// # Arguments
    ///
    /// * `encoder` - Command encoder for recording rendering commands
    /// * `zone` - The execution zone whose results to blit
    /// * `output_texture` - Destination texture to blit results to
    ///
    /// # TODO
    ///
    /// This method should return `Result<(), BlitError>` to handle potential
    /// failures such as texture format mismatches, out-of-bounds blit regions,
    /// or missing source textures.
    fn blit_results(&self, encoder: &mut CommandEncoder, zone: &ExecutionZone, output_texture: &Texture) {
        log::trace!(
            "Blitting results for zone '{}' at ({}, {})",
            zone.shader_name,
            zone.position.x,
            zone.position.y
        );

        // Check if zone has an output texture
        if let Some(source_texture) = zone.texture() {
            use wgpu::{Extent3d, ImageCopyTexture, Origin3d};

            // Calculate blit region based on zone position
            // Each zone is 256x256 pixels (standard execution zone size)
            let zone_size = 256u32;
            let copy_size = Extent3d {
                width: zone_size,
                height: zone_size,
                depth_or_array_layers: 1,
            };

            // Source: zone's compute output texture
            let source = ImageCopyTexture {
                texture: &source_texture,
                mip_level: 0,
                origin: Origin3d::ZERO,
                aspect: wgpu::TextureAspect::All,
            };

            // Destination: output texture at zone position
            let dest_x = zone.position.x as u32;
            let dest_y = zone.position.y as u32;
            let dest = ImageCopyTexture {
                texture: output_texture,
                mip_level: 0,
                origin: Origin3d { x: dest_x, y: dest_y, z: 0 },
                aspect: wgpu::TextureAspect::All,
            };

            // Perform the blit
            encoder.copy_texture_to_texture(source, dest, copy_size);

            log::debug!(
                "Blitted zone '{}' results to ({}, {})",
                zone.shader_name,
                dest_x,
                dest_y
            );
        } else {
            log::trace!(
                "Zone '{}' has no output texture - skipping blit",
                zone.shader_name
            );
        }
    }

    /// Get reference to the WebGPU device
    ///
    /// # Returns
    ///
    /// Reference to the WebGPU device
    pub fn device(&self) -> &Arc<Device> {
        &self.device
    }

    /// Get the number of zones being managed
    ///
    /// # Returns
    ///
    /// Number of zones
    pub fn zone_count(&self) -> usize {
        self.zones.len()
    }

    /// Get reference to the zones collection
    ///
    /// # Returns
    ///
    /// Reference to the zones vector
    pub fn zones(&self) -> &[ExecutionZone] {
        &self.zones
    }

    /// Get mutable reference to the zones collection
    ///
    /// # Returns
    ///
    /// Mutable reference to the zones vector
    ///
    /// # Encapsulation Note
    ///
    /// This method provides direct mutable access to the zones collection,
    /// which breaks normal encapsulation boundaries. This level of access
    /// is provided for:
    /// 1. Advanced operations that need to modify zones in bulk
    /// 2. Testing scenarios that need to manipulate zone state directly
    /// 3. Internal compositor operations that need synchronized access
    ///
    /// When using this method, ensure that any modifications maintain the
    /// rendering invariants expected by the renderer.
    pub fn zones_mut(&mut self) -> &mut [ExecutionZone] {
        &mut self.zones
    }
}

// Include tests from separate file
#[path = "execution_zone_renderer_tests.rs"]
mod tests;
