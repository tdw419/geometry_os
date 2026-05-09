; DESCRIPTION: Draws a purple rectangle at (186, 136) with width 26 and height 114.
; PLAN: r0=186(x), r1=136(y), r2=26(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 136
LDI r2, 26
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
