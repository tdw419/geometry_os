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
use crate::glyph_atlas::GlyphAtlas;
use crate::glyph_substrate::GlyphSubstrate;
use crate::rendering::glyph_renderer::GlyphRenderer;
use crate::ui::zone_overlay::{BorderColor, BorderRenderConfig};
use std::sync::Arc;
use wgpu::{CommandEncoder, Device, Texture, TextureView};

/// Uniform buffer structure for border shader
/// Must match the BorderUniforms struct in border_quad.wgsl
#[repr(C)]
#[derive(Copy, Clone, bytemuck::Pod, bytemuck::Zeroable)]
struct BorderUniforms {
    /// Tile position in world coordinates (top-left)
    tile_pos: [f32; 2],
    /// Tile size in pixels
    tile_size: [f32; 2],
    /// Border thickness in pixels
    border_thickness: f32,
    /// Padding to align to 16 bytes
    _pad1: f32,
    /// Border color (r, g, b, a)
    border_color: [f32; 4],
    /// Screen dimensions
    screen_size: [f32; 2],
    /// Padding to align total struct to 16 bytes
    _pad2: [f32; 2],
}

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
pub struct ExecutionZoneRenderer {
    /// WebGPU device for rendering operations
    ///
    /// Stored as Arc to share ownership with the Compositor. This is needed
    /// for encoding render commands and managing GPU resources during the
    /// rendering process.
    device: Arc<Device>,
    /// WebGPU queue for submitting commands
    queue: Arc<wgpu::Queue>,
    /// Collection of execution zones to render
    zones: Vec<ExecutionZone>,
    /// Border rendering pipeline (lazy-initialized)
    border_pipeline: Option<wgpu::RenderPipeline>,
    /// Border uniform buffer (lazy-initialized)
    border_uniform_buffer: Option<wgpu::Buffer>,
    /// Border bind group (lazy-initialized)
    border_bind_group: Option<wgpu::BindGroup>,
    /// Border bind group layout (lazy-initialized)
    border_bind_group_layout: Option<wgpu::BindGroupLayout>,
    /// Glyph atlas for text rendering (lazy-initialized)
    glyph_atlas: Option<GlyphAtlas>,
    /// Glyph substrate for text rendering (lazy-initialized)
    glyph_substrate: Option<GlyphSubstrate>,
    /// Glyph renderer for text overlay (lazy-initialized)
    glyph_renderer: Option<GlyphRenderer>,
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
    pub fn new(device: Arc<Device>, queue: Arc<wgpu::Queue>) -> Self {
        Self {
            device,
            queue,
            zones: Vec::new(),
            border_pipeline: None,
            border_uniform_buffer: None,
            border_bind_group: None,
            border_bind_group_layout: None,
            glyph_atlas: None,
            glyph_substrate: None,
            glyph_renderer: None,
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

    /// Initialize border rendering pipeline (lazy initialization)
    ///
    /// Creates the border shader pipeline, uniform buffer, and bind groups.
    /// This is called lazily when borders need to be rendered for the first time.
    ///
    /// # Arguments
    ///
    /// * `surface_format` - Texture format of the output surface
    fn initialize_border_pipeline(&mut self, surface_format: wgpu::TextureFormat) {
        // Skip if already initialized
        if self.border_pipeline.is_some() {
            return;
        }

        log::info!("Initializing border rendering pipeline");

        // Load border shader
        let border_shader = self.device.create_shader_module(wgpu::ShaderModuleDescriptor {
            label: Some("Border Shader"),
            source: wgpu::ShaderSource::Wgsl(include_str!("../shaders/border_quad.wgsl").into()),
        });

        // Create bind group layout
        let bind_group_layout = self.device.create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
            label: Some("Border Bind Group Layout"),
            entries: &[
                wgpu::BindGroupLayoutEntry {
                    binding: 0,
                    visibility: wgpu::ShaderStages::VERTEX | wgpu::ShaderStages::FRAGMENT,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Uniform,
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
            ],
        });

        // Create pipeline layout
        let pipeline_layout = self.device.create_pipeline_layout(&wgpu::PipelineLayoutDescriptor {
            label: Some("Border Pipeline Layout"),
            bind_group_layouts: &[&bind_group_layout],
            push_constant_ranges: &[],
        });

        // Create render pipeline
        let pipeline = self.device.create_render_pipeline(&wgpu::RenderPipelineDescriptor {
            label: Some("Border Pipeline"),
            layout: Some(&pipeline_layout),
            vertex: wgpu::VertexState {
                module: &border_shader,
                entry_point: "vs_main",
                buffers: &[],
            },
            fragment: Some(wgpu::FragmentState {
                module: &border_shader,
                entry_point: "fs_main",
                targets: &[Some(wgpu::ColorTargetState {
                    format: surface_format,
                    blend: Some(wgpu::BlendState::ALPHA_BLENDING),
                    write_mask: wgpu::ColorWrites::ALL,
                })],
            }),
            primitive: wgpu::PrimitiveState {
                topology: wgpu::PrimitiveTopology::TriangleList,
                strip_index_format: None,
                front_face: wgpu::FrontFace::Ccw,
                cull_mode: None,
                polygon_mode: wgpu::PolygonMode::Fill,
                unclipped_depth: false,
                conservative: false,
            },
            depth_stencil: None,
            multisample: wgpu::MultisampleState::default(),
            multiview: None,
        });

        // Create uniform buffer (initialized with dummy values)
        let uniform_buffer = self.device.create_buffer(&wgpu::BufferDescriptor {
            label: Some("Border Uniform Buffer"),
            size: std::mem::size_of::<BorderUniforms>() as u64,
            usage: wgpu::BufferUsages::UNIFORM | wgpu::BufferUsages::COPY_DST,
            mapped_at_creation: false,
        });

        // Create bind group
        let bind_group = self.device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("Border Bind Group"),
            layout: &bind_group_layout,
            entries: &[
                wgpu::BindGroupEntry {
                    binding: 0,
                    resource: uniform_buffer.as_entire_binding(),
                },
            ],
        });

        // Store all resources
        self.border_pipeline = Some(pipeline);
        self.border_uniform_buffer = Some(uniform_buffer);
        self.border_bind_group = Some(bind_group);
        self.border_bind_group_layout = Some(bind_group_layout);

        log::info!("Border rendering pipeline initialized successfully");
    }

    /// Initialize glyph rendering pipeline (lazy initialization)
    ///
    /// Creates the GlyphAtlas, GlyphSubstrate, and GlyphRenderer for text overlay.
    /// This is called lazily when text overlays need to be rendered for the first time.
    ///
    /// # Arguments
    ///
    /// * `surface_format` - Texture format of the output surface
    fn initialize_glyph_pipeline(&mut self, surface_format: wgpu::TextureFormat) {
        // Skip if already initialized
        if self.glyph_renderer.is_some() {
            return;
        }

        log::info!("Initializing glyph rendering pipeline for text overlays");

        // Create glyph atlas (64x64 cells for zone labels)
        let atlas = GlyphAtlas::new(64, 64);
        self.glyph_atlas = Some(atlas);

        // Create glyph substrate (order 8 = 256x256 grid)
        let substrate = GlyphSubstrate::new(8);
        self.glyph_substrate = Some(substrate);

        // Create glyph renderer
        // Note: We need to get a reference to the substrate we just created
        if let Some(substrate) = &self.glyph_substrate {
            let renderer = GlyphRenderer::new(&self.device, surface_format, substrate);
            self.glyph_renderer = Some(renderer);
            log::info!("Glyph rendering pipeline initialized successfully");
        }
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

        // Render borders for all zones
        let screen_size = (output_texture.width() as f32, output_texture.height() as f32);
        self.render_borders(encoder, output_texture, screen_size);

        // Render text overlays for all zones
        self.render_text_overlays(encoder, output_texture);
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

        // ENHANCEMENT: Text overlay rendering
        // Border rendering is implemented in render_borders().
        // To add text overlay, integrate TextEngine to render overlay_text at zone position.
        // Requires: (1) TextEngine reference in ExecutionZoneRenderer, (2) Render pass integration
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

        // ENHANCEMENT: Text overlay rendering
        // Border rendering is implemented in render_borders().
        // To add text overlay, integrate TextEngine to render overlay_text at zone position.
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

    /// Render borders for all execution zones
    ///
    /// Creates a render pass and draws borders around all zones.
    /// Active zones get green borders, inactive zones get gray borders.
    ///
    /// # Arguments
    ///
    /// * `encoder` - Command encoder for recording rendering commands
    /// * `output_texture` - Output texture to render borders to
    /// * `screen_size` - Screen dimensions in pixels
    fn render_borders(
        &mut self,
        encoder: &mut CommandEncoder,
        output_texture: &Texture,
        screen_size: (f32, f32),
    ) {
        // Skip if no zones
        if self.zones.is_empty() {
            return;
        }

        // Initialize pipeline if needed
        let surface_format = output_texture.format();
        self.initialize_border_pipeline(surface_format);

        // Get pipeline resources (safe to unwrap after initialization)
        let pipeline = self.border_pipeline.as_ref().unwrap();
        let uniform_buffer = self.border_uniform_buffer.as_ref().unwrap();
        let bind_group = self.border_bind_group.as_ref().unwrap();

        // Create texture view for render pass
        let output_view = output_texture.create_view(&wgpu::TextureViewDescriptor::default());

        // Create render pass with LoadOp::Load to preserve existing content
        let mut render_pass = encoder.begin_render_pass(&wgpu::RenderPassDescriptor {
            label: Some("Border Render Pass"),
            color_attachments: &[Some(wgpu::RenderPassColorAttachment {
                view: &output_view,
                resolve_target: None,
                ops: wgpu::Operations {
                    load: wgpu::LoadOp::Load, // Preserve existing content
                    store: wgpu::StoreOp::Store,
                },
            })],
            depth_stencil_attachment: None,
            timestamp_writes: None,
            occlusion_query_set: None,
        });

        // Set pipeline and bind group
        render_pass.set_pipeline(pipeline);
        render_pass.set_bind_group(0, bind_group, &[]);

        // Render border for each zone
        for zone in &self.zones {
            // Generate border config
            let border_config = crate::ui::zone_overlay::render_zone_border(
                zone.position,
                (256.0, 256.0), // Standard zone size
                zone.pipeline().is_some(), // Active if has pipeline
            );

            // Convert BorderColor to RGBA
            let border_color = match border_config.color {
                BorderColor::Active => [0.2, 0.8, 0.3, 1.0], // Green
                BorderColor::Inactive => [0.5, 0.5, 0.5, 0.8], // Gray
                BorderColor::Error => [0.9, 0.2, 0.2, 1.0], // Red
            };

            // Create uniforms for this zone
            let uniforms = BorderUniforms {
                tile_pos: [border_config.top_left().x, border_config.top_left().y],
                tile_size: [border_config.width, border_config.height],
                border_thickness: border_config.line_width,
                _pad1: 0.0,
                border_color,
                screen_size: [screen_size.0, screen_size.1],
                _pad2: [0.0, 0.0],
            };

            // Update uniform buffer
            // Note: In a production system, we'd use a dynamic uniform buffer
            // or staging buffer for better performance
            self.queue.write_buffer(
                uniform_buffer,
                0,
                bytemuck::cast_slice(&[uniforms]),
            );

            // Draw border (6 vertices for 2 triangles forming a quad)
            render_pass.draw(0..6, 0..1);

            log::trace!(
                "Rendered border for zone '{}' at ({}, {})",
                zone.shader_name,
                zone.position.x,
                zone.position.y
            );
        }

        log::debug!("Rendered borders for {} zones", self.zones.len());
    }

    /// Render text overlays for all zones
    ///
    /// Uses the GlyphAtlas and GlyphRenderer to render zone labels and metrics
    /// as text overlays at each zone's position.
    ///
    /// # Arguments
    ///
    /// * `encoder` - Command encoder for recording rendering commands
    /// * `output_texture` - Output texture to render text to
    fn render_text_overlays(
        &mut self,
        encoder: &mut CommandEncoder,
        output_texture: &Texture,
    ) {
        // Skip if no zones
        if self.zones.is_empty() {
            return;
        }

        // Initialize glyph pipeline if needed
        let surface_format = output_texture.format();
        self.initialize_glyph_pipeline(surface_format);

        // Get glyph renderer (safe to unwrap after initialization)
        if self.glyph_renderer.is_none() || self.glyph_atlas.is_none() || self.glyph_substrate.is_none() {
            log::warn!("Glyph pipeline not fully initialized, skipping text overlays");
            return;
        }

        let screen_width = output_texture.width() as f32;
        let screen_height = output_texture.height() as f32;

        // Collect overlay texts and positions first (to avoid borrow issues)
        let overlays: Vec<(String, f32, f32)> = self.zones
            .iter()
            .filter(|z| z.is_active())
            .map(|zone| {
                let overlay_text = crate::ui::zone_overlay::generate_zone_overlay_text_with_position(
                    &zone.shader_name,
                    zone.workgroup_size(),
                    true,
                    zone.position,
                );
                let zone_screen_x = zone.position.x as f32 * 256.0;
                let zone_screen_y = zone.position.y as f32 * 256.0;
                let overlay_y = zone_screen_y - 30.0;
                (overlay_text, zone_screen_x, overlay_y)
            })
            .collect();

        // Now render each overlay
        for (overlay_text, zone_screen_x, overlay_y) in overlays {
            log::trace!("Rendering text overlay: {}", overlay_text);

            // Render text to substrate
            self.render_text_to_substrate(&overlay_text);

            // Update uniforms for positioned rendering
            let uniforms = GlyphRenderer::create_positioned_uniforms(
                zone_screen_x,
                overlay_y,
                256.0, // Width of overlay
                20.0,  // Height of text line
                screen_width,
                screen_height,
            );

            // Update substrate and uniforms on GPU
            if let (Some(renderer), Some(substrate)) = (&self.glyph_renderer, &self.glyph_substrate) {
                renderer.update_substrate(&self.queue, substrate);
                renderer.set_position(&self.queue, uniforms);

                // Create render pass for text overlay
                {
                    let overlay_view = output_texture.create_view(&wgpu::TextureViewDescriptor::default());
                    let mut render_pass = encoder.begin_render_pass(&wgpu::RenderPassDescriptor {
                        label: Some("Text Overlay Render Pass"),
                        color_attachments: &[Some(wgpu::RenderPassColorAttachment {
                            view: &overlay_view,
                            resolve_target: None,
                            ops: wgpu::Operations {
                                load: wgpu::LoadOp::Load, // Preserve existing content
                                store: wgpu::StoreOp::Store,
                            },
                        })],
                        depth_stencil_attachment: None,
                        timestamp_writes: None,
                        occlusion_query_set: None,
                    });

                    renderer.render(&mut render_pass);
                }
            }
        }
    }

    /// Render text string to the glyph substrate
    ///
    /// Writes glyph pixels to the substrate buffer for GPU rendering.
    fn render_text_to_substrate(&mut self, text: &str) {
        let atlas = match &mut self.glyph_atlas {
            Some(a) => a,
            None => return,
        };
        let substrate = match &mut self.glyph_substrate {
            Some(s) => s,
            None => return,
        };

        // Clear substrate for fresh text
        substrate.clear(0x00000000); // Transparent

        // Render string and get glyph positions
        let glyphs = atlas.render_string(text, 16.0);

        // Write each glyph to the substrate
        let mut x_cursor = 0u32;
        let y_baseline = 16u32; // Baseline position in substrate

        for (glyph_info, x_offset) in glyphs {
            let glyph_x = x_cursor + (x_offset as u32).max(0);
            
            // Write glyph pixels to substrate
            for gy in 0..glyph_info.height {
                for gx in 0..glyph_info.width {
                    let pixel_idx = (gy * glyph_info.width + gx) as usize;
                    if pixel_idx < glyph_info.pixels.len() {
                        let alpha = glyph_info.pixels[pixel_idx];
                        if alpha > 0 {
                            // Create RGBA color with alpha (white text)
                            let color = 0x00FFFFFF | ((alpha as u32) << 24);
                            substrate.set_pixel(glyph_x + gx, y_baseline + gy, color);
                        }
                    }
                }
            }
            
            x_cursor += glyph_info.advance_x as u32;
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
