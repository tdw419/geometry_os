; DESCRIPTION: Draws a purple rectangle at (427, 163) with width 80 and height 90.
; PLAN: r0=427(x), r1=163(y), r2=80(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 163
LDI r2, 80
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
