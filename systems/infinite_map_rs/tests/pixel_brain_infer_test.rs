//! PixelBrain inference tests

use infinite_map_rs::pixel_brain::infer::{EmbedConfig, AttentionConfig, FFNConfig, ModelConfig, LayerOffsets};

#[test]
fn test_inference_config() {
    // Test that config struct is correct size
    use std::mem::size_of;
    assert_eq!(size_of::<EmbedConfig>(), 16); // 4 x u32
}

#[test]
fn test_attention_config_size() {
    use std::mem::size_of;
    assert_eq!(size_of::<AttentionConfig>(), 40); // 9 x u32 + 1 padding = 40 bytes
}

#[test]
fn test_ffn_config_size() {
    use std::mem::size_of;
    assert_eq!(size_of::<FFNConfig>(), 32); // 6 x u32 + 2 padding = 32 bytes
}

#[test]
fn test_model_config() {
    let config = ModelConfig::nano();
    assert_eq!(config.hidden_dim, 256);
    assert_eq!(config.n_layers, 4);
    assert_eq!(config.ffn_dim, 1024);
}

#[test]
fn test_layer_offsets_layer_0() {
    let offsets = LayerOffsets::for_layer(0);
    // Embeddings: 0 - 65535 (256 * 256)
    // Layer 0 starts at 65536 (0x10000)
    assert_eq!(offsets.q_offset, 65536);
}

#[test]
fn test_layer_offsets_layer_1() {
    let offsets = LayerOffsets::for_layer(1);
    // Layer 0 size: Q(65536) + K(65536) + V(65536) + O(16384) + FFN_up(262144) + FFN_down(262144) = 677376
    // Layer 1 starts at 65536 + 677376 = 742912
    assert_eq!(offsets.q_offset, 742912);
}

