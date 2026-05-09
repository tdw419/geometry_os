; DESCRIPTION: Draws a purple rectangle at (29, 136) with width 40 and height 76.
; PLAN: r0=29(x), r1=136(y), r2=40(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 136
LDI r2, 40
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
