; DESCRIPTION: Draws a black rectangle at (35, 9) with width 105 and height 99.
; PLAN: r0=35(x), r1=9(y), r2=105(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 9
LDI r2, 105
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
