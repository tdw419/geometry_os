; DESCRIPTION: Draws a yellow rectangle at (194, 78) with width 55 and height 104.
; PLAN: r0=194(x), r1=78(y), r2=55(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 78
LDI r2, 55
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
