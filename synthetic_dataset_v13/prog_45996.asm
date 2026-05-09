; DESCRIPTION: Places a purple 93x73 rectangle at position (168, 42).
; PLAN: r0=168(x), r1=42(y), r2=93(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 42
LDI r2, 93
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
