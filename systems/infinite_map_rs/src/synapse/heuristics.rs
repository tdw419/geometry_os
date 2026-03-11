// systems/infinite_map_rs/src/synapse/heuristics.rs
//
// Heuristic Analysis for Memory Regions
// Pre-processes raw memory to provide context for the LLM


use serde::{Serialize, Deserialize};

/// Result of a heuristic analysis
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct MemoryHeuristics {
    pub entropy: f32,
    pub strings: Vec<String>,
    pub magic_signature: Option<String>,
    pub likely_type: MemoryType,
}

#[derive(Debug, Clone, PartialEq, Serialize, Deserialize)]
pub enum MemoryType {
    Code,       // High entropy (not max), specific patterns
    Text,       // Low entropy, many strings
    Zero,       // Zero entropy
    Data,       // Moderate entropy
    Encrypted,  // Max entropy ~8.0
    Unknown,
}

/// Calculate Shannon entropy of the data
pub fn calculate_entropy(data: &[u8]) -> f32 {
    let mut counts = [0usize; 256];
    let len = data.len() as f32;

    for &byte in data {
        counts[byte as usize] += 1;
    }

    let mut entropy = 0.0;
    for &count in counts.iter() {
        if count > 0 {
            let p = count as f32 / len;
            entropy -= p * p.log2();
        }
    }
    entropy
}

/// Extract printable ASCII strings (min length 4)
pub fn extract_strings(data: &[u8]) -> Vec<String> {
    let mut strings = Vec::new();
    let mut current_string = String::new();

    for &byte in data {
        if byte >= 32 && byte <= 126 {
            current_string.push(byte as char);
        } else {
            if current_string.len() >= 4 {
                strings.push(current_string.clone());
            }
            current_string.clear();
        }
    }
    // Catch trailing string
    if current_string.len() >= 4 {
        strings.push(current_string);
    }

    // Limit to top 10 longest for brevity
    strings.sort_by_key(|s| std::cmp::Reverse(s.len()));
    strings.truncate(10);
    strings
}

/// Detect known magic numbers at start of buffer
pub fn detect_magic_numbers(data: &[u8]) -> Option<String> {
    if data.len() < 4 {
        return None;
    }

    // Common Signatures
    if data.starts_with(b"\x7FELF") { return Some("ELF Binary".to_string()); }
    if data.starts_with(b"MZ") { return Some("PE Executable".to_string()); }
    if data.starts_with(b"\xCA\xFE\xBA\xBE") { return Some("Java Class / Mach-O".to_string()); }
    if data.starts_with(b"\x89PNG") { return Some("PNG Image".to_string()); }
    if data.starts_with(b"\xFF\xD8\xFF") { return Some("JPEG Image".to_string()); }
    if data.starts_with(b"GIF8") { return Some("GIF Image".to_string()); }
    if data.starts_with(b"%PDF") { return Some("PDF Document".to_string()); }
    if data.starts_with(b"PK\x03\x04") { return Some("ZIP Archive".to_string()); }
    
    // RISC-V Instructions (Common preamble: ADDI sp, sp, -X)
    // difficult to detect without disassembly, skipping for now
    
    None
}

/// Perform full analysis
pub fn analyze_buffer(data: &[u8]) -> MemoryHeuristics {
    let entropy = calculate_entropy(data);
    let strings = extract_strings(data);
    let magic = detect_magic_numbers(data);
    
    let likely_type = if entropy == 0.0 {
        MemoryType::Zero
    } else if entropy > 7.5 {
        MemoryType::Encrypted
    } else if let Some(_) = magic {
        MemoryType::Data // or Code depending on magic
    } else if !strings.is_empty() && entropy < 4.5 {
        MemoryType::Text
    } else if entropy > 5.0 && entropy < 7.0 {
        MemoryType::Code // Heuristic guess for x86/RISC-V machine code
    } else {
        MemoryType::Data
    };

    MemoryHeuristics {
        entropy,
        strings,
        magic_signature: magic,
        likely_type,
    }
}
