; DESCRIPTION: Draws a black rectangle at (34, 106) with width 74 and height 110.
; PLAN: r0=34(x), r1=106(y), r2=74(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 106
LDI r2, 74
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
