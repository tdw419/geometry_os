; DESCRIPTION: Draws a purple rectangle at (147, 67) with width 30 and height 79.
; PLAN: r0=147(x), r1=67(y), r2=30(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 67
LDI r2, 30
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
