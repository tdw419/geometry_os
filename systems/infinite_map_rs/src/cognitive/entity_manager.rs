use std::collections::HashMap;
use std::path::PathBuf;
use std::sync::Arc;
use parking_lot::RwLock;
use crate::cognitive::entity_type::EntityType;

/// Manages the lifecycle of cognitive entities
pub struct CognitiveEntityManager {
    entities: Arc<RwLock<HashMap<String, ACEEntity>>>,
}

#[derive(Debug, Clone)]
pub struct ACEEntity {
    pub id: String,
    pub texture_path: PathBuf,
    pub state: EntityState,
    pub entity_type: EntityType,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub enum EntityState {
    Dormant,      // Loaded but not running
    Booting,      // Initializing
    Active,       // Running and thinking
    Suspended,    // Paused
    Error(String), // Failed state
}

impl CognitiveEntityManager {
    pub fn new() -> Self {
        Self {
            entities: Arc::new(RwLock::new(HashMap::new())),
        }
    }

    pub fn register_entity(&self, id: String, texture_path: PathBuf, entity_type: EntityType) {
        let mut entities = self.entities.write();
        entities.insert(id.clone(), ACEEntity {
            id,
            texture_path,
            state: EntityState::Dormant,
            entity_type,
        });
    }

    pub fn set_state(&self, id: &str, state: EntityState) {
        let mut entities = self.entities.write();
        if let Some(entity) = entities.get_mut(id) {
            entity.state = state;
        }
    }

    pub fn get_entity_state(&self, id: &str) -> Option<EntityState> {
        let entities = self.entities.read();
        entities.get(id).map(|e| e.state.clone())
    }

    pub fn list_entities(&self) -> Vec<ACEEntity> {
        let entities = self.entities.read();
        entities.values().cloned().collect()
    }
}
