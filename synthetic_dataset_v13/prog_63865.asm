; DESCRIPTION: Renders a purple box of size 59x42 starting at (179, 40).
; PLAN: r0=179(x), r1=40(y), r2=59(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 40
LDI r2, 59
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
