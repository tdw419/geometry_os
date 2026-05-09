; DESCRIPTION: Draws a purple rectangle at (155, 89) with width 112 and height 71.
; PLAN: r0=155(x), r1=89(y), r2=112(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 89
LDI r2, 112
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
