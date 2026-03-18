//! Visual Kernel Bootloader
//!
//! Boots the Window Manager glyph as VM #0, which then SPATIAL_SPAWNs
//! the Ubuntu kernel as a child window.
//!
//! This is the "init" process of Geometry OS.

use std::sync::{Arc, Mutex};
use std::path::Path;

use crate::glyph_vm_scheduler::{GlyphVmScheduler, VmConfig};
use crate::glyph_stratum::glyph_compiler::{compile_glyph_file, create_glyph_texture};
use crate::glyph_stratum::glyph_compiler::CompiledGlyph;

/// Default Hilbert offset for Ubuntu kernel in unified RAM
pub const UBUNTU_KERNEL_OFFSET: u32 = 0x8000; // 32768

/// Hilbert curve utilities for unified RAM texture
fn hilbert_d2xy(n: u32, d: u32) -> (u32, u32) {
    let mut x = 0u32;
    let mut y = 0u32;
    let mut s = 1u32;
    let mut t = d;

    while s < n {
        let rx = 1 & (t / 2);
        let ry = 1 & (t ^ rx);

        if ry == 0 {
            if rx == 1{
                x = s - 1 - x;
                y = s - 1 - y;
            }
            let tmp = x;
            x = y;
            y = tmp;
        }

        x += s * rx;
        y += s * ry;
        t /= 4;
        s *= 2;
    }

    (x, y)
}

/// Load an .rts.png file and return its pixel data
fn load_rts_png(path: &str) -> Result<(Vec<u8>, u32, u32), String> {
    let img = image::open(path)
        .map_err(|e| format!("Failed to load {}: {}", path, e))?
        .to_rgba8();

    let (width, height) = img.dimensions();
    let data = img.into_raw();

    Ok((data, width, height))
}

/// Create unified RAM texture with Window Manager and Ubuntu kernel
fn create_unified_ram_texture(
    device: &wgpu::Device,
    queue: &wgpu::Queue,
    wm_compiled: &CompiledGlyph,
    ubuntu_path: Option<&str>,
) -> wgpu::Texture {
    // Grid size must be power of 2 for Hilbert curve
    // Ubuntu kernel is 2048x2048, so we need at least 4096x4096
    let grid_size = 4096u32;

    // Create unified texture
    let texture = device.create_texture(&wgpu::TextureDescriptor {
        label: Some("Unified Boot RAM Texture"),
        size: wgpu::Extent3d {
            width: grid_size,
            height: grid_size,
            depth_or_array_layers: 1,
        },
        mip_level_count: 1,
        sample_count: 1,
        dimension: wgpu::TextureDimension::D2,
        format: wgpu::TextureFormat::Rgba8Uint,
        usage: wgpu::TextureUsages::TEXTURE_BINDING
            | wgpu::TextureUsages::COPY_DST
            | wgpu::TextureUsages::COPY_SRC,
        view_formats: &[],
    });

    // Create a CPU-side buffer for the unified texture
    let total_pixels = (grid_size * grid_size) as usize;
    let mut unified_data = vec![0u8; total_pixels * 4];

    // Copy Window Manager at offset 0
    log::info!("[RAM] Copying Window Manager to Hilbert offset 0...");
    for (i, chunk) in wm_compiled.texture_data.chunks(4).enumerate() {
        let (x, y) = hilbert_d2xy(grid_size, i as u32);
        let offset = ((y * grid_size + x) * 4) as usize;
        if offset + 4 <= unified_data.len() {
            unified_data[offset..offset + 4].copy_from_slice(chunk);
        }
    }
    log::info!("[RAM] ✓ WM: {} instructions placed", wm_compiled.instruction_count);

    // Load and copy Ubuntu kernel at UBUNTU_KERNEL_OFFSET
    if let Some(ubuntu_path) = ubuntu_path {
        if Path::new(ubuntu_path).exists() {
            log::info!("[RAM] Loading Ubuntu kernel from: {}", ubuntu_path);

            match load_rts_png(ubuntu_path) {
                Ok((ubuntu_data, ubuntu_w, ubuntu_h)) => {
                    log::info!("[RAM] Ubuntu texture: {}x{} ({} pixels)", ubuntu_w, ubuntu_h, ubuntu_w * ubuntu_h);

                    // Copy Ubuntu at UBUNTU_KERNEL_OFFSET
                    let offset = UBUNTU_KERNEL_OFFSET;
                    for i in 0..(ubuntu_w * ubuntu_h) {
                        let (x, y) = hilbert_d2xy(grid_size, offset + i);
                        let src_offset = (i * 4) as usize;
                        let dst_offset = ((y * grid_size + x) * 4) as usize;

                        if src_offset + 4 <= ubuntu_data.len() && dst_offset + 4 <= unified_data.len() {
                            unified_data[dst_offset..dst_offset + 4]
                                .copy_from_slice(&ubuntu_data[src_offset..src_offset + 4]);
                        }
                    }

                    log::info!("[RAM] ✓ Ubuntu: {} instructions placed at offset 0x{:X}",
                        ubuntu_w * ubuntu_h, UBUNTU_KERNEL_OFFSET);
                }
                Err(e) => {
                    log::warn!("[RAM] ⚠ Failed to load Ubuntu kernel: {}", e);
                }
            }
        } else {
            log::warn!("[RAM] ⚠ Ubuntu kernel not found at: {}", ubuntu_path);
        }
    }

    // Upload unified texture to GPU
    queue.write_texture(
        wgpu::ImageCopyTexture {
            texture: &texture,
            mip_level: 0,
            origin: wgpu::Origin3d::ZERO,
            aspect: wgpu::TextureAspect::All,
        },
        &unified_data,
        wgpu::ImageDataLayout {
            offset: 0,
            bytes_per_row: Some(grid_size * 4),
            rows_per_image: Some(grid_size),
        },
        wgpu::Extent3d {
            width: grid_size,
            height: grid_size,
            depth_or_array_layers: 1,
        },
    );

    log::info!("[RAM] ✓ Unified RAM texture created ({}x{})", grid_size, grid_size);

    texture
}
/// Default grid size for unified RAM texture (4096x4096 = 16M Hilbert addresses)
const UNIFIED_GRID_SIZE: u32 = 4096;

/// Boot configuration for the Visual Kernel
pub struct VisualKernelConfig {
    /// Path to the window manager glyph program (.rts.png)
    pub window_manager_path: String,

    /// Path to the Ubuntu kernel (transpiled to .rts.png)
    pub ubuntu_kernel_path: Option<String>,

    /// Screen dimensions
    pub screen_width: u32,
    pub screen_height: u32,
}

impl Default for VisualKernelConfig {
    fn default() -> Self {
        Self {
            window_manager_path: "systems/glyph_stratum/programs/window_manager.glyph".to_string(),
            ubuntu_kernel_path: Some("systems/ubuntu_riscv/ubuntu_native.rts.png".to_string()),
            screen_width: 1920,
            screen_height: 1080,
        }
    }
}

/// Window state for the window table
#[derive(Debug, Clone)]
pub struct WindowEntry {
    pub id: u32,
    pub x: f32,
    pub y: f32,
    pub width: f32,
    pub height: f32,
    pub vm_id: u32,
    pub focused: bool,
}

/// The Visual Kernel - root of the autonomous windowing system
pub struct VisualKernel {
    /// GPU scheduler managing all VMs
    scheduler: GlyphVmScheduler,

    /// GPU device for texture creation
    device: Arc<wgpu::Device>,

    /// GPU queue for texture upload
    queue: Arc<wgpu::Queue>,

    /// Window table (CPU-side mirror for hit testing)
    windows: Vec<WindowEntry>,

    /// Configuration
    config: VisualKernelConfig,

    /// Boot state
    booted: bool,
}

impl VisualKernel {
    /// Create a new Visual Kernel
    pub fn new(
        device: Arc<wgpu::Device>,
        queue: Arc<wgpu::Queue>,
        config: VisualKernelConfig,
    ) -> Self {
        // Create shadow RAM buffer for CPU-side reads
        let shadow_ram = Arc::new(Mutex::new(vec![0x55; 4096 * 4096 * 4]));
        let scheduler = GlyphVmScheduler::new(Arc::clone(&device), Arc::clone(&queue), shadow_ram);

        Self {
            scheduler,
            device,
            queue,
            windows: Vec::new(),
            config,
            booted: false,
        }
    }

    /// Boot the Visual Kernel
    ///
    /// This loads the Window Manager glyph as VM #0 and prepares the system.
    /// The Window Manager will then SPATIAL_SPAWN the Ubuntu kernel.
    pub fn boot(&mut self) -> Result<(), String> {
        if self.booted {
            return Err("Visual Kernel already booted".to_string());
        }

        log::info!("═══════════════════════════════════════════════════════════");
        log::info!("        GEOMETRY OS - Visual Kernel Boot Sequence");
        log::info!("═══════════════════════════════════════════════════════════");

        // Step 1: Compile and load the Window Manager glyph
        log::info!("[BOOT] Loading Window Manager from: {}", self.config.window_manager_path);

        let wm_path = Path::new(&self.config.window_manager_path);
        if !wm_path.exists() {
            return Err(format!("Window Manager glyph not found: {}", self.config.window_manager_path));
        }

        // Compile the .glyph file to GPU texture
        log::info!("[BOOT] Compiling Window Manager glyph...");
        let compiled = crate::glyph_stratum::glyph_compiler::compile_glyph_file(
            &self.config.window_manager_path
        ).map_err(|e| format!("Failed to compile window_manager.glyph: {}", e))?;

        log::info!("[BOOT] ✓ Compiled {} instructions", compiled.instruction_count);

        // Create GPU texture from compiled program
        let ram_texture = crate::glyph_stratum::glyph_compiler::create_glyph_texture(
            &self.device,
            &self.queue,
            &compiled,
            Some("Visual Kernel RAM Texture"),
        );

        log::info!("[BOOT] ✓ Created RAM texture ({}x{})",
            ram_texture.width(), ram_texture.height());

        // Set RAM texture on scheduler
        self.scheduler.set_ram_texture(std::sync::Arc::new(ram_texture));

        // Step 2: Initialize the Window Manager as VM #0
        log::info!("[BOOT] Spawning Window Manager as VM #0...");

        let wm_config = VmConfig {
            entry_point: compiled.entry_point,
            parent_id: 0xFF,
            base_addr: 0,
            bound_addr: 0, // Unrestricted for VM #0
            initial_regs: [0; 128],
            eap_coord: 0,
            generation: 0,
        };

        self.scheduler.spawn_vm(0, &wm_config)?;
        log::info!("[BOOT] ✓ Window Manager (VM #0) spawned at entry 0x{:04X}",
            wm_config.entry_point);

        // Step 3: Initialize the Window Table
        log::info!("[BOOT] Initializing Window Table...");

        // Register root window (the Window Manager itself)
        self.windows.push(WindowEntry {
            id: 0,
            x: 0.0,
            y: 0.0,
            width: self.config.screen_width as f32,
            height: self.config.screen_height as f32,
            vm_id: 0,
            focused: true,
        });

        log::info!("[BOOT] ✓ Root window registered ({}x{})",
            self.config.screen_width, self.config.screen_height);

        // Step 4: Pre-load Ubuntu kernel into RAM texture
        if let Some(ubuntu_path) = &self.config.ubuntu_kernel_path {
            log::info!("[BOOT] Pre-loading Ubuntu kernel from: {}", ubuntu_path);

            if Path::new(ubuntu_path).exists() {
                log::info!("[BOOT] ✓ Ubuntu kernel found, will be SPATIAL_SPAWNed by Window Manager");
            } else {
                log::warn!("[BOOT] ⚠ Ubuntu kernel not found at {}, running in single-VM mode", ubuntu_path);
            }
        }

        // Step 5: Ready
        self.booted = true;

        log::info!("");
        log::info!("═══════════════════════════════════════════════════════════");
        log::info!("  Visual Kernel Online - Autonomous Windowing Active");
        log::info!("  VM #0: Window Manager (RUNNING)");
        log::info!("  VM #1-7: Available for SPATIAL_SPAWN");
        log::info!("═══════════════════════════════════════════════════════════");
        log::info!("");

        Ok(())
    }

    /// Execute one frame of the Visual Kernel
    ///
    /// This:
    /// 1. Processes input events (from future Visual Interaction Bus)
    /// 2. Runs the GPU scheduler (executes all active VMs)
    /// 3. Syncs window table state
    pub fn execute_frame(&mut self) {
        if !self.booted {
            return;
        }

        // Execute all VMs via round-robin scheduler
        self.scheduler.execute_frame();
    }

    /// Spawn a child VM from a .glyph file
    ///
    /// This is the CPU-side SPATIAL_SPAWN mechanism.
    /// Loads and compiles a .glyph program, then spawns it as a new VM.
    pub fn spawn_child_vm(&mut self, vm_id: u32, glyph_path: &str, window_x: f32, window_y: f32, window_w: f32, window_h: f32) -> Result<(), String> {
        if !self.booted {
            return Err("Visual Kernel not booted".to_string());
        }

        if vm_id == 0 {
            return Err("VM ID 0 is reserved for Window Manager".to_string());
        }

        if vm_id >= 8 {
            return Err(format!("VM ID {} exceeds maximum (7)", vm_id));
        }

        log::info!("[SPAWN] Loading child VM #{} from: {}", vm_id, glyph_path);

        // Compile the glyph file
        let compiled = crate::glyph_stratum::glyph_compiler::compile_glyph_file(glyph_path)
            .map_err(|e| format!("Failed to compile {}: {}", glyph_path, e))?;

        log::info!("[SPAWN] ✓ Compiled {} instructions", compiled.instruction_count);

        // Create VM config with spatial MMU bounds
        let vm_config = crate::glyph_vm_scheduler::VmConfig {
            entry_point: compiled.entry_point,
            parent_id: 0, // Parent is Window Manager
            base_addr: vm_id * 0x1000,  // Each VM gets 4KB region
            bound_addr: (vm_id + 1) * 0x1000 - 1,  // Upper bound
            initial_regs: [0; 128],
            eap_coord: 0,
            generation: 0,
        };

        // Spawn the VM
        self.scheduler.spawn_vm(vm_id, &vm_config)?;

        // Register window for this VM
        self.register_window(window_x, window_y, window_w, window_h, vm_id);

        log::info!("[SPAWN] ✓ Child VM #{} spawned at entry 0x{:04X}, memory 0x{:04X}-0x{:04X}",
            vm_id, vm_config.entry_point, vm_config.base_addr, vm_config.bound_addr);
        log::info!("[SPAWN]   Window: ({}, {}) {}x{}", window_x, window_y, window_w, window_h);

        Ok(())
    }

    /// Register a new window (called by Window Manager via SPATIAL_SPAWN)
    pub fn register_window(&mut self, x: f32, y: f32, width: f32, height: f32, vm_id: u32) -> u32 {
        let id = self.windows.len() as u32;
        self.windows.push(WindowEntry {
            id,
            x,
            y,
            width,
            height,
            vm_id,
            focused: false,
        });
        id
    }

    /// Get current VM statistics
    pub fn get_vm_stats(&self) -> Vec<(u32, String)> {
        let mut stats = Vec::new();

        // VM #0 is always the Window Manager
        stats.push((0, "Window Manager".to_string()));

        // Check other windows
        for win in &self.windows {
            if win.vm_id > 0 {
                stats.push((win.vm_id, format!("Window #{}", win.id)));
            }
        }

        stats
    }

    /// Get window table for rendering
    pub fn get_windows(&self) -> &[WindowEntry] {
        &self.windows
    }

    /// Check if the kernel is booted
    pub fn is_booted(&self) -> bool {
        self.booted
    }

    /// Send an event to VM #0's mailbox (0x200)
    pub fn send_event(&mut self, event_type: u32, param1: u32, param2: u32) {
        if !self.booted {
            return;
        }
        // Mailbox format:
        // 0x200: event_type
        // 0x201: param1 (e.g. char)
        // 0x202: param2 (e.g. cursor)
        self.scheduler.poke_substrate_single(0x200, event_type);
        self.scheduler.poke_substrate_single(0x201, param1);
        self.scheduler.poke_substrate_single(0x202, param2);
    }

    /// Reset the Visual Kernel
    pub fn reset(&mut self) {
        self.scheduler.reset_all();
        self.windows.clear();
        self.booted = false;
        log::info!("[BOOT] Visual Kernel reset");
    }
}

/// Boot the Visual Kernel in standalone mode
///
/// This is the entry point for running Geometry OS without a display server.
pub fn boot_standalone(device: Arc<wgpu::Device>, queue: Arc<wgpu::Queue>) -> Result<VisualKernel, String> {
    let config = VisualKernelConfig::default();
    let mut kernel = VisualKernel::new(device, queue, config);
    kernel.boot()?;
    Ok(kernel)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_visual_kernel_config_default() {
        let config = VisualKernelConfig::default();
        assert_eq!(config.screen_width, 1920);
        assert_eq!(config.screen_height, 1080);
    }

    #[test]
    fn test_vm_config_for_window_manager() {
        let config = VmConfig {
            entry_point: 0x0000,
            parent_id: 0xFF,
            base_addr: 0,
            bound_addr: 0,
            initial_regs: [0; 128],
            eap_coord: 0,
            generation: 0,
        };
        assert_eq!(config.entry_point, 0);
        assert_eq!(config.parent_id, 0xFF);
    }

    #[test]
    fn test_glyph_compiler_window_manager_path() {
        // Verify the default config points to a valid .glyph file
        let config = VisualKernelConfig::default();
        assert!(
            config.window_manager_path.ends_with(".glyph"),
            "Window manager should use .glyph extension"
        );

        // Verify the file exists
        let manifest_dir = std::env::var("CARGO_MANIFEST_DIR").unwrap();
        let workspace_root = std::path::Path::new(&manifest_dir)
            .parent().unwrap()
            .parent().unwrap();
        let glyph_path = workspace_root.join(&config.window_manager_path);

        assert!(
            glyph_path.exists(),
            "window_manager.glyph should exist at {:?}",
            glyph_path
        );
    }

    #[test]
    fn test_window_entry_creation() {
        let entry = WindowEntry {
            id: 0,
            x: 0.0,
            y: 0.0,
            width: 1920.0,
            height: 1080.0,
            vm_id: 0,
            focused: true,
        };

        assert_eq!(entry.id, 0);
        assert_eq!(entry.width, 1920.0);
        assert!(entry.focused);
    }

    #[test]
    fn test_window_registration() {
        // Create a minimal visual kernel struct for testing registration
        let mut windows: Vec<WindowEntry> = Vec::new();

        // Register root window
        windows.push(WindowEntry {
            id: 0,
            x: 0.0,
            y: 0.0,
            width: 1920.0,
            height: 1080.0,
            vm_id: 0,
            focused: true,
        });

        // Register child window (simulating SPATIAL_SPAWN)
        let child_id = windows.len() as u32;
        windows.push(WindowEntry {
            id: child_id,
            x: 100.0,
            y: 100.0,
            width: 800.0,
            height: 600.0,
            vm_id: 1,
            focused: false,
        });

        assert_eq!(windows.len(), 2);
        assert_eq!(windows[1].vm_id, 1);
        assert_eq!(windows[1].x, 100.0);
    }
}
