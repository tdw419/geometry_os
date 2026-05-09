; DESCRIPTION: Draws a purple rectangle at (205, 40) with width 81 and height 86.
; PLAN: r0=205(x), r1=40(y), r2=81(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 40
LDI r2, 81
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
