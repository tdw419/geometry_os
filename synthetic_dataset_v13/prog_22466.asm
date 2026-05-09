; DESCRIPTION: Draws a purple rectangle at (221, 155) with width 22 and height 91.
; PLAN: r0=221(x), r1=155(y), r2=22(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 155
LDI r2, 22
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
