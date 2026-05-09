; DESCRIPTION: Draws a black rectangle at (399, 20) with width 13 and height 110.
; PLAN: r0=399(x), r1=20(y), r2=13(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 20
LDI r2, 13
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
