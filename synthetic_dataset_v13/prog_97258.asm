; DESCRIPTION: Renders a purple box of size 63x57 starting at (35, 115).
; PLAN: r0=35(x), r1=115(y), r2=63(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 115
LDI r2, 63
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
