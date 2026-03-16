//! Simple byte-level tokenizer for PixelBrain inference
//!
//! Uses ASCII characters as vocabulary (vocab_size = 256).

use std::collections::HashMap;

/// Byte-level tokenizer (vocab size = 256)
pub struct ByteTokenizer {
    /// Vocabulary: token_id -> string
    vocab: Vec<String>,
    /// Inverse vocabulary: string -> token_id
    vocab_inv: HashMap<String, u32>,
}

impl ByteTokenizer {
    /// Create a new byte tokenizer
    pub fn new() -> Self {
        let vocab: Vec<String> = (0u8..=255u8)
            .map(|b| {
                if b >= 32 && b < 127 {
                    (b as char).to_string()
                } else {
                    format!("<0x{:02X}>", b)
                }
            })
            .collect();

        let vocab_inv: HashMap<String, u32> = vocab
            .iter()
            .enumerate()
            .map(|(i, s)| (s.clone(), i as u32))
            .collect();

        Self { vocab, vocab_inv }
    }

    /// Get vocabulary size
    pub fn vocab_size(&self) -> usize {
        self.vocab.len()
    }

    /// Encode text to token IDs
    pub fn encode(&self, text: &str) -> Vec<u32> {
        text.bytes().map(|b| b as u32).collect()
    }

    /// Decode token IDs to text
    pub fn decode(&self, tokens: &[u32]) -> String {
        tokens.iter()
            .filter(|&&t| t < 256)
            .filter_map(|&t| {
                let b = t as u8;
                if b >= 32 && b < 127 {
                    Some(b as char)
                } else {
                    None
                }
            })
            .collect()
    }
}

impl Default for ByteTokenizer {
    fn default() -> Self {
        Self::new()
    }
}
