; DESCRIPTION: Draws a purple rectangle at (191, 144) with width 23 and height 56.
; PLAN: r0=191(x), r1=144(y), r2=23(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 144
LDI r2, 23
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
