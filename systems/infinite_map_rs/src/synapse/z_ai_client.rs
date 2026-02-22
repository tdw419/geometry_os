//! Phase 46: Z.ai Integration for Cognitive Daemon
//!
//! This module provides a native Rust client for the Z.ai (Zhipu AI) API,
//! following the Anthropic-compatible protocol used in `zai_bridge.py`.

use serde::{Deserialize, Serialize};
use crate::cognitive::agents::{AgentRole, AgentGoal};
use anyhow::Result;

#[derive(Clone, Debug)]
pub struct ZAiClient {
    api_key: String,
    model: String,
    endpoint: String,
    client: reqwest::Client,
}

#[derive(Serialize)]
struct ChatRequest {
    model: String,
    messages: Vec<Message>,
    max_tokens: u32,
    temperature: f32,
    system: Option<String>,
}

#[derive(Serialize, Deserialize, Clone)]
struct Message {
    role: String,
    content: String,
}

#[derive(Deserialize)]
struct ChatResponse {
    content: Vec<ResponseContent>,
}

#[derive(Deserialize)]
struct ResponseContent {
    text: String,
}

impl ZAiClient {
    pub fn new(api_key: String) -> Self {
        Self {
            api_key,
            model: "GLM-4.7".to_string(), // Default model
            endpoint: "https://api.z.ai/api/anthropic/v1/messages".to_string(),
            client: reqwest::Client::new(),
        }
    }

    /// Generate a thought or code modification for an agent
    pub async fn ask_agent(
        &self, 
        role: AgentRole, 
        context: &str, 
        goal: &str
    ) -> Result<String> {
        let system_prompt = match role {
            AgentRole::Scout => "You are a Code Scout. Analyze the given code for errors, rot, and complexity. Return a brief health report.",
            AgentRole::Engineer => "You are a Software Engineer. Given the code and a goal, return the REFACTORED code only.",
            AgentRole::Archivist => "You are a System Archivist. Summarize the changes and state.",
        };

        let request = ChatRequest {
            model: self.model.clone(),
            messages: vec![
                Message {
                    role: "user".to_string(),
                    content: format!("Context:\n{}\n\nGoal: {}", context, goal),
                }
            ],
            max_tokens: 4096,
            temperature: 0.3, // Lower temp for code tasks
            system: Some(system_prompt.to_string()),
        };

        let response = self.client.post(&self.endpoint)
            .header("x-api-key", &self.api_key)
            .header("anthropic-version", "2023-06-01")
            .header("content-type", "application/json")
            .json(&request)
            .send()
            .await?;

        if !response.status().is_success() {
            let error_text = response.text().await?;
            return Err(anyhow::anyhow!("Z.ai API Error: {}", error_text));
        }

        let chat_response: ChatResponse = response.json().await?;
        
        if let Some(content) = chat_response.content.first() {
            Ok(content.text.clone())
        } else {
            Err(anyhow::anyhow!("Empty response from Z.ai"))
        }
    }
    
    /// Analyze code health (Visual AST enrichment)
    pub async fn analyze_syntax_health(&self, code: &str) -> Result<(f32, Vec<String>)> {
        let prompt = "Analyze this Rust code for 'health'. Return a JSON: {\"score\": 0.0-1.0, \"issues\": [\"list\"]}.";
        
        // ... Implementation would parse JSON response
        // For now, return stub
        Ok((0.9, vec!["Looks good".to_string()])) 
    }
}
