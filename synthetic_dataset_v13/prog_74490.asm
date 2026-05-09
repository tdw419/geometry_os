; DESCRIPTION: Draws a black rectangle at (142, 119) with width 84 and height 81.
; PLAN: r0=142(x), r1=119(y), r2=84(width), r3=81(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 119
LDI r2, 84
LDI r3, 81
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
