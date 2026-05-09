; DESCRIPTION: Draws a black rectangle at (205, 6) with width 25 and height 106.
; PLAN: r0=205(x), r1=6(y), r2=25(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 6
LDI r2, 25
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
