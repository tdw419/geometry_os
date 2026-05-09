; DESCRIPTION: Draws a purple rectangle at (66, 62) with width 92 and height 112.
; PLAN: r0=66(x), r1=62(y), r2=92(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 62
LDI r2, 92
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
