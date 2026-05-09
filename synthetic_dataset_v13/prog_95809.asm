; DESCRIPTION: Draws a black rectangle at (114, 145) with width 22 and height 55.
; PLAN: r0=114(x), r1=145(y), r2=22(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 145
LDI r2, 22
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
