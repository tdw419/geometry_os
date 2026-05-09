; DESCRIPTION: Places a blue 93x42 rectangle at position (0, 103).
; PLAN: r0=0(x), r1=103(y), r2=93(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 103
LDI r2, 93
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
