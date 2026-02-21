use image::GenericImageView;
use std::process::Command;
use std::path::Path;
use serde_json::Value;

pub struct TileExecutor;

impl TileExecutor {
    pub fn run(tile_name: &str) -> Result<String, String> {
        let manifest_path = "systems/crystallization/MANIFEST.json";
        
        // 1. Load Manifest
        let manifest_content = std::fs::read_to_string(manifest_path)
            .map_err(|e| format!("Failed to read manifest: {}", e))?;
            
        let manifest: Value = serde_json::from_str(&manifest_content)
            .map_err(|e| format!("Invalid manifest JSON: {}", e))?;
            
        // 2. Resolve Tile Path
        let tile_path_str = manifest["tiles"][tile_name]["path"]
            .as_str()
            .ok_or(format!("Tile '{}' not found in manifest", tile_name))?;
            
        let tile_path = Path::new("systems/crystallization").join(tile_path_str);
        
        if !tile_path.exists() {
            return Err(format!("Tile file missing: {:?}", tile_path));
        }
        
        println!("🚀 EXECUTING TILE: {:?}", tile_path);
        
        // 3. Execute via Cortex (rts_exec.py -> cortex.rts.png)
        // For Phase 32.5, we shell out to python3. 
        // In Phase 33, we will use embedded PyO3 or Cortex tile directly.
        
        let output = Command::new("python3")
            .arg("systems/kernel/rts_exec.py") // The "Cortex" logic
            .arg(tile_path)
            .output()
            .map_err(|e| format!("Execution failed: {}", e))?;
            
        let stdout = String::from_utf8_lossy(&output.stdout);
        let stderr = String::from_utf8_lossy(&output.stderr);
        
        if !output.status.success() {
            return Err(format!("Tile Runtime Fracture:\n{}", stderr));
        }
        
        Ok(stdout.to_string())
    }
}
