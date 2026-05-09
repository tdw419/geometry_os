; DESCRIPTION: Draws a purple rectangle at (57, 101) with width 15 and height 79.
; PLAN: r0=57(x), r1=101(y), r2=15(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 101
LDI r2, 15
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
