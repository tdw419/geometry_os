; DESCRIPTION: Renders a purple box of size 81x42 starting at (135, 13).
; PLAN: r0=135(x), r1=13(y), r2=81(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 13
LDI r2, 81
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
