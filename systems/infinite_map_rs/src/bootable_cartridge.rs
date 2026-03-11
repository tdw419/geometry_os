// ============================================
// GEOMETRY OS - BOOTABLE CARTRIDGE MANAGER
// Manages bootable AI cartridges with biological coupling
// ============================================

use std::path::Path;
use std::sync::Arc;
use wgpu::util::DeviceExt;

/// Bootable cartridge state
#[derive(Debug, Clone)]
pub struct CartridgeState {
    /// AI confidence (0.0 - 1.0)
    pub confidence: f32,
    /// AI fatigue (0.0 - 1.0)
    pub fatigue: f32,
    /// AI alignment (0.0 - 1.0)
    pub alignment: f32,
    /// Last update timestamp
    pub last_update: std::time::Instant,
}

impl Default for CartridgeState {
    fn default() -> Self {
        Self {
            confidence: 1.0,
            fatigue: 0.0,
            alignment: 1.0,
            last_update: std::time::Instant::now(),
        }
    }
}

impl CartridgeState {
    /// Update cartridge state from neural state data
    pub fn update_from_neural_state(&mut self, confidence: f32, fatigue: f32, alignment: f32) {
        self.confidence = confidence.clamp(0.0, 1.0);
        self.fatigue = fatigue.clamp(0.0, 1.0);
        self.alignment = alignment.clamp(0.0, 1.0);
        self.last_update = std::time::Instant::now();
    }

    /// Get brightness modulation based on confidence
    pub fn get_brightness_modulation(&self) -> f32 {
        // Higher confidence = brighter ground
        // Range: 0.3 (low confidence) to 1.0 (high confidence)
        0.3 + (self.confidence * 0.7)
    }

    /// Get saturation modulation based on fatigue
    pub fn get_saturation_modulation(&self) -> f32 {
        // Higher fatigue = desaturated ground
        // Range: 1.0 (fresh) to 0.3 (exhausted)
        1.0 - (self.fatigue * 0.7)
    }

    /// Get hue shift based on alignment
    pub fn get_hue_shift(&self) -> f32 {
        // Alignment affects hue: 0.0 (red/unaligned) to 0.0 (cyan/aligned)
        // Range: 0.0 to 0.5 (half color wheel)
        (1.0 - self.alignment) * 0.5
    }
}

/// Bootable cartridge texture manager
pub struct BootableCartridge {
    /// Cartridge texture
    texture: Option<wgpu::Texture>,
    /// Cartridge texture view
    texture_view: Option<wgpu::TextureView>,
    /// Cartridge sampler
    sampler: wgpu::Sampler,
    /// Cartridge state
    state: CartridgeState,
    /// Device reference
    device: Arc<wgpu::Device>,
    /// Queue reference
    queue: Arc<wgpu::Queue>,
    /// Cartridge path
    cartridge_path: String,
    /// Is cartridge mounted
    mounted: bool,
}

impl BootableCartridge {
    /// Create a new bootable cartridge manager
    pub fn new(device: Arc<wgpu::Device>, queue: Arc<wgpu::Queue>) -> Self {
        // Create sampler
        let sampler = device.create_sampler(&wgpu::SamplerDescriptor {
            address_mode_u: wgpu::AddressMode::Repeat,
            address_mode_v: wgpu::AddressMode::Repeat,
            address_mode_w: wgpu::AddressMode::Repeat,
            mag_filter: wgpu::FilterMode::Linear,
            min_filter: wgpu::FilterMode::Linear,
            mipmap_filter: wgpu::FilterMode::Linear,
            ..Default::default()
        });

        Self {
            texture: None,
            texture_view: None,
            sampler,
            state: CartridgeState::default(),
            device,
            queue,
            cartridge_path: String::new(),
            mounted: false,
        }
    }

    /// Load a bootable cartridge from a PNG file
    pub fn load_cartridge(&mut self, path: &str) -> Result<(), String> {
        let cartridge_path = Path::new(path);
        
        if !cartridge_path.exists() {
            return Err(format!("Cartridge file not found: {}", path));
        }

        // Load PNG image
        let image = image::open(cartridge_path)
            .map_err(|e| format!("Failed to load cartridge image: {}", e))?;
        
        let rgba = image.to_rgba8();
        let dimensions = (rgba.width(), rgba.height());

        // Create texture
        let texture_size = wgpu::Extent3d {
            width: dimensions.0,
            height: dimensions.1,
            depth_or_array_layers: 1,
        };

        let texture = self.device.create_texture(&wgpu::TextureDescriptor {
            label: Some("Bootable Cartridge Texture"),
            size: texture_size,
            mip_level_count: 1,
            sample_count: 1,
            dimension: wgpu::TextureDimension::D2,
            format: wgpu::TextureFormat::Rgba8UnormSrgb,
            usage: wgpu::TextureUsages::TEXTURE_BINDING | wgpu::TextureUsages::COPY_DST | wgpu::TextureUsages::COPY_SRC,
            view_formats: &[],
        });

        let texture_view = texture.create_view(&wgpu::TextureViewDescriptor::default());

        // Upload texture data
        self.queue.write_texture(
            wgpu::ImageCopyTexture {
                texture: &texture,
                mip_level: 0,
                origin: wgpu::Origin3d::ZERO,
                aspect: wgpu::TextureAspect::All,
            },
            &rgba,
            wgpu::ImageDataLayout {
                offset: 0,
                bytes_per_row: Some(4 * dimensions.0),
                rows_per_image: Some(dimensions.1),
            },
            texture_size,
        );

        self.texture = Some(texture);
        self.texture_view = Some(texture_view);
        self.cartridge_path = path.to_string();
        self.mounted = true;

        log::info!("Bootable cartridge loaded: {}", path);
        log::info!("Cartridge dimensions: {}x{}", dimensions.0, dimensions.1);

        Ok(())
    }

    /// Get the cartridge texture view
    pub fn get_texture_view(&self) -> Option<&wgpu::TextureView> {
        self.texture_view.as_ref()
    }

    /// Get the cartridge sampler
    pub fn get_sampler(&self) -> &wgpu::Sampler {
        &self.sampler
    }

    /// Get the cartridge state
    pub fn get_state(&self) -> &CartridgeState {
        &self.state
    }

    /// Update cartridge state
    pub fn update_state(&mut self, confidence: f32, fatigue: f32, alignment: f32) {
        self.state.update_from_neural_state(confidence, fatigue, alignment);
    }

    /// Check if cartridge is mounted
    pub fn is_mounted(&self) -> bool {
        self.mounted
    }

    /// Get cartridge path
    pub fn get_path(&self) -> &str {
        &self.cartridge_path
    }

    /// Get texture dimensions
    pub fn get_dimensions(&self) -> Option<(u32, u32)> {
        if let Some(texture) = &self.texture {
            Some((texture.width(), texture.height()))
        } else {
            None
        }
    }

    /// Update cartridge texture from raw bytes (RGBA)
    pub fn update_texture(&mut self, width: u32, height: u32, data: &[u8]) {
        // Create new texture if dimensions changed or doesn't exist
        let needs_creation = if let Some(tex) = &self.texture {
            tex.width() != width || tex.height() != height
        } else {
            true
        };

        let size = wgpu::Extent3d {
            width,
            height,
            depth_or_array_layers: 1,
        };

        if needs_creation {
            let texture = self.device.create_texture(&wgpu::TextureDescriptor {
                label: Some("Dynamic Cartridge Texture"),
                size,
                mip_level_count: 1,
                sample_count: 1,
                dimension: wgpu::TextureDimension::D2,
                format: wgpu::TextureFormat::Rgba8UnormSrgb,
                usage: wgpu::TextureUsages::TEXTURE_BINDING | wgpu::TextureUsages::COPY_DST,
                view_formats: &[],
            });
            let view = texture.create_view(&wgpu::TextureViewDescriptor::default());
            self.texture = Some(texture);
            self.texture_view = Some(view);
            self.mounted = true;
        }

        if let Some(texture) = &self.texture {
             self.queue.write_texture(
                wgpu::ImageCopyTexture {
                    texture,
                    mip_level: 0,
                    origin: wgpu::Origin3d::ZERO,
                    aspect: wgpu::TextureAspect::All,
                },
                data,
                wgpu::ImageDataLayout {
                    offset: 0,
                    bytes_per_row: Some(4 * width),
                    rows_per_image: Some(height),
                },
                size,
            );
        }
    }
}

/// Create bind group layout for bootable cartridge
pub fn create_cartridge_bind_group_layout(
    device: &wgpu::Device,
) -> wgpu::BindGroupLayout {
    device.create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
        label: Some("Bootable Cartridge Bind Group Layout"),
        entries: &[
            // Binding 0: Global Uniforms
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
            // Binding 1: Cartridge Texture
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
            // Binding 2: Cartridge Sampler
            wgpu::BindGroupLayoutEntry {
                binding: 2,
                visibility: wgpu::ShaderStages::FRAGMENT,
                ty: wgpu::BindingType::Sampler(wgpu::SamplerBindingType::Filtering),
                count: None,
            },
            // Binding 3: Cartridge State
            wgpu::BindGroupLayoutEntry {
                binding: 3,
                visibility: wgpu::ShaderStages::FRAGMENT,
                ty: wgpu::BindingType::Buffer {
                    ty: wgpu::BufferBindingType::Uniform,
                    has_dynamic_offset: false,
                    min_binding_size: None,
                },
                count: None,
            },
        ],
    })
}

/// Cartridge state uniform buffer
#[repr(C)]
#[derive(Copy, Clone, bytemuck::Pod, bytemuck::Zeroable)]
pub struct CartridgeUniforms {
    /// Brightness modulation
    pub brightness: f32,
    /// Saturation modulation
    pub saturation: f32,
    /// Hue shift
    pub hue_shift: f32,
    /// Padding
    pub _padding: f32,
}

impl From<&CartridgeState> for CartridgeUniforms {
    fn from(state: &CartridgeState) -> Self {
        Self {
            brightness: state.get_brightness_modulation(),
            saturation: state.get_saturation_modulation(),
            hue_shift: state.get_hue_shift(),
            _padding: 0.0,
        }
    }
}

/// Create bind group for bootable cartridge
pub fn create_cartridge_bind_group(
    device: &wgpu::Device,
    layout: &wgpu::BindGroupLayout,
    cartridge: &BootableCartridge,
    global_uniform_buffer: &wgpu::Buffer,
    cartridge_uniform_buffer: &wgpu::Buffer,
) -> wgpu::BindGroup {
    device.create_bind_group(&wgpu::BindGroupDescriptor {
        label: Some("Bootable Cartridge Bind Group"),
        layout,
        entries: &[
            wgpu::BindGroupEntry {
                binding: 0,
                resource: global_uniform_buffer.as_entire_binding(),
            },
            wgpu::BindGroupEntry {
                binding: 1,
                resource: wgpu::BindingResource::TextureView(
                    cartridge.get_texture_view().expect("Cartridge texture view not available")
                ),
            },
            wgpu::BindGroupEntry {
                binding: 2,
                resource: wgpu::BindingResource::Sampler(cartridge.get_sampler()),
            },
            wgpu::BindGroupEntry {
                binding: 3,
                resource: cartridge_uniform_buffer.as_entire_binding(),
            },
        ],
    })
}

/// Create uniform buffer for cartridge state
pub fn create_cartridge_uniform_buffer(
    device: &wgpu::Device,
    state: &CartridgeState,
) -> wgpu::Buffer {
    let uniforms = CartridgeUniforms::from(state);
    device.create_buffer_init(&wgpu::util::BufferInitDescriptor {
        label: Some("Cartridge Uniform Buffer"),
        contents: bytemuck::cast_slice(&[uniforms]),
        usage: wgpu::BufferUsages::UNIFORM | wgpu::BufferUsages::COPY_DST,
    })
}

/// Update cartridge uniform buffer
pub fn update_cartridge_uniform_buffer(
    queue: &wgpu::Queue,
    buffer: &wgpu::Buffer,
    state: &CartridgeState,
) {
    let uniforms = CartridgeUniforms::from(state);
    queue.write_buffer(buffer, 0, bytemuck::cast_slice(&[uniforms]));
}
