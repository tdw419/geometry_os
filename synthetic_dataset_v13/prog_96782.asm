; DESCRIPTION: Draws a purple rectangle at (84, 155) with width 112 and height 60.
; PLAN: r0=84(x), r1=155(y), r2=112(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 155
LDI r2, 112
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
