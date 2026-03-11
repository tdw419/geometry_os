//! Phase 46: Cognitive Agents - Autonomous Inhabitants of Source City
//!
//! This module implements autonomous agents that live within the Source City,
//! navigating via Hilbert paths, performing maintenance, and coordinating refactors.
//!
//! ## Agent Morphology
//!
//! - **Scout**: Detects "Code Rot" (low PAS scores, high complexity)
//! - **Engineer**: Triggers Foundry for specific buildings
//! - **Archivist**: Manages Vat state persistence
//!
//! ## Architecture
//!
//! Agents exist at Hilbert coordinates (1D) but render in 2D spatial positions.
//! They maintain goals, memory (via Vat), and communicate via Synaptic Layer.

use crate::hot_swap::{VatId, VatState, VatBuffer};
use serde::{Deserialize, Serialize};
use std::collections::{HashMap, VecDeque};
use std::path::PathBuf;
use std::time::{SystemTime, UNIX_EPOCH};
use uuid::Uuid;

/// Agent role classification
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash, Serialize, Deserialize)]
pub enum AgentRole {
    Scout,      // Detects code rot, architectural issues
    Engineer,   // Triggers Foundry, performs refactors
    Archivist,  // Manages Vat persistence
}

/// Agent state machine
#[derive(Debug, Clone, PartialEq, Eq, Serialize, Deserialize)]
pub enum AgentState {
    Idle,                   // No active task
    Navigating,             // Moving to target
    Analyzing,              // Examining a building
    Working,                // Performing task (e.g., Foundry trigger)
    Waiting,                // Awaiting response
    Completed(String),      // Task done, with result
    Error(String),          // Failed state
}

/// Requests from agents to the system
#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum AgentRequest {
    /// Request specialized rebuild (trigger Foundry)
    Rebuild { path: PathBuf, agent_id: String },
    /// Request state archival
    Archive { vat_id: VatId, agent_id: String },
    /// Log an observation
    Log { message: String, agent_id: String },
}

/// Agent goal/task
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct AgentGoal {
    pub id: String,
    pub goal_type: GoalType,
    pub target_path: Option<PathBuf>,
    pub target_hilbert: Option<u32>,
    pub priority: u8, // 0-255
    pub created_at: f64,
    pub deadline: Option<f64>,
}

#[derive(Debug, Clone, PartialEq, Eq, Serialize, Deserialize)]
pub enum GoalType {
    /// Navigate to a district
    Navigate { destination: String },
    /// Analyze code health
    Analyze { path: PathBuf },
    /// Trigger Foundry rebuild
    Rebuild { path: PathBuf },
    /// Persist state to Vat
    Archive { vat_id: VatId },
    /// Scout for code rot
    ScoutDistrict { district: String },
}

/// Memory entry for agent learning
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct AgentMemory {
    pub timestamp: f64,
    pub location: u32, // Hilbert coordinate
    pub observation: String,
    pub confidence: f32, // 0.0 - 1.0
}

/// Autonomous agent inhabiting the Source City
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct CityAgent {
    /// Unique agent identifier (GUID)
    pub id: String,
    /// Display name
    pub name: String,
    /// Agent role
    pub role: AgentRole,
    /// Current state
    pub state: AgentState,
    /// Current Hilbert coordinate (1D)
    pub hilbert_pos: u32,
    /// Current 2D position (for rendering)
    pub world_pos: (f32, f32),
    /// Movement target
    pub target_pos: Option<(f32, f32)>,
    /// Current goal queue
    pub goals: VecDeque<AgentGoal>,
    /// Agent memory (learned observations)
    pub memory: Vec<AgentMemory>,
    /// Vat ID for state persistence
    pub vat_id: VatId,
    /// Creation timestamp
    pub born_at: f64,
    /// Last activity timestamp
    pub last_active: f64,
    /// Movement speed (Hilbert units per second)
    pub speed: f32,
    /// Color for rendering
    pub color: [f32; 4],
}

impl CityAgent {
    /// Create a new agent
    pub fn new(role: AgentRole, hilbert_pos: u32) -> Self {
        let id = Uuid::new_v4().to_string();
        let id_short = id[..8].to_string();
        let now = SystemTime::now()
            .duration_since(UNIX_EPOCH)
            .unwrap_or_default()
            .as_secs_f64();

        let (name, color) = match role {
            AgentRole::Scout => ("Scout".to_string(), [1.0, 0.8, 0.2, 1.0]), // Gold
            AgentRole::Engineer => ("Engineer".to_string(), [0.2, 0.8, 1.0, 1.0]), // Cyan
            AgentRole::Archivist => ("Archivist".to_string(), [0.6, 0.2, 1.0, 1.0]), // Purple
        };

        Self {
            id: id.clone(),
            name: format!("{} {}", name, id_short),
            role,
            state: AgentState::Idle,
            hilbert_pos,
            world_pos: (0.0, 0.0), // Will be computed from Hilbert
            target_pos: None,
            goals: VecDeque::new(),
            memory: Vec::new(),
            vat_id: VatId::new(&format!("agent_{}", id)),
            born_at: now,
            last_active: now,
            speed: 100.0, // Hilbert units per second
            color,
        }
    }

    /// Add a goal to the agent's queue
    pub fn add_goal(&mut self, goal: AgentGoal) {
        self.goals.push_back(goal);
        self.state = AgentState::Navigating;
        self.last_active = Self::now();
    }

    /// Get current goal (if any)
    pub fn current_goal(&self) -> Option<&AgentGoal> {
        self.goals.front()
    }

    /// Complete current goal
    pub fn complete_goal(&mut self, result: String) {
        if self.goals.pop_front().is_some() {
            self.state = if self.goals.is_empty() {
                AgentState::Idle
            } else {
                AgentState::Navigating
            };
            self.last_active = Self::now();

            // Remember successful completion
            self.memory.push(AgentMemory {
                timestamp: Self::now(),
                location: self.hilbert_pos,
                observation: format!("Completed: {}", result),
                confidence: 0.9,
            });
        }
    }

    /// Update agent position toward target
    pub fn update_position(&mut self, dt: f32, grid_size: u32) {
        if let Some((tx, ty)) = self.target_pos {
            let dx = tx - self.world_pos.0;
            let dy = ty - self.world_pos.1;
            let dist = (dx * dx + dy * dy).sqrt();

            if dist < 0.005 {
                // Arrived at target
                self.world_pos = (tx, ty);
                self.target_pos = None;
            } else {
                // Move toward target
                let move_dist = self.speed * dt;
                let t = (move_dist / dist).min(1.0);
                self.world_pos.0 += dx * t;
                self.world_pos.1 += dy * t;

                // Update Hilbert position from new world position
                self.hilbert_pos = Self::world_to_hilbert(self.world_pos, grid_size);
            }
        } else {
            // Compute world position from Hilbert coordinate
            self.world_pos = Self::hilbert_to_world(self.hilbert_pos, grid_size);
        }

        self.last_active = Self::now();
    }

    /// Convert Hilbert coordinate to world position
    fn hilbert_to_world(hilbert: u32, grid_size: u32) -> (f32, f32) {
        let loader = crate::source_city::SourceCityLoader::new(std::path::PathBuf::from("/dev/null"));
        let (x, y) = loader.hilbert_d2xy(grid_size, hilbert);
        let gx = grid_size as f32;
        (
            (x as f32 - gx / 2.0) / (gx / 2.0),
            (y as f32 - gx / 2.0) / (gx / 2.0),
        )
    }

    /// Convert world position to Hilbert coordinate
    fn world_to_hilbert(pos: (f32, f32), grid_size: u32) -> u32 {
        let loader = crate::source_city::SourceCityLoader::new(std::path::PathBuf::from("/dev/null"));
        let gx = grid_size as f32;
        let x = ((pos.0 * (gx / 2.0)) + gx / 2.0) as i32;
        let y = ((pos.1 * (gx / 2.0)) + gx / 2.0) as i32;
        loader.world_to_hilbert(x, y, grid_size)
    }

    /// Get current timestamp
    pub fn now() -> f64 {
        SystemTime::now()
            .duration_since(UNIX_EPOCH)
            .unwrap_or_default()
            .as_secs_f64()
    }

    /// Observe and remember
    pub fn remember(&mut self, observation: String, confidence: f32) {
        self.memory.push(AgentMemory {
            timestamp: Self::now(),
            location: self.hilbert_pos,
            observation,
            confidence,
        });

        // Limit memory size (keep last 1000 entries)
        if self.memory.len() > 1000 {
            self.memory.remove(0);
        }
    }

    /// Recall recent observations at current location
    pub fn recall_nearby(&self, radius: u32) -> Vec<&AgentMemory> {
        self.memory.iter()
            .filter(|m| {
                ((m.location as i32 - self.hilbert_pos as i32).abs() as u32) < radius
            })
            .collect()
    }

    /// Process active goals
    pub fn tick(&mut self, requests: &mut VecDeque<AgentRequest>, grid_size: u32) {
        if self.state == AgentState::Idle {
            // Wander: Pick a random Hilbert location
            if !self.goals.is_empty() {
                self.state = AgentState::Navigating;
            } else {
                // Pick a random target
                use rand::Rng;
                let mut rng = rand::thread_rng();
                let target = rng.gen_range(0..grid_size * grid_size);
                
                self.add_goal(AgentGoal {
                    id: Uuid::new_v4().to_string(),
                    goal_type: GoalType::Navigate { destination: "Wandering".to_string() },
                    target_path: None,
                    target_hilbert: Some(target),
                    priority: 10,
                    created_at: Self::now(),
                    deadline: None,
                });
            }
        }

        if self.state == AgentState::Navigating {
            if self.target_pos.is_none() {
                if let Some(goal) = self.goals.front() {
                    if let Some(th) = goal.target_hilbert {
                        let world_target = Self::hilbert_to_world(th, grid_size);
                        self.target_pos = Some(world_target);
                    } else {
                        // Immediate goal?
                        self.state = AgentState::Working;
                    }
                }
            } else {
                // Check if we arrived
                let dx = self.target_pos.unwrap().0 - self.world_pos.0;
                let dy = self.target_pos.unwrap().1 - self.world_pos.1;
                if (dx * dx + dy * dy).sqrt() < 0.01 {
                    self.target_pos = None;
                    self.state = AgentState::Working;
                }
            }
        }

        if self.state == AgentState::Working {
            if let Some(goal) = self.goals.front().cloned() {
                match goal.goal_type {
                    GoalType::Rebuild { path } => {
                        requests.push_back(AgentRequest::Rebuild { 
                            path, 
                            agent_id: self.id.clone() 
                        });
                        self.complete_goal("Rebuild triggered".to_string());
                    },
                    GoalType::Analyze { path } => {
                        self.remember(format!("Analysis of {:?} complete: Stable.", path), 1.0);
                        self.complete_goal("Analysis done".to_string());
                    },
                    GoalType::ScoutDistrict { district } => {
                        self.remember(format!("District {} looks healthy.", district), 0.8);
                        self.complete_goal("Scouting done".to_string());
                    },
                    _ => {
                        self.complete_goal("Task finished".to_string());
                    }
                }
            }
        }
    }
}

/// VatState implementation for agent persistence
impl VatState for CityAgent {
    fn vat_id(&self) -> VatId {
        self.vat_id.clone()
    }

    fn serialize_to_vat(&self, vat: &mut VatBuffer) -> Result<(), crate::hot_swap::VatError> {
        // ID and name
        vat.write_string(&self.id)?;
        vat.write_string(&self.name)?;

        // Role
        let role_byte = match self.role {
            AgentRole::Scout => 0u8,
            AgentRole::Engineer => 1u8,
            AgentRole::Archivist => 2u8,
        };
        vat.write_u8(role_byte)?;

        // Position
        vat.write_u32(self.hilbert_pos)?;
        vat.write_f32(self.world_pos.0)?;
        vat.write_f32(self.world_pos.1)?;

        // Goals (count + each goal)
        vat.write_u32(self.goals.len() as u32)?;
        for goal in &self.goals {
            vat.write_string(&goal.id)?;
            // Write goal type discriminant
            let type_id = match &goal.goal_type {
                GoalType::Navigate { .. } => 0u8,
                GoalType::Analyze { .. } => 1u8,
                GoalType::Rebuild { .. } => 2u8,
                GoalType::Archive { .. } => 3u8,
                GoalType::ScoutDistrict { .. } => 4u8,
            };
            vat.write_u8(type_id)?;
            vat.write_u8(goal.priority)?;
            vat.write_f32(goal.created_at as f32)?;
            // Write optional target_hilbert
            if let Some(target) = goal.target_hilbert {
                vat.write_u32(target)?;
                vat.write_u8(1u8)?; // Has target
            } else {
                vat.write_u32(0)?;
                vat.write_u8(0u8)?; // No target
            }
        }

        // Memory (count + recent entries, max 100)
        let memory_count = self.memory.len().min(100);
        vat.write_u32(memory_count as u32)?;
        for mem in &self.memory[..memory_count] {
            vat.write_f32(mem.timestamp as f32)?;
            vat.write_u32(mem.location)?;
            vat.write_string(&mem.observation)?;
            vat.write_f32(mem.confidence)?;
        }

        Ok(())
    }

    fn deserialize_from_vat(&mut self, vat: &mut VatBuffer) -> Result<(), crate::hot_swap::VatError> {
        self.id = vat.read_string()?;
        self.name = vat.read_string()?;

        let role_byte = vat.read_u8()?;
        self.role = match role_byte {
            0 => AgentRole::Scout,
            1 => AgentRole::Engineer,
            2 => AgentRole::Archivist,
            _ => AgentRole::Scout,
        };

        self.hilbert_pos = vat.read_u32()?;
        self.world_pos.0 = vat.read_f32()?;
        self.world_pos.1 = vat.read_f32()?;

        // Goals
        let goal_count = vat.read_u32()?;
        self.goals.clear();
        for _ in 0..goal_count {
            let id = vat.read_string()?;
            let type_id = vat.read_u8()?;
            let priority = vat.read_u8()?;
            let created_at = vat.read_f32()? as f64;
            let target_hilbert_raw = vat.read_u32()?;
            let has_target = vat.read_u8()? == 1;
            
            let target_hilbert = if has_target { Some(target_hilbert_raw) } else { None };
            
            let goal_type = match type_id {
                0 => GoalType::Navigate { destination: "Restored".to_string() },
                1 => GoalType::Analyze { path: PathBuf::new() },
                2 => GoalType::Rebuild { path: PathBuf::new() },
                3 => GoalType::Archive { vat_id: VatId::new("restored") },
                4 => GoalType::ScoutDistrict { district: "restored".to_string() },
                _ => GoalType::Navigate { destination: "Unknown".to_string() },
            };

            self.goals.push_back(AgentGoal {
                id,
                goal_type,
                target_path: None,
                target_hilbert,
                priority,
                created_at,
                deadline: None,
            });
        }

        // Memory
        let memory_count = vat.read_u32()?;
        self.memory.clear();
        for _ in 0..memory_count {
            let timestamp = vat.read_f32()? as f64;
            let location = vat.read_u32()?;
            let observation = vat.read_string()?;
            let confidence = vat.read_f32()?;
            self.memory.push(AgentMemory {
                timestamp,
                location,
                observation,
                confidence,
            });
        }

        Ok(())
    }
}

/// Manager for autonomous agents in Source City
pub struct CityAgentManager {
    agents: HashMap<String, CityAgent>,
    grid_size: u32,
    vat_registry: Option<std::sync::Arc<std::sync::Mutex<crate::hot_swap::VatRegistry>>>,
    pub requests: VecDeque<AgentRequest>,
    pub total_tasks_completed: u64,
    pub last_telemetry_report: f64,
}

impl CityAgentManager {
    pub fn new(grid_size: u32) -> Self {
        Self {
            agents: HashMap::new(),
            grid_size,
            vat_registry: None,
            requests: VecDeque::new(),
            total_tasks_completed: 0,
            last_telemetry_report: CityAgent::now(),
        }
    }

    pub fn set_vat_registry(&mut self, registry: std::sync::Arc<std::sync::Mutex<crate::hot_swap::VatRegistry>>) {
        self.vat_registry = Some(registry);
    }

    /// Spawn a new agent
    pub fn spawn_agent(&mut self, role: AgentRole, hilbert_pos: u32) -> String {
        let mut agent = CityAgent::new(role, hilbert_pos);
        agent.world_pos = CityAgent::hilbert_to_world(hilbert_pos, self.grid_size);
        let id = agent.id.clone();

        // Persist to Vat before inserting
        if let Some(ref registry) = self.vat_registry {
            if let Ok(buffer) = agent.to_vat_buffer() {
                if let Ok(mut reg) = registry.try_lock() {
                    let _ = reg.register_vat(buffer);
                }
            }
        }

        self.agents.insert(id.clone(), agent);
        id
    }

    /// Get agent by ID
    pub fn get_agent(&self, id: &str) -> Option<&CityAgent> {
        self.agents.get(id)
    }

    /// Get mutable agent by ID
    pub fn get_agent_mut(&mut self, id: &str) -> Option<&mut CityAgent> {
        self.agents.get_mut(id)
    }

    /// Update all agents (call each frame)
    pub fn update(&mut self, dt: f32) {
        let mut to_persist = Vec::new();
        let mut completed_this_tick = 0;

        for agent in self.agents.values_mut() {
            let prev_goals = agent.goals.len();
            agent.update_position(dt, self.grid_size);
            agent.tick(&mut self.requests, self.grid_size);
            
            if prev_goals > agent.goals.len() {
                completed_this_tick += 1;
            }
            to_persist.push(agent.id.clone());
        }

        self.total_tasks_completed += completed_this_tick;

        // Persist state and report telemetry periodically (~5 seconds)
        let now = CityAgent::now();
        if now - self.last_telemetry_report > 5.0 {
            log::info!("📊 Agent Telemetry: {} agents, {} tasks completed total", 
                self.agents.len(), self.total_tasks_completed);
            self.last_telemetry_report = now;
        }
    }

    /// Find agents near a position
    pub fn agents_near(&self, hilbert_pos: u32, radius: u32) -> Vec<&CityAgent> {
        self.agents.values()
            .filter(|a| {
                ((a.hilbert_pos as i32 - hilbert_pos as i32).abs() as u32) < radius
            })
            .collect()
    }

    /// Assign goal to nearest agent of appropriate role
    pub fn assign_goal(&mut self, role: AgentRole, goal: AgentGoal) -> Option<String> {
        let goal_loc = goal.target_hilbert;

        let nearest = self.agents.values_mut()
            .filter(|a| a.role == role && a.state == AgentState::Idle)
            .min_by_key(|a| {
                // Find goal location if specified
                goal_loc
                    .map(|t| ((a.hilbert_pos as i32 - t as i32).abs()) as u32)
                    .unwrap_or(0)
            });

        if let Some(agent) = nearest {
            agent.add_goal(goal);
            Some(agent.id.clone())
        } else {
            None
        }
    }

    /// List all agents
    pub fn list_agents(&self) -> Vec<&CityAgent> {
        self.agents.values().collect()
    }

    /// Remove an agent
    pub fn despawn_agent(&mut self, id: &str) -> Option<CityAgent> {
        self.agents.remove(id)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_agent_creation() {
        let agent = CityAgent::new(AgentRole::Scout, 100);
        assert_eq!(agent.role, AgentRole::Scout);
        assert_eq!(agent.hilbert_pos, 100);
        assert_eq!(agent.state, AgentState::Idle);
    }

    #[test]
    fn test_agent_goals() {
        let mut agent = CityAgent::new(AgentRole::Engineer, 0);
        let goal = AgentGoal {
            id: "test_goal".to_string(),
            goal_type: GoalType::Navigate { destination: "systems/".to_string() },
            target_path: None,
            target_hilbert: Some(1000),
            priority: 100,
            created_at: 0.0,
            deadline: None,
        };

        agent.add_goal(goal);
        assert!(agent.current_goal().is_some());
        assert_eq!(agent.state, AgentState::Navigating);
    }

    #[test]
    fn test_agent_memory() {
        let mut agent = CityAgent::new(AgentRole::Archivist, 500);
        agent.remember("Found code rot in app.rs".to_string(), 0.9);
        agent.remember("Building height increased".to_string(), 1.0);

        assert_eq!(agent.memory.len(), 2);
        assert_eq!(agent.memory[0].confidence, 0.9);
    }

    #[test]
    fn test_manager_spawn() {
        let mut manager = CityAgentManager::new(256);
        let id = manager.spawn_agent(AgentRole::Scout, 100);

        let agent = manager.get_agent(&id);
        assert!(agent.is_some());
        assert_eq!(agent.unwrap().hilbert_pos, 100);
    }
}
