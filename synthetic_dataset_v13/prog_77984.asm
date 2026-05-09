; DESCRIPTION: Draws a purple rectangle at (39, 63) with width 90 and height 88.
; PLAN: r0=39(x), r1=63(y), r2=90(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 63
LDI r2, 90
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
