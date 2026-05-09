; DESCRIPTION: Draws a purple rectangle at (383, 156) with width 88 and height 57.
; PLAN: r0=383(x), r1=156(y), r2=88(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 156
LDI r2, 88
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
