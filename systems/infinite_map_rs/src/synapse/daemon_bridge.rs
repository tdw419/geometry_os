/// Daemon Bridge - Communication with the Cognitive Daemon (LLM)
/// 
/// Handles HTTP communication with LM Studio for intent interpretation

use serde::{Serialize, Deserialize};
use super::intent::Intent;
use super::morphology::MorphologyCommand;
use super::MemoryAnalysisRequest;

/// Bridge to the Cognitive Daemon (LM Studio)
/// Bridge to the Cognitive Daemon (LM Studio)
#[derive(Clone)]
pub struct CognitiveDaemonBridge {
    /// LM Studio API URL
    api_url: String,
    
    /// HTTP client
    client: reqwest::Client,
    
    /// System prompt for the LLM
    system_prompt: String,
}

/// Request format for LM Studio
#[derive(Debug, Serialize)]
struct LMStudioRequest {
    model: String,
    messages: Vec<Message>,
    temperature: f32,
    max_tokens: i32,
}

/// Message format
#[derive(Debug, Serialize, Deserialize)]
struct Message {
    role: String,
    content: String,
}

/// Response format from LM Studio
#[derive(Debug, Deserialize)]
struct LMStudioResponse {
    choices: Vec<Choice>,
}

#[derive(Debug, Deserialize)]
struct Choice {
    message: Message,
}

impl CognitiveDaemonBridge {
    /// Create a new daemon bridge
    pub fn new(api_url: String) -> Self {
        let system_prompt = r#"You are the Cognitive Daemon for Geometry OS, a visual computing substrate.

Your role is to interpret natural language user intent and translate it into geometric morphology commands.

Available command types:
- Navigate: Move camera to coordinates
- AdjustAesthetics: Modify visual parameters (chaos, temperature, saturation)
- CreateBrick: Generate new visual content
- Highlight: Draw attention to regions
- CameraControl: Adjust camera parameters
- SpawnEffect: Create visual effects
- Query: Retrieve information

Respond ONLY with valid JSON in this format:
{
  "commands": [
    {
      "type": "Navigate",
      "params": {"x": 0.0, "y": 0.0, "z": 0.0, "duration": 1.0}
    }
  ],
  "confidence": 0.85,
  "reasoning": "Brief explanation"
}

Be precise, creative, and maintain geometric integrity."#;

        Self {
            api_url,
            client: reqwest::Client::new(),
            system_prompt: system_prompt.to_string(),
        }
    }
    
    /// Interpret a user intent into morphology commands
    pub async fn interpret_intent(&self, intent: &Intent) -> Result<Vec<MorphologyCommand>, String> {
        log::info!("🧠 Daemon: Interpreting intent: {}", intent.text);
        
        // Build request
        let request = LMStudioRequest {
            model: "local-model".to_string(), // LM Studio uses this
            messages: vec![
                Message {
                    role: "system".to_string(),
                    content: self.system_prompt.clone(),
                },
                Message {
                    role: "user".to_string(),
                    content: intent.text.clone(),
                },
            ],
            temperature: 0.7,
            max_tokens: 500,
        };
        
        // Send to LM Studio
        let response = self.client
            .post(&format!("{}/v1/chat/completions", self.api_url))
            .json(&request)
            .send()
            .await
            .map_err(|e| format!("Failed to connect to LM Studio: {}", e))?;
        
        if !response.status().is_success() {
            return Err(format!("LM Studio returned error: {}", response.status()));
        }
        
        let lm_response: LMStudioResponse = response
            .json()
            .await
            .map_err(|e| format!("Failed to parse LM Studio response: {}", e))?;
        
        // Extract response text
        let response_text = lm_response
            .choices
            .first()
            .ok_or("No response from LM Studio")?
            .message
            .content
            .clone();
        
        log::info!("🧠 Daemon response: {}", response_text);
        
        // Parse JSON response
        let parsed = self.parse_daemon_response(&response_text)?;
        
        Ok(parsed)
    }
    
    /// Parse the daemon's JSON response into commands
    fn parse_daemon_response(&self, response: &str) -> Result<Vec<MorphologyCommand>, String> {
        // Try to extract JSON from markdown code blocks if present
        let json_str = if response.contains("```json") {
            response
                .split("```json")
                .nth(1)
                .and_then(|s| s.split("```").next())
                .unwrap_or(response)
                .trim()
        } else if response.contains("```") {
            response
                .split("```")
                .nth(1)
                .unwrap_or(response)
                .trim()
        } else {
            response.trim()
        };
        
        // Parse JSON
        let value: serde_json::Value = serde_json::from_str(json_str)
            .map_err(|e| format!("Failed to parse JSON: {}", e))?;
        
        let commands_array = value["commands"]
            .as_array()
            .ok_or("No 'commands' array in response")?;
        
        let mut commands = Vec::new();
        
        for cmd in commands_array {
            let cmd_type = cmd["type"]
                .as_str()
                .ok_or("Command missing 'type' field")?;
            
            let params = &cmd["params"];
            
            let morphology_cmd = match cmd_type {
                "Navigate" => MorphologyCommand::Navigate {
                    x: params["x"].as_f64().unwrap_or(0.0) as f32,
                    y: params["y"].as_f64().unwrap_or(0.0) as f32,
                    z: params["z"].as_f64().unwrap_or(0.0) as f32,
                    duration: params["duration"].as_f64().unwrap_or(1.0) as f32,
                },
                "AdjustAesthetics" => MorphologyCommand::AdjustAesthetics {
                    chaos: params["chaos"].as_f64().map(|v| v as f32),
                    temperature: params["temperature"].as_f64().map(|v| v as f32),
                    saturation: params["saturation"].as_f64().map(|v| v as f32),
                },
                "CreateBrick" => MorphologyCommand::CreateBrick {
                    x: params["x"].as_f64().unwrap_or(0.0) as f32,
                    y: params["y"].as_f64().unwrap_or(0.0) as f32,
                    z: params["z"].as_f64().unwrap_or(0.0) as f32,
                    description: params["description"]
                        .as_str()
                        .unwrap_or("")
                        .to_string(),
                },
                _ => {
                    log::warn!("Unknown command type: {}", cmd_type);
                    continue;
                }
            };
            
            commands.push(morphology_cmd);
        }
        
        Ok(commands)
    }
    
    /// Test connection to LM Studio
    pub async fn test_connection(&self) -> Result<(), String> {
        log::info!("🧠 Testing connection to LM Studio at {}", self.api_url);
        
        let response = self.client
            .get(&format!("{}/v1/models", self.api_url))
            .send()
            .await
            .map_err(|e| format!("Connection failed: {}", e))?;
        
        if response.status().is_success() {
            log::info!("✅ LM Studio connection successful");
            Ok(())
        } else {
            Err(format!("LM Studio returned error: {}", response.status()))
        }
    }

    /// Analyze a memory region using the LLM
    pub async fn analyze_memory(&self, request: &MemoryAnalysisRequest) -> Result<String, String> {
        log::info!("🧠 Daemon: Analyzing memory at 0x{:x}", request.address);

        let prompt = format!(
            r#"Analyze this raw memory dump from a running QEMU VM.
Target Address: 0x{:x}
Length: {} bytes
Heuristics:
- Entropy: {:.2} (Scale 0-8)
- Likely Type: {:?}
- Magic Signature: {:?}
- Strings Found: {:?}

Hex Dump:
{}

Identify the purpose of this memory. Is it code, a data structure, text, or an image? 
If it is code, what architecture might it be (likely x86_64 or RISC-V)?
If it is data, what kind?
Provide a concise, technical explanation."#,
            request.address,
            request.length,
            request.heuristics.entropy,
            request.heuristics.likely_type,
            request.heuristics.magic_signature,
            request.heuristics.strings,
            request.hex_dump
        );

        let request = LMStudioRequest {
            model: "local-model".to_string(),
            messages: vec![
                Message {
                    role: "system".to_string(),
                    content: "You are an expert Reverse Engineer and Memory Analyst.".to_string(),
                },
                Message {
                    role: "user".to_string(),
                    content: prompt,
                },
            ],
            temperature: 0.1, // Low temp for analytical precision
            max_tokens: 300,
        };

        let response = self.client
            .post(&format!("{}/v1/chat/completions", self.api_url))
            .json(&request)
            .send()
            .await
            .map_err(|e| format!("Failed to connect to LM Studio: {}", e))?;

        if !response.status().is_success() {
            return Err(format!("LM Studio returned error: {}", response.status()));
        }

        let lm_response: LMStudioResponse = response
            .json()
            .await
            .map_err(|e| format!("Failed to parse LM Studio response: {}", e))?;

        let analysis = lm_response
            .choices
            .first()
            .ok_or("No response from LM Studio")?
            .message
            .content
            .clone();

        Ok(analysis)
    }
}
