/// Intent - Natural language user input representation
/// 
/// Captures user intent for semantic navigation and manipulation

use serde::{Serialize, Deserialize};
use std::time::SystemTime;

/// User intent captured from natural language
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Intent {
    /// The raw text input from the user
    pub text: String,
    
    /// Timestamp when the intent was created
    pub timestamp: SystemTime,
    
    /// Confidence score (0.0-1.0) - set by LLM
    pub confidence: f32,
    
    /// Parsed intent type (if classified)
    pub intent_type: Option<IntentType>,
}

/// Classification of user intent
#[derive(Debug, Clone, Serialize, Deserialize)]
pub enum IntentType {
    /// Navigate to a location
    Navigation,
    
    /// Modify visual aesthetics
    Aesthetic,
    
    /// Create new content
    Creation,
    
    /// Query information
    Query,
    
    /// System control
    Control,
}

impl Intent {
    /// Create a new intent from user text
    pub fn new(text: String) -> Self {
        Self {
            text,
            timestamp: SystemTime::now(),
            confidence: 0.0,
            intent_type: None,
        }
    }
    
    /// Set the confidence score
    pub fn with_confidence(mut self, confidence: f32) -> Self {
        self.confidence = confidence;
        self
    }
    
    /// Set the intent type
    pub fn with_type(mut self, intent_type: IntentType) -> Self {
        self.intent_type = Some(intent_type);
        self
    }
}

/// Intent Overlay - Visual UI for capturing user input
#[derive(Debug, Clone)]
pub struct IntentOverlay {
    /// Current text being typed
    pub text: String,
    
    /// Whether the overlay is visible
    pub visible: bool,
    
    /// Whether the LLM is currently thinking
    pub is_thinking: bool,
    
    /// Cursor position in the text
    pub cursor_pos: usize,
    
    /// Suggested completions (from LLM)
    pub suggestions: Vec<String>,
}

impl IntentOverlay {
    /// Create a new intent overlay
    pub fn new() -> Self {
        Self {
            text: String::new(),
            visible: false,
            is_thinking: false,
            cursor_pos: 0,
            suggestions: Vec::new(),
        }
    }
    
    /// Set the text content
    pub fn set_text(&mut self, text: String) {
        self.text = text;
        self.cursor_pos = self.text.len();
    }
    
    /// Show the overlay
    pub fn show(&mut self) {
        self.visible = true;
    }
    
    /// Hide the overlay
    pub fn hide(&mut self) {
        self.visible = false;
        self.text.clear();
        self.cursor_pos = 0;
        self.suggestions.clear();
    }
    
    /// Add a character at the cursor position
    pub fn insert_char(&mut self, c: char) {
        self.text.insert(self.cursor_pos, c);
        self.cursor_pos += 1;
    }
    
    /// Delete the character before the cursor
    pub fn backspace(&mut self) {
        if self.cursor_pos > 0 {
            self.text.remove(self.cursor_pos - 1);
            self.cursor_pos -= 1;
        }
    }
    
    /// Move cursor left
    pub fn cursor_left(&mut self) {
        if self.cursor_pos > 0 {
            self.cursor_pos -= 1;
        }
    }
    
    /// Move cursor right
    pub fn cursor_right(&mut self) {
        if self.cursor_pos < self.text.len() {
            self.cursor_pos += 1;
        }
    }
    
    /// Get the current text as an Intent
    pub fn to_intent(&self) -> Intent {
        Intent::new(self.text.clone())
    }
}
