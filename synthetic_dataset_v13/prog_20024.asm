; DESCRIPTION: Draws a purple rectangle at (270, 176) with width 49 and height 18.
; PLAN: r0=270(x), r1=176(y), r2=49(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 176
LDI r2, 49
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
