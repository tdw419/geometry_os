; DESCRIPTION: Draws a black rectangle at (222, 23) with width 106 and height 55.
; PLAN: r0=222(x), r1=23(y), r2=106(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 23
LDI r2, 106
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
