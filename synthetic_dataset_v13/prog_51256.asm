; DESCRIPTION: Draws a purple rectangle at (357, 8) with width 93 and height 56.
; PLAN: r0=357(x), r1=8(y), r2=93(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 8
LDI r2, 93
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
