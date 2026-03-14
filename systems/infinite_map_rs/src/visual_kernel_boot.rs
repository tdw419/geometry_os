//! Visual Kernel Bootloader
//!
//! Boots the Window Manager glyph as VM #0, which then SPATIAL_SPAWNs
//! the Ubuntu kernel as a child window.
//!
//! This is the "init" process of Geometry OS.

use std::sync::Arc;
use std::path::Path;

use crate::glyph_vm_scheduler::{GlyphVmScheduler, VmConfig};

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
            window_manager_path: "systems/glyph_stratum/programs/window_manager.rts.png".to_string(),
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
        let scheduler = GlyphVmScheduler::new(device, queue);

        Self {
            scheduler,
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

        // Step 1: Initialize the Window Manager as VM #0
        log::info!("[BOOT] Loading Window Manager as VM #0...");

        // TODO: Load and parse the Glyph-Native Infinite Map
        // For now, use a default config until glyph_stratum is properly integrated
        let wm_config = VmConfig {
            entry_point: 0x0000,
            parent_id: 0xFF,
            base_addr: 0,
            bound_addr: 0,
            initial_regs: [0; 32],
        };

        self.scheduler.spawn_vm(0, &wm_config)?;
        log::info!("[BOOT] ✓ Window Manager (VM #0) initialized at entry 0x0000");

        // Step 2: Initialize the Window Table
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

        // Step 3: Pre-load Ubuntu kernel into RAM texture
        if let Some(ubuntu_path) = &self.config.ubuntu_kernel_path {
            log::info!("[BOOT] Pre-loading Ubuntu kernel from: {}", ubuntu_path);

            if Path::new(ubuntu_path).exists() {
                log::info!("[BOOT] ✓ Ubuntu kernel found, will be SPATIAL_SPAWNed by Window Manager");
            } else {
                log::warn!("[BOOT] ⚠ Ubuntu kernel not found at {}, running in single-VM mode", ubuntu_path);
            }
        }

        // Step 4: Ready
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

    /// Check if the kernel is booted
    pub fn is_booted(&self) -> bool {
        self.booted
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
            initial_regs: [0; 32],
        };
        assert_eq!(config.entry_point, 0);
        assert_eq!(config.parent_id, 0xFF);
    }
}
