; DESCRIPTION: Renders a purple box of size 42x56 starting at (16, 189).
; PLAN: r0=16(x), r1=189(y), r2=42(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 189
LDI r2, 42
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
