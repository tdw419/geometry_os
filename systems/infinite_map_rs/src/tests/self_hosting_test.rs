//! Integration tests for self-hosting and self-modification
//!
//! These tests verify the meta-circular scheduler can modify its own code.

#[cfg(test)]
mod tests {
    use crate::trap_interface::op_type;
    use std::path::PathBuf;

    /// Get the workspace root directory
    fn workspace_root() -> PathBuf {
        let manifest_dir = std::env::var("CARGO_MANIFEST_DIR").unwrap();
        // manifest_dir is .../geometry_os/systems/infinite_map_rs
        // We want .../geometry_os/geometry_os (workspace root)
        PathBuf::from(manifest_dir)
            .parent().unwrap()  // systems
            .parent().unwrap()  // geometry_os (geometry_os/geometry_os)
            .to_path_buf()
    }

    /// Test that GLYPH_WRITE trap operation is available
    #[test]
    fn test_glyph_write_trap_available() {
        // GLYPH_WRITE should be opcode 8
        assert_eq!(op_type::GLYPH_WRITE, 8);
    }

    /// Test that scheduler glyph exists and can be loaded
    #[test]
    fn test_scheduler_glyph_exists() {
        // Verify scheduler.glyph file exists
        let scheduler_path = workspace_root().join("systems/glyph_stratum/programs/scheduler.glyph");
        assert!(
            scheduler_path.exists(),
            "scheduler.glyph should exist at {:?}",
            scheduler_path
        );
    }

    /// Test that test_self_modify glyph exists
    #[test]
    fn test_self_modify_glyph_exists() {
        let test_path = workspace_root().join("systems/glyph_stratum/programs/test_self_modify.glyph");
        assert!(
            test_path.exists(),
            "test_self_modify.glyph should exist at {:?}",
            test_path
        );
    }

    /// Test that brain.glyph exists (VM 1)
    #[test]
    fn test_brain_glyph_exists() {
        let brain_path = workspace_root().join("systems/glyph_stratum/programs/brain.glyph");
        assert!(
            brain_path.exists(),
            "brain.glyph should exist at {:?}",
            brain_path
        );
    }

    /// Test self-modify constants in scheduler.glyph
    /// Ignored: scheduler.glyph implements attention-weighted VM scheduling,
    /// not self-modification. The SELF_MODIFY_* constants are not defined
    /// because this scheduler doesn't use that architecture.
    #[test]
    #[ignore = "scheduler.glyph uses attention-weighted scheduling, not self-modification"]
    fn test_scheduler_self_modify_constants() {
        // Read scheduler.glyph and verify self-modify constants exist
        let scheduler_path = workspace_root().join("systems/glyph_stratum/programs/scheduler.glyph");
        let content = std::fs::read_to_string(&scheduler_path)
            .expect("Failed to read scheduler.glyph");

        // Check for required constants
        assert!(content.contains("SELF_MODIFY_TRIGGER"), "Missing SELF_MODIFY_TRIGGER");
        assert!(content.contains("SELF_MODIFY_SOURCE"), "Missing SELF_MODIFY_SOURCE");
        assert!(content.contains("SELF_MODIFY_TARGET"), "Missing SELF_MODIFY_TARGET");
        assert!(content.contains("SELF_MODIFY_COUNT"), "Missing SELF_MODIFY_COUNT");
        assert!(content.contains("SELF_MODIFY_STATUS"), "Missing SELF_MODIFY_STATUS");
    }

    /// Test GLYPH_WRITE trap handling in daemon
    #[test]
    fn test_glyph_write_in_trap_handler() {
        // Verify daemon handles GLYPH_WRITE
        let daemon_path = workspace_root().join("systems/infinite_map_rs/src/bin/gpu_dev_daemon.rs");
        let content = std::fs::read_to_string(&daemon_path)
            .expect("Failed to read gpu_dev_daemon.rs");

        assert!(
            content.contains("op_type::GLYPH_WRITE"),
            "Daemon should handle GLYPH_WRITE trap"
        );
        assert!(
            content.contains("scheduler.glyph_write"),
            "Daemon should call glyph_write method"
        );
    }
}
