; DESCRIPTION: Draws a purple rectangle at (223, 156) with width 56 and height 81.
; PLAN: r0=223(x), r1=156(y), r2=56(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 156
LDI r2, 56
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
