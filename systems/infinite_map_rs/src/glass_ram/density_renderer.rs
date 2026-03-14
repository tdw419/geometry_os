// systems/infinite_map_rs/src/glass_ram/density_renderer.rs
//
// Phase 33.4: Density Map Renderer
// Renders the compressed sensing density map as a heat map visualization

use wgpu::util::DeviceExt;
use ndarray::Array2;
use std::sync::Arc;

/// Configuration for density map rendering
#[derive(Debug, Clone)]
pub struct DensityRendererConfig {
    /// Maximum density value for color mapping
    pub max_density: f32,
    /// Color palette for density visualization
    pub palette: DensityPalette,
    /// Whether to show grid lines
    pub show_grid: bool,
    /// Grid opacity
    pub grid_opacity: f32,
}

impl Default for DensityRendererConfig {
    fn default() -> Self {
        Self {
            max_density: 10.0,
            palette: DensityPalette::Heatmap,
            show_grid: true,
            grid_opacity: 0.1,
        }
    }
}

/// Color palette for density visualization
#[derive(Debug, Clone, Copy)]
pub enum DensityPalette {
    /// Heatmap: Blue -> Green -> Yellow -> Red
    Heatmap,
    /// Viridis: Purple -> Blue -> Green -> Yellow
    Viridis,
    /// Plasma: Purple -> Red -> Yellow
    Plasma,
    /// Grayscale: Black -> White
    Grayscale,
}

impl DensityPalette {
    /// Get color for a normalized density value (0.0 to 1.0)
    pub fn color_for_density(&self, density: f32) -> [f32; 4] {
        let d = density.clamp(0.0, 1.0);
        match self {
            DensityPalette::Heatmap => self.heatmap_color(d),
            DensityPalette::Viridis => self.viridis_color(d),
            DensityPalette::Plasma => self.plasma_color(d),
            DensityPalette::Grayscale => [d, d, d, 1.0],
        }
    }

    fn heatmap_color(&self, d: f32) -> [f32; 4] {
        // Blue -> Green -> Yellow -> Red
        if d < 0.25 {
            // Blue to Green
            let t = d / 0.25;
            [0.0, t, 1.0 - t, 1.0]
        } else if d < 0.5 {
            // Green to Yellow
            let t = (d - 0.25) / 0.25;
            [t, 1.0, 0.0, 1.0]
        } else if d < 0.75 {
            // Yellow to Orange
            let t = (d - 0.5) / 0.25;
            [1.0, 1.0 - t * 0.5, 0.0, 1.0]
        } else {
            // Orange to Red
            let t = (d - 0.75) / 0.25;
            [1.0, 0.5 - t * 0.5, 0.0, 1.0]
        }
    }

    fn viridis_color(&self, d: f32) -> [f32; 4] {
        // Simplified Viridis approximation
        if d < 0.33 {
            let t = d / 0.33;
            [0.28 + t * 0.1, 0.01 + t * 0.2, 0.57 + t * 0.1, 1.0]
        } else if d < 0.66 {
            let t = (d - 0.33) / 0.33;
            [0.38 + t * 0.2, 0.21 + t * 0.3, 0.67 - t * 0.1, 1.0]
        } else {
            let t = (d - 0.66) / 0.34;
            [0.58 + t * 0.3, 0.51 + t * 0.4, 0.57 + t * 0.2, 1.0]
        }
    }

    fn plasma_color(&self, d: f32) -> [f32; 4] {
        // Simplified Plasma approximation
        if d < 0.5 {
            let t = d / 0.5;
            [0.05 + t * 0.4, 0.05 + t * 0.1, 0.5 - t * 0.3, 1.0]
        } else {
            let t = (d - 0.5) / 0.5;
            [0.45 + t * 0.5, 0.15 + t * 0.7, 0.2 + t * 0.6, 1.0]
        }
    }
}

/// Density map renderer
/// 
/// Converts the 2D density array to a texture for GPU rendering
pub struct DensityRenderer {
    config: DensityRendererConfig,
    device: Arc<wgpu::Device>,
    queue: Arc<wgpu::Queue>,
    texture: wgpu::Texture,
    texture_view: wgpu::TextureView,
    sampler: wgpu::Sampler,
    bind_group_layout: wgpu::BindGroupLayout,
    bind_group: wgpu::BindGroup,
    pipeline: wgpu::RenderPipeline,
    uniform_buffer: wgpu::Buffer,
}

#[repr(C)]
#[derive(Copy, Clone, bytemuck::Pod, bytemuck::Zeroable)]
struct DensityUniforms {
    screen_size: [f32; 2],
    texture_size: [f32; 2],
    max_density: f32,
    show_grid: f32,
    grid_opacity: f32,
    _padding: [f32; 2],
}

impl DensityRenderer {
    /// Create a new density map renderer
    pub fn new(
        device: Arc<wgpu::Device>,
        queue: Arc<wgpu::Queue>,
        config: DensityRendererConfig,
        texture_format: wgpu::TextureFormat,
    ) -> Self {
        let resolution = 1024; // Default resolution

        // Create texture
        let texture = device.create_texture(&wgpu::TextureDescriptor {
            label: Some("Density Map Texture"),
            size: wgpu::Extent3d {
                width: resolution,
                height: resolution,
                depth_or_array_layers: 1,
            },
            mip_level_count: 1,
            sample_count: 1,
            dimension: wgpu::TextureDimension::D2,
            format: wgpu::TextureFormat::Rgba8UnormSrgb,
            usage: wgpu::TextureUsages::TEXTURE_BINDING | wgpu::TextureUsages::COPY_DST | wgpu::TextureUsages::RENDER_ATTACHMENT,
            view_formats: &[],
        });

        let texture_view = texture.create_view(&wgpu::TextureViewDescriptor::default());

        // Create sampler
        let sampler = device.create_sampler(&wgpu::SamplerDescriptor {
            address_mode_u: wgpu::AddressMode::ClampToEdge,
            address_mode_v: wgpu::AddressMode::ClampToEdge,
            address_mode_w: wgpu::AddressMode::ClampToEdge,
            mag_filter: wgpu::FilterMode::Nearest,
            min_filter: wgpu::FilterMode::Nearest,
            mipmap_filter: wgpu::FilterMode::Nearest,
            ..Default::default()
        });

        // Create uniform buffer
        let uniform_buffer = device.create_buffer_init(&wgpu::util::BufferInitDescriptor {
            label: Some("Density Uniform Buffer"),
            contents: bytemuck::cast_slice(&[DensityUniforms {
                screen_size: [1920.0, 1080.0],
                texture_size: [resolution as f32, resolution as f32],
                max_density: config.max_density,
                show_grid: if config.show_grid { 1.0 } else { 0.0 },
                grid_opacity: config.grid_opacity,
                _padding: [0.0; 2],
            }]),
            usage: wgpu::BufferUsages::UNIFORM | wgpu::BufferUsages::COPY_DST,
        });

        // Create bind group layout
        let bind_group_layout = device.create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
            label: Some("Density Bind Group Layout"),
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
                wgpu::BindGroupLayoutEntry {
                    binding: 1,
                    visibility: wgpu::ShaderStages::FRAGMENT,
                    ty: wgpu::BindingType::Texture {
                        multisampled: false,
                        view_dimension: wgpu::TextureViewDimension::D2,
                        sample_type: wgpu::TextureSampleType::Float { filterable: true },
                    },
                    count: None,
                },
                wgpu::BindGroupLayoutEntry {
                    binding: 2,
                    visibility: wgpu::ShaderStages::FRAGMENT,
                    ty: wgpu::BindingType::Sampler(wgpu::SamplerBindingType::Filtering),
                    count: None,
                },
            ],
        });

        // Create bind group
        let bind_group = device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("Density Bind Group"),
            layout: &bind_group_layout,
            entries: &[
                wgpu::BindGroupEntry {
                    binding: 0,
                    resource: uniform_buffer.as_entire_binding(),
                },
                wgpu::BindGroupEntry {
                    binding: 1,
                    resource: wgpu::BindingResource::TextureView(&texture_view),
                },
                wgpu::BindGroupEntry {
                    binding: 2,
                    resource: wgpu::BindingResource::Sampler(&sampler),
                },
            ],
        });

        // Create shader
        let shader = device.create_shader_module(wgpu::ShaderModuleDescriptor {
            label: Some("Density Shader"),
            source: wgpu::ShaderSource::Wgsl(include_str!("../shaders/density_map.wgsl").into()),
        });

        // Create pipeline
        let pipeline_layout = device.create_pipeline_layout(&wgpu::PipelineLayoutDescriptor {
            label: Some("Density Pipeline Layout"),
            bind_group_layouts: &[&bind_group_layout],
            push_constant_ranges: &[],
        });

        let pipeline = device.create_render_pipeline(&wgpu::RenderPipelineDescriptor {
            label: Some("Density Render Pipeline"),
            layout: Some(&pipeline_layout),
            vertex: wgpu::VertexState {
                module: &shader,
                entry_point: "vs_main",
                buffers: &[],
            },
            fragment: Some(wgpu::FragmentState {
                module: &shader,
                entry_point: "fs_main",
                targets: &[Some(wgpu::ColorTargetState {
                    format: texture_format,
                    blend: Some(wgpu::BlendState::ALPHA_BLENDING),
                    write_mask: wgpu::ColorWrites::ALL,
                })],
            }),
            primitive: wgpu::PrimitiveState {
                topology: wgpu::PrimitiveTopology::TriangleList,
                ..Default::default()
            },
            depth_stencil: None,
            multisample: wgpu::MultisampleState::default(),
            multiview: None,
        });

        Self {
            config,
            device,
            queue,
            texture,
            texture_view,
            sampler,
            bind_group_layout,
            bind_group,
            pipeline,
            uniform_buffer,
        }
    }

    /// Update the density map texture from a 2D array
    pub fn update_density_map(&self, density_map: &Array2<f32>) {
        let (rows, cols) = density_map.dim();
        let resolution = rows.min(cols);

        // Convert density values to RGBA colors
        let mut texture_data = vec![[0u8; 4]; resolution * resolution];

        for y in 0..resolution {
            for x in 0..resolution {
                let density = if x < cols && y < rows {
                    density_map[[y, x]]
                } else {
                    0.0
                };

                // Normalize density
                let normalized = (density / self.config.max_density).clamp(0.0, 1.0);

                // Get color from palette
                let color = self.config.palette.color_for_density(normalized);

                // Convert to u8
                texture_data[y * resolution + x] = [
                    (color[0] * 255.0) as u8,
                    (color[1] * 255.0) as u8,
                    (color[2] * 255.0) as u8,
                    (color[3] * 255.0) as u8,
                ];
            }
        }

        // Upload texture data
        self.queue.write_texture(
            wgpu::ImageCopyTexture {
                texture: &self.texture,
                mip_level: 0,
                origin: wgpu::Origin3d::ZERO,
                aspect: wgpu::TextureAspect::All,
            },
            bytemuck::cast_slice(&texture_data),
            wgpu::ImageDataLayout {
                offset: 0,
                bytes_per_row: Some((4 * resolution) as u32),
                rows_per_image: Some(resolution as u32),
            },
            wgpu::Extent3d {
                width: resolution as u32,
                height: resolution as u32,
                depth_or_array_layers: 1,
            },
        );
    }

    /// Update uniforms
    pub fn update_uniforms(&self, screen_size: [f32; 2]) {
        let uniforms = DensityUniforms {
            screen_size,
            texture_size: [1024.0, 1024.0],
            max_density: self.config.max_density,
            show_grid: if self.config.show_grid { 1.0 } else { 0.0 },
            grid_opacity: self.config.grid_opacity,
            _padding: [0.0; 2],
        };

        self.queue.write_buffer(
            &self.uniform_buffer,
            0,
            bytemuck::cast_slice(&[uniforms]),
        );
    }

    /// Get the bind group for rendering
    pub fn bind_group(&self) -> &wgpu::BindGroup {
        &self.bind_group
    }

    /// Get the render pipeline
    pub fn pipeline(&self) -> &wgpu::RenderPipeline {
        &self.pipeline
    }

    /// Get the texture view
    pub fn texture_view(&self) -> &wgpu::TextureView {
        &self.texture_view
    }

    /// Update configuration
    pub fn update_config(&mut self, config: DensityRendererConfig) {
        self.config = config;
    }

    /// Get current configuration
    pub fn config(&self) -> &DensityRendererConfig {
        &self.config
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_palette_heatmap() {
        let palette = DensityPalette::Heatmap;
        let color_low = palette.color_for_density(0.0);
        let color_mid = palette.color_for_density(0.5);
        let color_high = palette.color_for_density(1.0);

        assert_eq!(color_low[3], 1.0); // Alpha should be 1.0
        assert_eq!(color_mid[3], 1.0);
        assert_eq!(color_high[3], 1.0);
    }

    #[test]
    fn test_palette_grayscale() {
        let palette = DensityPalette::Grayscale;
        let color = palette.color_for_density(0.5);
        assert_eq!(color[0], 0.5);
        assert_eq!(color[1], 0.5);
        assert_eq!(color[2], 0.5);
    }

    #[test]
    fn test_config_default() {
        let config = DensityRendererConfig::default();
        assert_eq!(config.max_density, 10.0);
        assert!(config.show_grid);
        assert_eq!(config.grid_opacity, 0.1);
    }

    #[test]
    fn test_color_clamping() {
        let palette = DensityPalette::Heatmap;
        let color_low = palette.color_for_density(-0.5);
        let color_high = palette.color_for_density(1.5);

        assert!(color_low[0] >= 0.0 && color_low[0] <= 1.0);
        assert!(color_high[0] >= 0.0 && color_high[0] <= 1.0);
    }
}
