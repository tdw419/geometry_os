; DESCRIPTION: Draws a purple rectangle at (136, 19) with width 90 and height 35.
; PLAN: r0=136(x), r1=19(y), r2=90(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 19
LDI r2, 90
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
