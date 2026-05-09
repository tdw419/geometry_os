; DESCRIPTION: Draws a purple rectangle at (2, 156) with width 90 and height 17.
; PLAN: r0=2(x), r1=156(y), r2=90(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 156
LDI r2, 90
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
