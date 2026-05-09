; DESCRIPTION: Draws a black rectangle at (77, 227) with width 84 and height 25.
; PLAN: r0=77(x), r1=227(y), r2=84(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 227
LDI r2, 84
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
