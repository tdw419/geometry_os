; DESCRIPTION: Draws a purple rectangle at (261, 136) with width 98 and height 93.
; PLAN: r0=261(x), r1=136(y), r2=98(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 136
LDI r2, 98
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
