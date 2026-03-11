//! Phase 40.5: Stateful Hot Swapping - ModuleManager
//!
//! The ModuleManager handles dynamic loading of `.so` files and manages
//! the lifecycle of hot-swappable modules with state preservation.
//!
//! ## Module Lifecycle
//! 1. **Load**: Load .so file and extract symbols
//! 2. **Init**: Call module_init(vat_ptr) with state from previous instance
//! 3. **Update**: Periodically call module_update() for active modules
//! 4. **Suspend**: Call module_suspend(vat_ptr) to extract state before swap
//! 5. **Unload**: Drop the library handle
//!
//! ## Usage
//! ```rust
//! use crate::hot_swap::{ModuleManager, VatRegistry};
//!
//! let mut manager = ModuleManager::new(vat_registry);
//! manager.load_module("target/debug/libmy_module.so").unwrap();
//! manager.update_all(); // Call update on all loaded modules
//! ```

use super::{VatBuffer, VatError, VatId, VatRegistry};
use libloading::{Library, Symbol};
use std::collections::HashMap;
use std::path::{Path, PathBuf};
use std::sync::{Arc, Mutex};
use std::time::{Duration, SystemTime, UNIX_EPOCH};

/// Errors that can occur during module operations
#[derive(Debug, Clone)]
pub enum ModuleError {
    LoadFailed(String),
    SymbolNotFound(String),
    InitFailed(String),
    SuspendFailed(String),
    UpdateFailed(String),
    VatError(VatError),
    AlreadyLoaded,
    NotFound,
    InvalidPath,
}

impl From<VatError> for ModuleError {
    fn from(err: VatError) -> Self {
        ModuleError::VatError(err)
    }
}

impl std::fmt::Display for ModuleError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            ModuleError::LoadFailed(msg) => write!(f, "Failed to load module: {}", msg),
            ModuleError::SymbolNotFound(name) => write!(f, "Symbol not found: {}", name),
            ModuleError::InitFailed(msg) => write!(f, "Module init failed: {}", msg),
            ModuleError::SuspendFailed(msg) => write!(f, "Module suspend failed: {}", msg),
            ModuleError::UpdateFailed(msg) => write!(f, "Module update failed: {}", msg),
            ModuleError::VatError(e) => write!(f, "Vat error: {:?}", e),
            ModuleError::AlreadyLoaded => write!(f, "Module already loaded"),
            ModuleError::NotFound => write!(f, "Module not found"),
            ModuleError::InvalidPath => write!(f, "Invalid module path"),
        }
    }
}

impl std::error::Error for ModuleError {}

/// Status of a loaded module
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum ModuleStatus {
    /// Module is loading
    Loading,
    /// Module is active and running
    Active,
    /// Module is suspended (state extracted)
    Suspended,
    /// Module is being hot-swapped
    Swapping,
    /// Module failed to load or crashed
    Failed,
}

/// Metadata for a loaded module
#[derive(Debug, Clone)]
pub struct ModuleMetadata {
    pub path: PathBuf,
    pub vat_id: VatId,
    pub status: ModuleStatus,
    pub loaded_at: f64,
    pub last_updated: f64,
    pub update_count: u64,
    pub version: u32,
}

impl ModuleMetadata {
    fn new(path: PathBuf, vat_id: VatId) -> Self {
        let now = SystemTime::now()
            .duration_since(UNIX_EPOCH)
            .unwrap_or_default()
            .as_secs_f64();
        Self {
            path,
            vat_id,
            status: ModuleStatus::Loading,
            loaded_at: now,
            last_updated: now,
            update_count: 0,
            version: 1,
        }
    }
}

/// Type aliases for module function signatures
pub type ModuleInitFn = unsafe fn(*mut u8, usize) -> i32;
pub type ModuleSuspendFn = unsafe fn(*mut u8, usize) -> i32;
pub type ModuleUpdateFn = unsafe fn() -> i32;

/// A loaded dynamic module
pub struct LoadedModule {
    /// The loaded library handle
    #[allow(dead_code)]
    library: Library,
    /// Module metadata
    pub metadata: ModuleMetadata,
    /// Module init function
    init_fn: Symbol<'static, ModuleInitFn>,
    /// Module suspend function
    suspend_fn: Symbol<'static, ModuleSuspendFn>,
    /// Module update function (optional)
    update_fn: Option<Symbol<'static, ModuleUpdateFn>>,
}

impl LoadedModule {
    /// Load a module from a path
    pub fn load(path: &Path) -> Result<Self, ModuleError> {
        let canonical_path = path.canonicalize().map_err(|_e| {
            ModuleError::InvalidPath
        })?;
        
        let vat_id = VatId::from_path(canonical_path.to_str().unwrap_or("unknown"));
        let metadata = ModuleMetadata::new(canonical_path.clone(), vat_id);

        // SAFETY: Loading dynamic libraries is inherently unsafe
        let library = unsafe {
            Library::new(&canonical_path).map_err(|e| {
                ModuleError::LoadFailed(e.to_string())
            })?
        };

        // Extract required symbols
        let init_fn: Symbol<ModuleInitFn> = unsafe {
            library.get(b"module_init").map_err(|_| {
                ModuleError::SymbolNotFound("module_init".to_string())
            })?
        };

        let suspend_fn: Symbol<ModuleSuspendFn> = unsafe {
            library.get(b"module_suspend").map_err(|_| {
                ModuleError::SymbolNotFound("module_suspend".to_string())
            })?
        };

        // Update function is optional
        let update_fn: Option<Symbol<ModuleUpdateFn>> = unsafe {
            library.get(b"module_update").ok()
        };

        // Convert to 'static lifetime (we manage the library lifetime separately)
        let init_fn = unsafe { std::mem::transmute(init_fn) };
        let suspend_fn = unsafe { std::mem::transmute(suspend_fn) };
        let update_fn = update_fn.map(|f| unsafe { std::mem::transmute(f) });

        Ok(Self {
            library,
            metadata,
            init_fn,
            suspend_fn,
            update_fn,
        })
    }

    /// Initialize the module with state from a VatBuffer
    pub fn init(&mut self, state: Option<&VatBuffer>) -> Result<(), ModuleError> {
        let result = if let Some(buffer) = state {
            let data = &buffer.data;
            unsafe {
                (self.init_fn)(data.as_ptr() as *mut u8, data.len())
            }
        } else {
            unsafe {
                (self.init_fn)(std::ptr::null_mut(), 0)
            }
        };

        if result == 0 {
            self.metadata.status = ModuleStatus::Active;
            Ok(())
        } else {
            self.metadata.status = ModuleStatus::Failed;
            Err(ModuleError::InitFailed(format!("Exit code: {}", result)))
        }
    }

    /// Suspend the module and extract state
    pub fn suspend(&mut self) -> Result<VatBuffer, ModuleError> {
        self.metadata.status = ModuleStatus::Suspended;

        // Allocate a buffer for the module to write state into
        let mut buffer = vec![0u8; 65536]; // 64KB max state size
        
        let result = unsafe {
            (self.suspend_fn)(buffer.as_mut_ptr(), buffer.len())
        };

        if result < 0 {
            return Err(ModuleError::SuspendFailed(format!("Exit code: {}", result)));
        }

        // The module returns the actual size written
        let actual_size = result as usize;
        buffer.truncate(actual_size);

        let mut vat_buffer = VatBuffer::from_data(self.metadata.vat_id.clone(), buffer);
        vat_buffer.finalize();

        Ok(vat_buffer)
    }

    /// Call the module's update function
    pub fn update(&mut self) -> Result<(), ModuleError> {
        if let Some(ref update_fn) = self.update_fn {
            let result = unsafe { (update_fn)() };
            
            if result != 0 {
                return Err(ModuleError::UpdateFailed(format!("Exit code: {}", result)));
            }

            self.metadata.update_count += 1;
            self.metadata.last_updated = SystemTime::now()
                .duration_since(UNIX_EPOCH)
                .unwrap_or_default()
                .as_secs_f64();
        }
        
        Ok(())
    }
}

/// Manager for dynamically loaded modules with hot-swap support
pub struct ModuleManager {
    /// Loaded modules by their VatId
    modules: HashMap<VatId, LoadedModule>,
    /// Path to VatId mapping
    path_map: HashMap<PathBuf, VatId>,
    /// Vat registry for state persistence
    vat_registry: Arc<Mutex<VatRegistry>>,
    /// Module search paths
    search_paths: Vec<PathBuf>,
    /// Whether to auto-reload on file changes
    auto_reload: bool,
    /// File modification times for detecting changes
    file_mtimes: HashMap<PathBuf, SystemTime>,
}

impl ModuleManager {
    /// Create a new ModuleManager
    pub fn new(vat_registry: Arc<Mutex<VatRegistry>>) -> Self {
        Self {
            modules: HashMap::new(),
            path_map: HashMap::new(),
            vat_registry,
            search_paths: vec![PathBuf::from("target/debug"), PathBuf::from("modules")],
            auto_reload: true,
            file_mtimes: HashMap::new(),
        }
    }

    /// Add a search path for modules
    pub fn add_search_path(&mut self, path: PathBuf) {
        self.search_paths.push(path);
    }

    /// Enable/disable auto-reload
    pub fn set_auto_reload(&mut self, enabled: bool) {
        self.auto_reload = enabled;
    }

    /// Load a module from a path
    pub fn load_module(&mut self, path: &Path) -> Result<VatId, ModuleError> {
        let canonical = path.canonicalize().map_err(|_| ModuleError::InvalidPath)?;
        
        // Check if already loaded
        if self.path_map.contains_key(&canonical) {
            return Err(ModuleError::AlreadyLoaded);
        }

        log::info!("🔧 Loading module: {}", canonical.display());

        // Load the module
        let mut module = LoadedModule::load(&canonical)?;
        let vat_id = module.metadata.vat_id.clone();

        // Try to restore state from vat registry
        let state = self.vat_registry.lock()
            .ok()
            .and_then(|reg| reg.get_vat(&vat_id).cloned());

        // Initialize the module
        module.init(state.as_ref())?;

        log::info!("✅ Module loaded: {} (vat_id: {})", 
            canonical.display(), 
            vat_id.as_str()
        );

        // Store the module
        self.path_map.insert(canonical.clone(), vat_id.clone());
        self.file_mtimes.insert(canonical.clone(), 
            std::fs::metadata(&canonical)
                .and_then(|m| m.modified())
                .unwrap_or_else(|_| SystemTime::now())
        );
        self.modules.insert(vat_id.clone(), module);

        Ok(vat_id)
    }

    /// Load a module by name (searches in search_paths)
    pub fn load_module_by_name(&mut self, name: &str) -> Result<VatId, ModuleError> {
        for search_path in &self.search_paths {
            let path = search_path.join(format!("lib{}.so", name));
            if path.exists() {
                return self.load_module(&path);
            }
            
            // Also try without lib prefix
            let path = search_path.join(format!("{}.so", name));
            if path.exists() {
                return self.load_module(&path);
            }
        }

        Err(ModuleError::NotFound)
    }

    /// Unload a module by VatId
    pub fn unload_module(&mut self, vat_id: &VatId) -> Result<(), ModuleError> {
        let mut module = self.modules.remove(vat_id)
            .ok_or(ModuleError::NotFound)?;

        log::info!("🔧 Suspending module: {}", vat_id.as_str());

        // Suspend and save state
        match module.suspend() {
            Ok(buffer) => {
                if let Ok(mut registry) = self.vat_registry.lock() {
                    if let Err(e) = registry.register_vat(buffer) {
                        log::warn!("Failed to persist vat: {:?}", e);
                    }
                }
            }
            Err(e) => {
                log::warn!("Failed to suspend module: {}", e);
            }
        }

        // Remove from path map
        self.path_map.retain(|_, id| id != vat_id);

        log::info!("✅ Module unloaded: {}", vat_id.as_str());
        Ok(())
    }

    /// Hot-swap a module (reload without losing state)
    pub fn hot_swap(&mut self, path: &Path) -> Result<VatId, ModuleError> {
        let canonical = path.canonicalize().map_err(|_| ModuleError::InvalidPath)?;
        
        // Check if already loaded
        if let Some(old_vat_id) = self.path_map.get(&canonical).cloned() {
            log::info!("🔄 Hot-swapping module: {}", canonical.display());

            // Suspend old module and extract state
            let mut old_module = self.modules.remove(&old_vat_id)
                .ok_or(ModuleError::NotFound)?;
            
            old_module.metadata.status = ModuleStatus::Swapping;
            
            let state = old_module.suspend()?;
            
            // Store state in registry
            {
                let mut registry = self.vat_registry.lock()
                    .map_err(|_| ModuleError::VatError(VatError::SerializationFailed("Lock failed".to_string())))?;
                registry.register_vat(state.clone())?;
            }

            // Load new module
            let mut new_module = LoadedModule::load(&canonical)?;
            let new_vat_id = new_module.metadata.vat_id.clone();

            // Initialize with saved state
            new_module.init(Some(&state))?;

            // Update mappings
            self.path_map.insert(canonical, new_vat_id.clone());
            self.modules.insert(new_vat_id.clone(), new_module);

            log::info!("✅ Module hot-swapped: {} -> {}", 
                old_vat_id.as_str(),
                new_vat_id.as_str()
            );

            Ok(new_vat_id)
        } else {
            // Not loaded yet, just load it
            self.load_module(&canonical)
        }
    }

    /// Update all active modules
    pub fn update_all(&mut self) {
        for (vat_id, module) in &mut self.modules {
            if module.metadata.status == ModuleStatus::Active {
                if let Err(e) = module.update() {
                    log::warn!("Module update failed ({}): {}", vat_id.as_str(), e);
                }
            }
        }
    }

    /// Check for file changes and reload if necessary
    pub fn check_for_changes(&mut self) -> Vec<(PathBuf, VatId)> {
        let mut reloaded = Vec::new();

        if !self.auto_reload {
            return reloaded;
        }

        // Collect paths to check first (avoid borrow issues)
        let paths_to_check: Vec<PathBuf> = self.path_map.keys().cloned().collect();
        
        for path in paths_to_check {
            if let Ok(metadata) = std::fs::metadata(&path) {
                if let Ok(mtime) = metadata.modified() {
                    if let Some(old_mtime) = self.file_mtimes.get(&path) {
                        if mtime > *old_mtime {
                            log::info!("📝 Detected change in: {}", path.display());
                            
                            // Trigger hot-swap
                            match self.hot_swap(&path) {
                                Ok(new_vat_id) => {
                                    reloaded.push((path.clone(), new_vat_id));
                                }
                                Err(e) => {
                                    log::error!("Hot-swap failed for {}: {}", path.display(), e);
                                }
                            }
                        }
                    }
                    self.file_mtimes.insert(path.clone(), mtime);
                }
            }
        }

        reloaded
    }

    /// Get module metadata
    pub fn get_module(&self, vat_id: &VatId) -> Option<&LoadedModule> {
        self.modules.get(vat_id)
    }

    /// Get mutable module
    pub fn get_module_mut(&mut self, vat_id: &VatId) -> Option<&mut LoadedModule> {
        self.modules.get_mut(vat_id)
    }

    /// List all loaded modules
    pub fn list_modules(&self) -> Vec<&ModuleMetadata> {
        self.modules.values()
            .map(|m| &m.metadata)
            .collect()
    }

    /// Get module by path
    pub fn get_module_by_path(&self, path: &Path) -> Option<&LoadedModule> {
        self.path_map.get(path)
            .and_then(|vat_id| self.modules.get(vat_id))
    }

    /// Unload all modules
    pub fn unload_all(&mut self) {
        let vat_ids: Vec<VatId> = self.modules.keys().cloned().collect();
        for vat_id in vat_ids {
            if let Err(e) = self.unload_module(&vat_id) {
                log::warn!("Failed to unload module {}: {}", vat_id.as_str(), e);
            }
        }
    }

    /// Get count of loaded modules
    pub fn module_count(&self) -> usize {
        self.modules.len()
    }
}

impl Drop for ModuleManager {
    fn drop(&mut self) {
        self.unload_all();
    }
}

/// Builder for creating test/dummy modules
pub struct DummyModuleBuilder;

impl DummyModuleBuilder {
    /// Create a C source file for a test module
    pub fn generate_c_source(_name: &str, counter_init: u32) -> String {
        format!(r#"
#include <stdint.h>
#include <string.h>

static uint32_t counter = {};

// Initialize module from state
int module_init(uint8_t* data, size_t len) {{
    if (data && len >= sizeof(uint32_t)) {{
        memcpy(&counter, data, sizeof(uint32_t));
    }}
    return 0; // Success
}}

// Suspend module and save state
int module_suspend(uint8_t* data, size_t len) {{
    if (data && len >= sizeof(uint32_t)) {{
        memcpy(data, &counter, sizeof(uint32_t));
        return sizeof(uint32_t);
    }}
    return -1; // Error
}}

// Update module (called each frame)
int module_update() {{
    counter++;
    return 0;
}}
"#, counter_init)
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::path::PathBuf;

    #[test]
    fn test_module_manager_creation() {
        let registry = Arc::new(Mutex::new(VatRegistry::new(PathBuf::from("/tmp/test_vats"))));
        let manager = ModuleManager::new(registry);
        assert_eq!(manager.module_count(), 0);
    }

    #[test]
    fn test_module_metadata() {
        let meta = ModuleMetadata::new(
            PathBuf::from("/test/module.so"),
            VatId::new("test")
        );
        assert_eq!(meta.status, ModuleStatus::Loading);
        assert_eq!(meta.version, 1);
    }

    #[test]
    fn test_vat_id_from_path() {
        let vat_id1 = VatId::from_path("/path/to/module.so");
        let vat_id2 = VatId::from_path("/path/to/module.so");
        assert_eq!(vat_id1.as_str(), vat_id2.as_str());
    }

    #[test]
    fn test_dummy_module_builder() {
        let source = DummyModuleBuilder::generate_c_source("test", 42);
        assert!(source.contains("module_init"));
        assert!(source.contains("module_suspend"));
        assert!(source.contains("module_update"));
        assert!(source.contains("counter = 42"));
    }
}
