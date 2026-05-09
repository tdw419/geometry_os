; DESCRIPTION: Draws a purple rectangle at (431, 22) with width 81 and height 98.
; PLAN: r0=431(x), r1=22(y), r2=81(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 22
LDI r2, 81
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
