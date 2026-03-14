/// Synaptic Daemon Bridge - Communication with the Python Synaptic Daemon
/// 
/// Handles HTTP communication with the FastAPI daemon for intent interpretation

use serde::{Serialize, Deserialize};
use super::intent::Intent;
use super::morphology::MorphologyCommand;

/// Bridge to the Synaptic Daemon (FastAPI server)
pub struct SynapticDaemonBridge {
    /// Daemon API URL
    daemon_url: String,
    
    /// HTTP client
    client: reqwest::Client,
}

/// Request format for the daemon
#[derive(Debug, Serialize)]
struct DaemonRequest {
    text: String,
}

/// Response format from the daemon
#[derive(Debug, Deserialize)]
struct DaemonResponse {
    status: String,
    intent: String,
    commands: Vec<serde_json::Value>,
    confidence: f32,
    reasoning: Option<String>,
    fallback_used: bool,
}

impl SynapticDaemonBridge {
    /// Create a new daemon bridge
    pub fn new(daemon_url: String) -> Self {
        Self {
            daemon_url,
            client: reqwest::Client::new(),
        }
    }
    
    /// Interpret a user intent into morphology commands
    pub async fn interpret_intent(&self, intent: &Intent) -> Result<Vec<MorphologyCommand>, String> {
        log::info!("🧠 Synaptic Daemon: Interpreting intent: {}", intent.text);
        
        // Build request
        let request = DaemonRequest {
            text: intent.text.clone(),
        };
        
        // Send to daemon
        let response = self.client
            .post(&format!("{}/intent", self.daemon_url))
            .json(&request)
            .send()
            .await
            .map_err(|e| format!("Failed to connect to synaptic daemon: {}", e))?;
        
        if !response.status().is_success() {
            return Err(format!("Synaptic daemon returned error: {}", response.status()));
        }
        
        let daemon_response: DaemonResponse = response
            .json()
            .await
            .map_err(|e| format!("Failed to parse daemon response: {}", e))?;
        
        log::info!("🧠 Daemon response: status={}, confidence={}, fallback={}", 
                   daemon_response.status, daemon_response.confidence, daemon_response.fallback_used);
        
        if let Some(reasoning) = &daemon_response.reasoning {
            log::info!("🧠 Reasoning: {}", reasoning);
        }
        
        // Parse commands from JSON
        let commands = self.parse_commands(&daemon_response.commands)?;
        
        Ok(commands)
    }
    
    /// Parse JSON commands into MorphologyCommand enum
    fn parse_commands(&self, commands: &[serde_json::Value]) -> Result<Vec<MorphologyCommand>, String> {
        let mut result = Vec::new();
        
        for cmd in commands {
            let cmd_type = cmd.get("type")
                .and_then(|v| v.as_str())
                .ok_or("Command missing 'type' field")?;
            
            let params = cmd.get("params")
                .ok_or("Command missing 'params' field")?;
            
            let morphology_cmd = match cmd_type {
                "Navigate" => {
                    let x = params.get("x")
                        .and_then(|v| v.as_f64())
                        .ok_or("Navigate missing 'x'")? as f32;
                    let y = params.get("y")
                        .and_then(|v| v.as_f64())
                        .ok_or("Navigate missing 'y'")? as f32;
                    let z = params.get("z")
                        .and_then(|v| v.as_f64())
                        .ok_or("Navigate missing 'z'")? as f32;
                    let duration = params.get("duration")
                        .and_then(|v| v.as_f64())
                        .unwrap_or(1.0) as f32;
                    
                    MorphologyCommand::Navigate { x, y, z, duration }
                }
                "AdjustAesthetics" => {
                    let chaos = params.get("chaos")
                        .and_then(|v| v.as_f64())
                        .map(|v| v as f32);
                    let temperature = params.get("temperature")
                        .and_then(|v| v.as_f64())
                        .map(|v| v as f32);
                    let saturation = params.get("saturation")
                        .and_then(|v| v.as_f64())
                        .map(|v| v as f32);
                    
                    MorphologyCommand::AdjustAesthetics { chaos, temperature, saturation }
                }
                "CreateBrick" => {
                    let x = params.get("x")
                        .and_then(|v| v.as_f64())
                        .ok_or("CreateBrick missing 'x'")? as f32;
                    let y = params.get("y")
                        .and_then(|v| v.as_f64())
                        .ok_or("CreateBrick missing 'y'")? as f32;
                    let z = params.get("z")
                        .and_then(|v| v.as_f64())
                        .ok_or("CreateBrick missing 'z'")? as f32;
                    let description = params.get("description")
                        .and_then(|v| v.as_str())
                        .unwrap_or("")
                        .to_string();
                    
                    MorphologyCommand::CreateBrick { x, y, z, description }
                }
                "Highlight" => {
                    let center = params.get("center")
                        .and_then(|v| v.as_array())
                        .ok_or("Highlight missing 'center'")?;
                    let center_tuple = (
                        center.get(0).and_then(|v| v.as_f64()).unwrap_or(0.0) as f32,
                        center.get(1).and_then(|v| v.as_f64()).unwrap_or(0.0) as f32,
                        center.get(2).and_then(|v| v.as_f64()).unwrap_or(0.0) as f32,
                    );
                    let radius = params.get("radius")
                        .and_then(|v| v.as_f64())
                        .ok_or("Highlight missing 'radius'")? as f32;
                    let color = params.get("color")
                        .and_then(|v| v.as_array())
                        .ok_or("Highlight missing 'color'")?;
                    let color_array = [
                        color.get(0).and_then(|v| v.as_f64()).unwrap_or(1.0) as f32,
                        color.get(1).and_then(|v| v.as_f64()).unwrap_or(1.0) as f32,
                        color.get(2).and_then(|v| v.as_f64()).unwrap_or(1.0) as f32,
                        color.get(3).and_then(|v| v.as_f64()).unwrap_or(1.0) as f32,
                    ];
                    let duration = params.get("duration")
                        .and_then(|v| v.as_f64())
                        .map(|v| v as f32);
                    
                    MorphologyCommand::Highlight { center: center_tuple, radius, color: color_array, duration }
                }
                "CameraControl" => {
                    let fov = params.get("fov")
                        .and_then(|v| v.as_f64())
                        .map(|v| v as f32);
                    let target = params.get("target")
                        .and_then(|v| v.as_array())
                        .map(|arr| (
                            arr.get(0).and_then(|v| v.as_f64()).unwrap_or(0.0) as f32,
                            arr.get(1).and_then(|v| v.as_f64()).unwrap_or(0.0) as f32,
                            arr.get(2).and_then(|v| v.as_f64()).unwrap_or(0.0) as f32,
                        ));
                    let distance = params.get("distance")
                        .and_then(|v| v.as_f64())
                        .map(|v| v as f32);
                    
                    MorphologyCommand::CameraControl { fov, target, distance }
                }
                "SpawnEffect" => {
                    let effect_str = params.get("effect")
                        .and_then(|v| v.as_str())
                        .ok_or("SpawnEffect missing 'effect'")?;
                    let effect = match effect_str {
                        "Particles" => super::morphology::EffectType::Particles,
                        "Ripple" => super::morphology::EffectType::Ripple,
                        "Glow" => super::morphology::EffectType::Glow,
                        "Fractal" => super::morphology::EffectType::Fractal,
                        _ => return Err(format!("Unknown effect type: {}", effect_str)),
                    };
                    let position = params.get("position")
                        .and_then(|v| v.as_array())
                        .ok_or("SpawnEffect missing 'position'")?;
                    let position_tuple = (
                        position.get(0).and_then(|v| v.as_f64()).unwrap_or(0.0) as f32,
                        position.get(1).and_then(|v| v.as_f64()).unwrap_or(0.0) as f32,
                        position.get(2).and_then(|v| v.as_f64()).unwrap_or(0.0) as f32,
                    );
                    let scale = params.get("scale")
                        .and_then(|v| v.as_f64())
                        .ok_or("SpawnEffect missing 'scale'")? as f32;
                    
                    MorphologyCommand::SpawnEffect { effect, position: position_tuple, scale }
                }
                "Query" => {
                    let query_str = params.get("query_type")
                        .and_then(|v| v.as_str())
                        .ok_or("Query missing 'query_type'")?;
                    let query_type = match query_str {
                        "MemoryUsage" => super::morphology::QueryType::MemoryUsage,
                        "BrickInfo" => super::morphology::QueryType::BrickInfo,
                        "NeuralState" => super::morphology::QueryType::NeuralState,
                        "Performance" => super::morphology::QueryType::Performance,
                        _ => return Err(format!("Unknown query type: {}", query_str)),
                    };
                    let target = params.get("target")
                        .and_then(|v| v.as_array())
                        .map(|arr| (
                            arr.get(0).and_then(|v| v.as_f64()).unwrap_or(0.0) as f32,
                            arr.get(1).and_then(|v| v.as_f64()).unwrap_or(0.0) as f32,
                            arr.get(2).and_then(|v| v.as_f64()).unwrap_or(0.0) as f32,
                        ));
                    
                    MorphologyCommand::Query { query_type, target }
                }
                _ => {
                    log::warn!("Unknown command type: {}", cmd_type);
                    continue;
                }
            };
            
            result.push(morphology_cmd);
        }
        
        Ok(result)
    }
    
    /// Test connection to the daemon
    pub async fn test_connection(&self) -> Result<(), String> {
        log::info!("🧠 Testing connection to synaptic daemon at {}", self.daemon_url);
        
        let response = self.client
            .get(&self.daemon_url)
            .send()
            .await
            .map_err(|e| format!("Connection failed: {}", e))?;
        
        if response.status().is_success() {
            log::info!("✅ Synaptic daemon connection successful");
            Ok(())
        } else {
            Err(format!("Synaptic daemon returned error: {}", response.status()))
        }
    }
}
