; DESCRIPTION: Draws a purple rectangle at (236, 54) with width 11 and height 56.
; PLAN: r0=236(x), r1=54(y), r2=11(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 54
LDI r2, 11
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
