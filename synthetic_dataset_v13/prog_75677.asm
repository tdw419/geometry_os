; DESCRIPTION: Draws a purple rectangle at (73, 1) with width 63 and height 43.
; PLAN: r0=73(x), r1=1(y), r2=63(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 1
LDI r2, 63
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
