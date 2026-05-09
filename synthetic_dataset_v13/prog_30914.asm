; DESCRIPTION: Renders a purple box of size 103x42 starting at (397, 103).
; PLAN: r0=397(x), r1=103(y), r2=103(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 103
LDI r2, 103
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
