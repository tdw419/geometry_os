; DESCRIPTION: Draws a purple rectangle at (26, 96) with width 19 and height 80.
; PLAN: r0=26(x), r1=96(y), r2=19(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 96
LDI r2, 19
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
