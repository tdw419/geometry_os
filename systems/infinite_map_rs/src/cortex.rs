use memmap2::Mmap;
use std::fs::OpenOptions;
use std::sync::Arc;
use wgpu::util::DeviceExt;

/// Header format matching Python struct "<4sQIIId" for legacy, extended for modern
/// Packed: 32 bytes (Legacy) + 24 bytes (New) = 56 bytes
const HEADER_SIZE: usize = 56;
const LEGACY_HEADER_SIZE: usize = 32;

#[derive(Debug, Clone, Copy, PartialEq)]
pub struct Neuromodulator {
    pub dopamine: f32,      // Reward/Focus (0.0 - 1.0)
    pub acetylcholine: f32, // Learning/Plasticity (0.0 - 1.0)
    pub urgency: f32,       // Stress/Panic (0.0 - 1.0)
}

impl Default for Neuromodulator {
    fn default() -> Self {
        Self {
            dopamine: 0.5,
            acetylcholine: 0.5,
            urgency: 0.0,
        }
    }
}

pub struct CortexBridge {
    mmap: Mmap,
    pub name: String,
    pub width: u32,
    pub height: u32,
    pub last_generation: u64,

    // Proprioception (Spatial Awareness)
    pub focus_x: f32,
    pub focus_y: f32,
    pub zoom: f32,

    // Neuromodulation (Cognitive State)
    pub neuromodulator: Neuromodulator,
}

impl CortexBridge {
    pub fn new(name: &str) -> Option<Self> {
        let path = format!("/dev/shm/geometry_os_cortex_{}", name);
        let file = match OpenOptions::new().read(true).write(false).open(&path) {
            Ok(f) => f,
            Err(e) => {
                eprintln!("Cortex: Failed to open SHM {}: {}", path, e);
                return None;
            }
        };

        let mmap = unsafe {
            match Mmap::map(&file) {
                Ok(m) => m,
                Err(e) => {
                    eprintln!("Cortex: Failed to mmap {}: {}", path, e);
                    return None;
                }
            }
        };

        if mmap.len() < LEGACY_HEADER_SIZE {
            eprintln!("Cortex: SHM too small for header");
            return None;
        }

        // Read initial header
        let (magic, gen, w, h, _c, _t, fx, fy, z, dop, ach, urg) = Self::parse_header(&mmap);
        if magic != *b"GCTX" {
            eprintln!("Cortex: Invalid magic bytes {:?}", magic);
            return None;
        }

        Some(Self {
            mmap,
            name: name.to_string(),
            width: w,
            height: h,
            last_generation: 0, // Force update
            focus_x: fx,
            focus_y: fy,
            zoom: z,
            neuromodulator: Neuromodulator {
                dopamine: dop,
                acetylcholine: ach,
                urgency: urg,
            },
        })
    }

    fn parse_header(
        data: &[u8],
    ) -> (
        [u8; 4],
        u64,
        u32,
        u32,
        u32,
        f64,
        f32,
        f32,
        f32,
        f32,
        f32,
        f32,
    ) {
        let magic: [u8; 4] = data[0..4].try_into().unwrap();
        let generation = u64::from_le_bytes(data[4..12].try_into().unwrap());
        let width = u32::from_le_bytes(data[12..16].try_into().unwrap());
        let height = u32::from_le_bytes(data[16..20].try_into().unwrap());
        let channels = u32::from_le_bytes(data[20..24].try_into().unwrap());
        let timestamp = f64::from_le_bytes(data[24..32].try_into().unwrap());

        // Check if we have extended header data
        if data.len() >= HEADER_SIZE {
            let focus_x = f32::from_le_bytes(data[32..36].try_into().unwrap());
            let focus_y = f32::from_le_bytes(data[36..40].try_into().unwrap());
            let zoom = f32::from_le_bytes(data[40..44].try_into().unwrap());
            let dopamine = f32::from_le_bytes(data[44..48].try_into().unwrap());
            let acetylcholine = f32::from_le_bytes(data[48..52].try_into().unwrap());
            let urgency = f32::from_le_bytes(data[52..56].try_into().unwrap());

            (
                magic,
                generation,
                width,
                height,
                channels,
                timestamp,
                focus_x,
                focus_y,
                zoom,
                dopamine,
                acetylcholine,
                urgency,
            )
        } else {
            // Legacy header default values
            (
                magic, generation, width, height, channels, timestamp, 0.0, 0.0, 1.0, 0.5, 0.5, 0.0,
            )
        }
    }

    pub fn poll(&mut self) -> Option<&[u8]> {
        if self.mmap.len() < LEGACY_HEADER_SIZE {
            return None;
        }

        // Check generation
        let gen = u64::from_le_bytes(self.mmap[4..12].try_into().unwrap());

        if gen > self.last_generation {
            self.last_generation = gen;
            // Should refetch header to get updated neuromodulation
            let (_, _, _, _, _, _, fx, fy, z, dop, ach, urg) = Self::parse_header(&self.mmap);
            self.focus_x = fx;
            self.focus_y = fy;
            self.zoom = z;
            self.neuromodulator.dopamine = dop;
            self.neuromodulator.acetylcholine = ach;
            self.neuromodulator.urgency = urg;

            // Return data slice
            let data_len = (self.width * self.height) as usize; // Assuming 1 channel u8 for now

            // Header offset depends on version (check length)
            let header_offset = if self.mmap.len() >= HEADER_SIZE + data_len {
                HEADER_SIZE
            } else {
                LEGACY_HEADER_SIZE
            };

            // Check bounds
            if self.mmap.len() >= header_offset + data_len {
                return Some(&self.mmap[header_offset..header_offset + data_len]);
            }
        }
        None
    }
}

pub struct CortexLayer {
    pub connection: CortexBridge,
    pub texture: wgpu::Texture,
    pub bind_group: wgpu::BindGroup,
    pub color_buffer: wgpu::Buffer,
    pub color: [f32; 4], // r, g, b, alpha_mult
}

impl CortexLayer {
    pub fn new(
        device: &wgpu::Device,
        layout: &wgpu::BindGroupLayout,
        sampler: &wgpu::Sampler,
        name: &str,
        color: [f32; 4],
    ) -> Option<Self> {
        let connection = CortexBridge::new(name)?;

        let size = wgpu::Extent3d {
            width: connection.width,
            height: connection.height,
            depth_or_array_layers: 1,
        };

        let texture = device.create_texture(&wgpu::TextureDescriptor {
            label: Some(&format!("Cortex Texture {}", name)),
            size,
            mip_level_count: 1,
            sample_count: 1,
            dimension: wgpu::TextureDimension::D2,
            format: wgpu::TextureFormat::R8Unorm, // Single channel
            usage: wgpu::TextureUsages::TEXTURE_BINDING | wgpu::TextureUsages::COPY_DST,
            view_formats: &[],
        });

        let view = texture.create_view(&wgpu::TextureViewDescriptor::default());

        let color_buffer = device.create_buffer_init(&wgpu::util::BufferInitDescriptor {
            label: Some("Cortex Color Buffer"),
            contents: bytemuck::cast_slice(&color),
            usage: wgpu::BufferUsages::UNIFORM | wgpu::BufferUsages::COPY_DST,
        });

        let bind_group = device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some(&format!("Cortex BindGroup {}", name)),
            layout,
            entries: &[
                wgpu::BindGroupEntry {
                    binding: 0,
                    resource: wgpu::BindingResource::TextureView(&view),
                },
                wgpu::BindGroupEntry {
                    binding: 1,
                    resource: wgpu::BindingResource::Sampler(sampler),
                },
                wgpu::BindGroupEntry {
                    binding: 2,
                    resource: color_buffer.as_entire_binding(),
                },
            ],
        });

        Some(Self {
            connection,
            texture,
            bind_group,
            color_buffer,
            color,
        })
    }

    pub fn update(&mut self, queue: &wgpu::Queue) {
        let width = self.connection.width;
        let height = self.connection.height;

        if let Some(data) = self.connection.poll() {
            let size = wgpu::Extent3d {
                width,
                height,
                depth_or_array_layers: 1,
            };

            queue.write_texture(
                wgpu::ImageCopyTexture {
                    texture: &self.texture,
                    mip_level: 0,
                    origin: wgpu::Origin3d::ZERO,
                    aspect: wgpu::TextureAspect::All,
                },
                data,
                wgpu::ImageDataLayout {
                    offset: 0,
                    bytes_per_row: Some(width), // 1 byte per pixel
                    rows_per_image: Some(height),
                },
                size,
            );
        }
    }
}

pub struct CortexRenderer {
    pub pipeline: wgpu::RenderPipeline,
    pub bind_group_layout: wgpu::BindGroupLayout,
    pub layers: Vec<CortexLayer>,
    pub sampler: wgpu::Sampler,
}

impl CortexRenderer {
    pub fn new(device: &wgpu::Device, format: wgpu::TextureFormat) -> Self {
        let shader = device.create_shader_module(wgpu::ShaderModuleDescriptor {
            label: Some("Cortex Overlay Shader"),
            source: wgpu::ShaderSource::Wgsl(include_str!("shaders/cortex_overlay.wgsl").into()),
        });

        let bind_group_layout = device.create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
            label: Some("Cortex Bind Group Layout"),
            entries: &[
                wgpu::BindGroupLayoutEntry {
                    binding: 0,
                    visibility: wgpu::ShaderStages::FRAGMENT,
                    ty: wgpu::BindingType::Texture {
                        multisampled: false,
                        view_dimension: wgpu::TextureViewDimension::D2,
                        sample_type: wgpu::TextureSampleType::Float { filterable: true },
                    },
                    count: None,
                },
                wgpu::BindGroupLayoutEntry {
                    binding: 1,
                    visibility: wgpu::ShaderStages::FRAGMENT,
                    ty: wgpu::BindingType::Sampler(wgpu::SamplerBindingType::Filtering),
                    count: None,
                },
                wgpu::BindGroupLayoutEntry {
                    binding: 2,
                    visibility: wgpu::ShaderStages::FRAGMENT,
                    ty: wgpu::BindingType::Buffer {
                        ty: wgpu::BufferBindingType::Uniform,
                        has_dynamic_offset: false,
                        min_binding_size: None,
                    },
                    count: None,
                },
            ],
        });

        let pipeline_layout = device.create_pipeline_layout(&wgpu::PipelineLayoutDescriptor {
            label: Some("Cortex Pipeline Layout"),
            bind_group_layouts: &[&bind_group_layout],
            push_constant_ranges: &[],
        });

        let pipeline = device.create_render_pipeline(&wgpu::RenderPipelineDescriptor {
            label: Some("Cortex Render Pipeline"),
            layout: Some(&pipeline_layout),
            vertex: wgpu::VertexState {
                module: &shader,
                entry_point: "vs_main",
                buffers: &[], // Full screen quad generated in shader
            },
            fragment: Some(wgpu::FragmentState {
                module: &shader,
                entry_point: "fs_main",
                targets: &[Some(wgpu::ColorTargetState {
                    format,
                    blend: Some(wgpu::BlendState::ALPHA_BLENDING),
                    write_mask: wgpu::ColorWrites::ALL,
                })],
            }),
            primitive: wgpu::PrimitiveState::default(),
            depth_stencil: None,
            multisample: wgpu::MultisampleState::default(),
            multiview: None,
        });

        let sampler = device.create_sampler(&wgpu::SamplerDescriptor {
            address_mode_u: wgpu::AddressMode::ClampToEdge,
            address_mode_v: wgpu::AddressMode::ClampToEdge,
            address_mode_w: wgpu::AddressMode::ClampToEdge,
            mag_filter: wgpu::FilterMode::Linear,
            min_filter: wgpu::FilterMode::Linear,
            mipmap_filter: wgpu::FilterMode::Linear,
            ..Default::default()
        });

        Self {
            pipeline,
            bind_group_layout,
            layers: Vec::new(),
            sampler,
        }
    }

    pub fn add_layer(&mut self, device: &wgpu::Device, name: &str, color: [f32; 4]) {
        if let Some(layer) =
            CortexLayer::new(device, &self.bind_group_layout, &self.sampler, name, color)
        {
            eprintln!("Cortex: Added layer '{}'", name);
            self.layers.push(layer);
        } else {
            eprintln!("Cortex: Layer '{}' not ready/found", name);
        }
    }

    pub fn update(&mut self, queue: &wgpu::Queue) {
        for layer in &mut self.layers {
            layer.update(queue);
        }
    }

    pub fn render<'a>(&'a self, rpass: &mut wgpu::RenderPass<'a>) {
        if self.layers.is_empty() {
            return;
        }

        rpass.set_pipeline(&self.pipeline);
        for layer in &self.layers {
            rpass.set_bind_group(0, &layer.bind_group, &[]);
            rpass.draw(0..3, 0..1);
        }
    }

    pub fn get_neuromodulation(&self) -> crate::cortex::Neuromodulator {
        self.layers
            .iter()
            .fold(crate::cortex::Neuromodulator::default(), |acc, layer| {
                crate::cortex::Neuromodulator {
                    dopamine: acc.dopamine.max(layer.connection.neuromodulator.dopamine),
                    acetylcholine: acc
                        .acetylcholine
                        .max(layer.connection.neuromodulator.acetylcholine),
                    urgency: acc.urgency.max(layer.connection.neuromodulator.urgency),
                }
            })
    }
}
