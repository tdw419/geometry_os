; DESCRIPTION: Draws a purple rectangle at (427, 4) with width 15 and height 30.
; PLAN: r0=427(x), r1=4(y), r2=15(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 4
LDI r2, 15
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
