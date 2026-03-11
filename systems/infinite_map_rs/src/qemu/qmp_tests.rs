
#[cfg(test)]
mod tests {
    use super::*;
    use serde_json::json;

    #[test]
    fn test_qmp_command_serialization() {
        // Test basic command
        let cmd = json!({
            "execute": "stop"
        });
        assert_eq!(cmd.to_string(), r#"{"execute":"stop"}"#);

        // Test command with arguments
        let cmd_args = json!({
            "execute": "camera",
            "arguments": {
                "zoom": 1.5
            }
        });
        assert_eq!(cmd_args.to_string(), r#"{"arguments":{"zoom":1.5},"execute":"camera"}"#);
    }
}
