//! GPU Adapter Selection
//!
//! Smart GPU selection preferring discrete GPUs for best Glyph VM performance.

use log::{error, info};
use wgpu::{Adapter, DeviceType, Instance, Surface};

pub struct AdapterSelector {
    instance: Instance,
}

impl AdapterSelector {
    pub fn new() -> Self {
        let instance = wgpu::Instance::new(wgpu::InstanceDescriptor {
            backends: wgpu::Backends::all(),
            ..Default::default()
        });
        Self { instance }
    }

    pub fn instance(&self) -> &Instance {
        &self.instance
    }

    pub fn select_adapter(&self, surface: &Surface) -> Adapter {
        let mut adapters = self.instance.enumerate_adapters(wgpu::Backends::all());

        info!("Available GPU Adapters: {}", adapters.len());

        if adapters.is_empty() {
            error!("No GPU adapters found!");
            panic!("No GPU adapters available - check graphics drivers");
        }

        for (i, adapter) in adapters.iter().enumerate() {
            let info = adapter.get_info();
            info!("  [{}] {} ({:?})", i, info.name, info.device_type);
        }

        let adapter = if let Ok(gpu_index) = std::env::var("GEOS_GPU") {
            self.select_by_index(&mut adapters, &gpu_index)
        } else {
            self.auto_select(&mut adapters)
        };

        self.log_adapter_details(&adapter, surface);
        adapter
    }

    fn select_by_index(&self, adapters: &mut Vec<Adapter>, index_str: &str) -> Adapter {
        match index_str.parse::<usize>() {
            Ok(idx) if idx < adapters.len() => {
                info!("Using GPU {} (GEOS_GPU env)", idx);
                adapters.swap_remove(idx)
            }
            _ => {
                error!("Invalid GEOS_GPU value: {}", index_str);
                panic!("GEOS_GPU must be a valid adapter index");
            }
        }
    }

    fn auto_select(&self, adapters: &mut Vec<Adapter>) -> Adapter {
        info!("Auto-selecting GPU...");

        // Prefer discrete GPU
        let discrete_idx = adapters
            .iter()
            .position(|a| a.get_info().device_type == DeviceType::DiscreteGpu);

        let integrated_idx = adapters
            .iter()
            .position(|a| a.get_info().device_type == DeviceType::IntegratedGpu);

        let idx = discrete_idx
            .or(integrated_idx)
            .unwrap_or(0);

        let selected = adapters.swap_remove(idx);
        info!("Selected: {} ({:?})", selected.get_info().name, selected.get_info().device_type);
        selected
    }

    fn log_adapter_details(&self, adapter: &Adapter, surface: &Surface) {
        let info = adapter.get_info();
        let limits = adapter.limits();

        info!("Selected GPU: {}", info.name);
        info!("  Type: {:?}", info.device_type);
        info!("  Backend: {:?}", info.backend);
        info!("  Max Storage Buffer: {} MB", limits.max_storage_buffer_binding_size / 1_000_000);
        info!("  Max Compute Workgroup: {}", limits.max_compute_workgroup_size_x);

        if adapter.is_surface_supported(surface) {
            info!("  Surface: Compatible");
        } else {
            error!("  Surface: NOT COMPATIBLE");
            panic!("Selected GPU cannot render to window surface");
        }
    }
}

impl Default for AdapterSelector {
    fn default() -> Self {
        Self::new()
    }
}
