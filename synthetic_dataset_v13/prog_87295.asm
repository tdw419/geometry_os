; DESCRIPTION: Draws a purple rectangle at (155, 162) with width 65 and height 28.
; PLAN: r0=155(x), r1=162(y), r2=65(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 162
LDI r2, 65
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
