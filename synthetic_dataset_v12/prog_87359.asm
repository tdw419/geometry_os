; DESCRIPTION: Draws a purple rectangle at (13, 140) with width 118 and height 45.
; PLAN: r0=13(x), r1=140(y), r2=118(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 140
LDI r2, 118
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
