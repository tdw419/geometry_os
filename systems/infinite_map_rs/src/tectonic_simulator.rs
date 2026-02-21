use wgpu;

pub struct HilbertRegion {
    pub x: u32,
    pub y: u32,
    pub width: u32,
    pub base_addr: u64,
}

pub struct TectonicSimulator {
    pub texture_a: wgpu::Texture,
    pub texture_b: wgpu::Texture,
    pub view_a: wgpu::TextureView,
    pub view_b: wgpu::TextureView,
    pub compute_pipeline: wgpu::ComputePipeline,
    pub bind_group_a: wgpu::BindGroup,
    pub bind_group_b: wgpu::BindGroup,
    pub frame_count: u64,
    pub width: u32,
    pub height: u32,
    pub regions: Vec<HilbertRegion>,
}

impl TectonicSimulator {
    pub fn new(device: &wgpu::Device, width: u32, height: u32) -> Self {
        // 1. Create Storage Textures
        let texture_desc = wgpu::TextureDescriptor {
            label: Some("Tectonic Simulation Texture"),
            size: wgpu::Extent3d {
                width: width,
                height: height,
                depth_or_array_layers: 1,
            },
            mip_level_count: 1,
            sample_count: 1,
            dimension: wgpu::TextureDimension::D2,
            format: wgpu::TextureFormat::Rgba8Unorm,
            usage: wgpu::TextureUsages::TEXTURE_BINDING | wgpu::TextureUsages::STORAGE_BINDING | wgpu::TextureUsages::COPY_DST,
            view_formats: &[],
        };

        let texture_a = device.create_texture(&texture_desc);
        let texture_b = device.create_texture(&texture_desc);
        
        let view_a = texture_a.create_view(&wgpu::TextureViewDescriptor::default());
        let view_b = texture_b.create_view(&wgpu::TextureViewDescriptor::default());

        // 2. Load Shader
        let shader = device.create_shader_module(wgpu::include_wgsl!("shaders/tectonic_kernel.wgsl"));

        // 3. Create Compute Pipeline
        // Bind Group Layout:
        // Binding 0: Input Texture (Texture2D)
        // Binding 1: Output Texture (StorageTexture Write)
        let bind_group_layout = device.create_bind_group_layout(&wgpu::BindGroupLayoutDescriptor {
            label: Some("Tectonic Layout"),
            entries: &[
                wgpu::BindGroupLayoutEntry {
                    binding: 0,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::Texture {
                        sample_type: wgpu::TextureSampleType::Float { filterable: false },
                        view_dimension: wgpu::TextureViewDimension::D2,
                        multisampled: false,
                    },
                    count: None,
                },
                wgpu::BindGroupLayoutEntry {
                    binding: 1,
                    visibility: wgpu::ShaderStages::COMPUTE,
                    ty: wgpu::BindingType::StorageTexture {
                        access: wgpu::StorageTextureAccess::WriteOnly,
                        format: wgpu::TextureFormat::Rgba8Unorm,
                        view_dimension: wgpu::TextureViewDimension::D2,
                    },
                    count: None,
                },
            ],
        });

        let pipeline_layout = device.create_pipeline_layout(&wgpu::PipelineLayoutDescriptor {
            label: Some("Tectonic Pipeline Layout"),
            bind_group_layouts: &[&bind_group_layout],
            push_constant_ranges: &[],
        });

        let compute_pipeline = device.create_compute_pipeline(&wgpu::ComputePipelineDescriptor {
            label: Some("Tectonic Compute Pipeline"),
            layout: Some(&pipeline_layout),
            module: &shader,
            entry_point: "update_system",
        });

        // 4. Create Bind Groups (Ping-Pong)
        // Group A: Read A, Write B
        let bind_group_a = device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("Tectonic Bind Group A (Read A -> Write B)"),
            layout: &bind_group_layout,
            entries: &[
                wgpu::BindGroupEntry {
                    binding: 0,
                    resource: wgpu::BindingResource::TextureView(&view_a),
                },
                wgpu::BindGroupEntry {
                    binding: 1,
                    resource: wgpu::BindingResource::TextureView(&view_b),
                },
            ],
        });

        // Group B: Read B, Write A
        let bind_group_b = device.create_bind_group(&wgpu::BindGroupDescriptor {
            label: Some("Tectonic Bind Group B (Read B -> Write A)"),
            layout: &bind_group_layout,
            entries: &[
                wgpu::BindGroupEntry {
                    binding: 0,
                    resource: wgpu::BindingResource::TextureView(&view_b),
                },
                wgpu::BindGroupEntry {
                    binding: 1,
                    resource: wgpu::BindingResource::TextureView(&view_a),
                },
            ],
        });

        Self {
            texture_a,
            texture_b,
            view_a,
            view_b,
            compute_pipeline,
            bind_group_a,
            bind_group_b,
            frame_count: 0,
            width,
            height,
            regions: Vec::new(),
        }
    }

    pub fn update(&mut self, encoder: &mut wgpu::CommandEncoder) {
        let mut compute_pass = encoder.begin_compute_pass(&wgpu::ComputePassDescriptor {
            label: Some("Tectonic Compute Pass"),
            timestamp_writes: None,
        });

        compute_pass.set_pipeline(&self.compute_pipeline);
        
        // Ping-Pong Logic
        if self.frame_count % 2 == 0 {
            // Read A -> Write B
            compute_pass.set_bind_group(0, &self.bind_group_a, &[]);
        } else {
            // Read B -> Write A
            compute_pass.set_bind_group(0, &self.bind_group_b, &[]);
        }

        let workgroup_size_x = 16;
        let workgroup_size_y = 16;
        let dispatch_x = (self.width + workgroup_size_x - 1) / workgroup_size_x;
        let dispatch_y = (self.height + workgroup_size_y - 1) / workgroup_size_y;

        compute_pass.dispatch_workgroups(dispatch_x, dispatch_y, 1);
        
        self.frame_count += 1;
    }

    pub fn get_current_view(&self) -> &wgpu::TextureView {
        // Return result of last write
        // Frame 0: Read A -> Write B. Frame count becomes 1.
        // If frame_count is 1 (odd), last write was B.
        if self.frame_count % 2 == 1 {
            &self.view_b
        } else {
            &self.view_a
        }
    }

    pub fn upload_state(&self, queue: &wgpu::Queue, data: &[u8], width: u32, height: u32) {
        let size = wgpu::Extent3d {
            width,
            height,
            depth_or_array_layers: 1,
        };

        // Write to BOTH textures to ensure consistency on start/reset
        queue.write_texture(
            wgpu::ImageCopyTexture {
                texture: &self.texture_a,
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
        
        queue.write_texture(
            wgpu::ImageCopyTexture {
                texture: &self.texture_b,
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

    /// Inject raw data into a specific region of the simulation
    /// Used for mapping QEMU RAM to the "Outer Ring"
    pub fn inject_data(&self, queue: &wgpu::Queue, data: &[u8], x: u32, y: u32, width: u32, height: u32) {
        let size = wgpu::Extent3d {
            width,
            height,
            depth_or_array_layers: 1,
        };
        
        // We write to the texture that will be READ in the next pass
        // If frame_count is even (0): Read A -> Write B. So write to A.
        let target = if self.frame_count % 2 == 0 { &self.texture_a } else { &self.texture_b };

        queue.write_texture(
            wgpu::ImageCopyTexture {
                texture: target,
                mip_level: 0,
                origin: wgpu::Origin3d { x, y, z: 0 },
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

    /// Kill a single pixel (Set to Void)
    /// Used for "Click-to-Kill" interaction
    pub fn kill_pixel(&self, queue: &wgpu::Queue, x: u32, y: u32) {
        let empty = [0u8; 4];
        
        // Write to both to ensure it sticks regardless of ping-pong state
        let targets = [&self.texture_a, &self.texture_b];
        
        for texture in targets.iter() {
            queue.write_texture(
                wgpu::ImageCopyTexture {
                    texture: *texture,
                    mip_level: 0,
                    origin: wgpu::Origin3d { x, y, z: 0 },
                    aspect: wgpu::TextureAspect::All,
                },
                &empty,
                wgpu::ImageDataLayout {
                    offset: 0,
                    bytes_per_row: Some(4),
                    rows_per_image: Some(1),
                },
                wgpu::Extent3d { width: 1, height: 1, depth_or_array_layers: 1 }
            );
        }
    }

    /// Inject raw data folded via Hilbert Curve
    /// Renders a square chunk where linear address -> Hilbert(x,y)
    pub fn inject_hilbert_chunk(&mut self, queue: &wgpu::Queue, data: &[u8], offset_x: u32, offset_y: u32, width: u32, base_addr: u64) {
        // Track this region for introspection
        // Remove existing overlapping regions to prevent confusion? For now, just append.
        self.regions.retain(|r| r.x != offset_x || r.y != offset_y);
        self.regions.push(HilbertRegion {
            x: offset_x,
            y: offset_y,
            width,
            base_addr,
        });

        let mut texture_data = vec![0u8; (width * width * 4) as usize];
        
        // Fold linear data into 2D buffer using Hilbert curve
        // Limit by data length or buffer size
        let limit = std::cmp::min(data.len(), (width * width) as usize);
        
        for i in 0..limit {
            let (lx, ly): (u32, u32) = fast_hilbert::h2xy(i as u64);
            
            // Check bounds just in case
            if lx < width && ly < width {
                 let width_64: u64 = width as u64;
                 let row_start: u64 = (ly as u64) * width_64;
                 let pixel_index: u64 = row_start + (lx as u64);
                 let byte_index: u64 = pixel_index * 4;
                 let idx: usize = byte_index as usize;
                 let byte = data[i];
                 
                 // Color Mapping for RAM visualization
                 // R: Health (0 for raw RAM, let sim decide?) -> Let's set to 0.5 to give it "life potential"
                 // G: The byte value (The Information)
                 // B: Entropy/Type (High = Foreign/RAM)
                 // A: Visibility
                 texture_data[idx] = 100;       // Health (Partial)
                 texture_data[idx+1] = byte;    // Resource (Data)
                 texture_data[idx+2] = 255;     // Type (RAM)
                 texture_data[idx+3] = 255;     // Alpha
            }
        }
        
        // Upload the folded chunk
        let size = wgpu::Extent3d {
            width,
            height: width, // Square
            depth_or_array_layers: 1,
        };
        
        let target = if self.frame_count % 2 == 0 { &self.texture_a } else { &self.texture_b };

        queue.write_texture(
            wgpu::ImageCopyTexture {
                texture: target,
                mip_level: 0,
                origin: wgpu::Origin3d { x: offset_x, y: offset_y, z: 0 },
                aspect: wgpu::TextureAspect::All,
            },
            &texture_data,
            wgpu::ImageDataLayout {
                offset: 0,
                bytes_per_row: Some(4 * width),
                rows_per_image: Some(width),
            },
            size,
        );
    }

    /// Resolve a texture coordinate (x, y) to a physical memory address
    /// Returns Some(address) if the coordinate falls within a mapped Hilbert region
    pub fn resolve_address(&self, x: u32, y: u32) -> Option<u64> {
        for region in &self.regions {
            // Check bounding box
            if x >= region.x && x < region.x + region.width &&
               y >= region.y && y < region.y + region.width {
                
                // Calculate local coordinates relative to region
                let local_x = x - region.x;
                let local_y = y - region.y;
                
                // Inverse Hilbert: (x, y) -> linear index
                // Note: fast_hilbert::xy2h logic verification
                // Since we used h2xy to create it, xy2h should reverse it.
                // We assume the crate supports xy2h. If not, I'll need to implement it.
                // Based on naming convention of crate, it should be there.
                let hilbert_index = fast_hilbert::xy2h(local_x as u64, local_y as u64) as u64;
                
                return Some(region.base_addr + hilbert_index);
            }
        }
        None
    }
}
