; DESCRIPTION: Draws a purple rectangle at (10, 144) with width 14 and height 19.
; PLAN: r0=10(x), r1=144(y), r2=14(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 144
LDI r2, 14
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
