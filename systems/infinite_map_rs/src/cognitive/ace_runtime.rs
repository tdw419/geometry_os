use anyhow::{Result, anyhow};
use image::{DynamicImage, GenericImageView, GenericImage};
use std::path::Path;
use wasmtime::*;
use std::sync::{Arc, Mutex};
use crate::cognitive::entity_manager::EntityState;
use crate::cognitive::binary_extractor::ACEBinaryExtractor;

pub struct ACERuntime {
    engine: Engine,
    module: Module,
    store: Store<ACEState>,
    instance: Instance,
}

pub struct ACEState {
    pub id: String,
    pub texture_path: std::path::PathBuf,
    // Add other state fields as needed
}

impl ACERuntime {
    pub fn boot_from_texture(id: String, texture_path: &Path) -> Result<Self> {
        // 1. Load PNG
        let img = image::open(texture_path)?;
        
        // 2. Extract ACE binary from texture using real extractor
        let extractor = ACEBinaryExtractor::default();
        let binary = extractor.extract_from_image(&img)?;
        if binary.is_empty() {
            return Err(anyhow!("Failed to extract ACE binary from texture"));
        }

        // 3. Initialize WASM runtime
        let engine = Engine::default();
        let module = Module::new(&engine, &binary)?;

        // 4. Create store with ACE state
        let mut store = Store::new(&engine, ACEState {
            id,
            texture_path: texture_path.to_path_buf(),
        });

        // 5. Instantiate with host functions (linker setup)
        let mut linker = Linker::new(&engine);
        crate::cognitive::host_functions::register_host_functions(&mut linker)?;

        let instance = linker.instantiate(&mut store, &module)?;
        
        Ok(Self { engine, module, store, instance })
    }
    
    fn extract_ace_binary(img: &DynamicImage) -> Result<Vec<u8>> {
        // Extract binary using Hilbert curve mapping
        let extractor = ACEBinaryExtractor::default();
        let binary = extractor.extract_from_image(img)?;
        
        // Validate the extracted binary
        extractor.validate_binary(&binary)?;
        
        log::info!("Successfully extracted {} bytes of ACE binary", binary.len());
        
        Ok(binary)
    }
    
    pub fn think(&mut self) -> Result<()> {
        if let Ok(think_fn) = self.instance.get_typed_func::<(), ()>(&mut self.store, "think") {
            think_fn.call(&mut self.store, ())?;
        }
        Ok(())
    }
}
