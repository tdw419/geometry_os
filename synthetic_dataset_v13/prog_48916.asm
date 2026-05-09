; DESCRIPTION: Draws a purple rectangle at (81, 155) with width 94 and height 72.
; PLAN: r0=81(x), r1=155(y), r2=94(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 155
LDI r2, 94
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
