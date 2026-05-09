; DESCRIPTION: Draws a purple rectangle at (80, 40) with width 114 and height 119.
; PLAN: r0=80(x), r1=40(y), r2=114(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 40
LDI r2, 114
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
