; DESCRIPTION: Draws a purple rectangle at (276, 99) with width 31 and height 66.
; PLAN: r0=276(x), r1=99(y), r2=31(width), r3=66(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 99
LDI r2, 31
LDI r3, 66
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
