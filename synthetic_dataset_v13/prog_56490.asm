; DESCRIPTION: Draws a purple rectangle at (24, 179) with width 63 and height 69.
; PLAN: r0=24(x), r1=179(y), r2=63(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 179
LDI r2, 63
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
