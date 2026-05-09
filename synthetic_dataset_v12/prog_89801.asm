; DESCRIPTION: Renders a purple box of size 35x106 starting at (181, 81).
; PLAN: r0=181(x), r1=81(y), r2=35(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 81
LDI r2, 35
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
