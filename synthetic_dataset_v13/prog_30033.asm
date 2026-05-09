; DESCRIPTION: Draws a black rectangle at (129, 115) with width 106 and height 52.
; PLAN: r0=129(x), r1=115(y), r2=106(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 115
LDI r2, 106
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
