; DESCRIPTION: Draws a black rectangle at (22, 4) with width 52 and height 84.
; PLAN: r0=22(x), r1=4(y), r2=52(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 4
LDI r2, 52
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
