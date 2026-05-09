; DESCRIPTION: Draws a purple rectangle at (25, 101) with width 34 and height 119.
; PLAN: r0=25(x), r1=101(y), r2=34(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 101
LDI r2, 34
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
