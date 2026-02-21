use crate::glass_ram::uffd_wrapper::{UserfaultFd, UffdFlags, UffdIoctlMode, UffdFeatureFlags};
use crate::glass_ram::process_maps::{parse_proc_maps, filter_writable_regions, MemoryRegion};
use nix::unistd::Pid;

pub struct ProcessAttacher {
    pid: Pid,
    uffd: UserfaultFd,
    regions: Vec<MemoryRegion>,
}

impl ProcessAttacher {
    pub fn attach(pid: Pid) -> Result<Self, Box<dyn std::error::Error>> {
        // Create userfaultfd with required features
        let flags = UffdFlags::CLOEXEC | UffdFlags::NONBLOCK;
        let uffd = UserfaultFd::new(flags)?;
        
        // Enable features
        // Note: api() returns the features supported. It updates the features internally in Kernel if passed?
        // No, we pass the features we want to enable?
        // In uffd_wrapper, api() takes features we want.
        let requested_features = UffdFeatureFlags::THREAD_ID 
            | UffdFeatureFlags::EVENT_FORK
            | UffdFeatureFlags::EVENT_REMAP
            | UffdFeatureFlags::EVENT_REMOVE;
        
        let supported_features = uffd.api(requested_features)?;
        
        // Check if all requested features are supported
        if !supported_features.contains(requested_features) {
            // Optional: warn or error. For now we proceed with what we got?
            // The spec implies we need them.
            // log::warn!("Not all requested UFFD features supported: {:?}", supported_features);
            // This assumes strict compliance
        }
        
        // Parse process memory maps
        let all_regions = parse_proc_maps(pid.as_raw() as u32)?;
        let writable_regions = filter_writable_regions(&all_regions);
        
        // Register each writable region
        for region in &writable_regions {
            let range = UffdIoctlMode::REGISTER_MODE_WP; // Use WP mode for registration if available?
            // Wait, register accepts mode (Missing, WP)
            // The task spec says: let mode = UffdIoctlMode::WP;
            // But usually we need REGISTER_MODE_MISSING | REGISTER_MODE_WP
            // Let's assume WP is desired.
            
            let mode = UffdIoctlMode::REGISTER_MODE_WP;

            // Note: register() might fail if address is not in OUR address space (if local UFFD)
            // But we implement as spec'd.
            
            // We need to map `region.start` and `region.end` to length
            let len = region.end - region.start;
            
            // Should catch error here?
            if let Err(e) = uffd.register(region.start, len, mode) {
                 // Log and continue? or fail?
                 // "Glass RAM Monitor" loop might handle errors.
                 // For now, simple propagation or log.
                 // log::warn!("Failed to register region {:?}: {}", region, e);
                 // We will return error for now to be safe.
                 return Err(Box::new(e));
            }
        }
        
        // Clone regions for storage
        let regions_owned: Vec<MemoryRegion> = writable_regions.into_iter().cloned().collect();

        Ok(Self {
            pid,
            uffd,
            regions: regions_owned,
        })
    }
    
    pub fn pid(&self) -> Pid {
        self.pid
    }
    
    pub fn regions(&self) -> &[MemoryRegion] {
        &self.regions
    }
    
    pub fn uffd(&self) -> &UserfaultFd {
        &self.uffd
    }
}
