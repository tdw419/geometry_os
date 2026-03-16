//! PixelBrain inference tests

use infinite_map_rs::pixel_brain::infer::EmbedConfig;
use infinite_map_rs::pixel_brain::infer::ModelConfig;

#[test]
fn test_inference_config() {
    // Test that config struct is correct size
    use std::mem::size_of;
    assert_eq!(size_of::<EmbedConfig>(), 16); // 4 x u32
}

#[test]
fn test_model_config() {
    let config = ModelConfig::nano();
    assert_eq!(config.hidden_dim, 256);
    assert_eq!(config.n_layers, 4);
    assert_eq!(config.ffn_dim, 1024);
}
