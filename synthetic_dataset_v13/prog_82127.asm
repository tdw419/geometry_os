; DESCRIPTION: Draws a black rectangle at (194, 11) with width 100 and height 20.
; PLAN: r0=194(x), r1=11(y), r2=100(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 11
LDI r2, 100
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
