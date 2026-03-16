//! ByteTokenizer tests

use infinite_map_rs::pixel_brain::tokenizer::ByteTokenizer;

#[test]
fn test_tokenizer_encode() {
    let tok = ByteTokenizer::new();
    let text = "hello";
    let tokens = tok.encode(text);
    assert_eq!(tokens, vec![104, 101, 108, 108, 111]); // ASCII values
}

#[test]
fn test_tokenizer_decode() {
    let tok = ByteTokenizer::new();
    let tokens = vec![104, 101, 108, 108, 111];
    let text = tok.decode(&tokens);
    assert_eq!(text, "hello");
}

#[test]
fn test_tokenizer_roundtrip() {
    let tok = ByteTokenizer::new();
    let original = "Hello, World! 123";
    let tokens = tok.encode(original);
    let decoded = tok.decode(&tokens);
    assert_eq!(original, decoded);
}

#[test]
fn test_tokenizer_vocab_size() {
    let tok = ByteTokenizer::new();
    assert_eq!(tok.vocab_size(), 256);
}
