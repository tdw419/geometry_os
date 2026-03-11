use serde::{Deserialize, Serialize};

/// Types of entities in the system
#[derive(Debug, Clone, Copy, PartialEq, Eq, Serialize, Deserialize)]
pub enum EntityType {
    /// Regular data files (read-only)
    Static,
    /// Bootable applications (single execution)
    Executable,
    /// Living AI agents (persistent execution)
    CognitiveEntity,
}

/// Metadata structure for RTS textures
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct RTSMetadata {
    pub format: Option<String>,
    pub version: Option<String>,
    pub executable: Option<bool>,
    pub description: Option<String>,
}

/// Detect entity type from metadata
pub fn detect_entity_type(metadata: &RTSMetadata) -> EntityType {
    if let Some(format) = &metadata.format {
        if format == "ace-rts-v1" {
            return EntityType::CognitiveEntity;
        }
    }
    
    if metadata.executable.unwrap_or(false) {
        return EntityType::Executable;
    }
    
    EntityType::Static
}
