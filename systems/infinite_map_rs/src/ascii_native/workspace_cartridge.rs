// src/ascii_native/workspace_cartridge.rs
//! Workspace Cartridge Generator
//!
//! Generates workspace.rts.png from workspace.ascii template.

use crate::glyph_to_cartridge::compile_glyph_to_cartridge;
use std::path::Path;

/// Generate workspace cartridge
pub fn generate_workspace_cartridge<P: AsRef<Path>>(output_path: P) -> Result<(), String> {
    // Load workspace glyph program
    let workspace_glyph =
        include_str!("../../../../systems/glyph_stratum/programs/workspace.glyph");

    // Compile to cartridge
    compile_glyph_to_cartridge(workspace_glyph, output_path)
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::path::PathBuf;

    fn temp_path(name: &str) -> PathBuf {
        std::env::temp_dir().join(name)
    }

    #[test]
    fn test_workspace_cartridge_generates() {
        let output = temp_path("test_workspace.rts.png");
        generate_workspace_cartridge(&output).expect("Should generate");
        assert!(output.exists(), "Cartridge file should exist");

        let img = image::open(&output).expect("Should load as PNG");
        assert!(img.width() > 0, "Should have width");

        std::fs::remove_file(&output).ok();
    }
}
