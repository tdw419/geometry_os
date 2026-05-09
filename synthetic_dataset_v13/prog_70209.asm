; DESCRIPTION: Draws a yellow rectangle at (55, 33) with width 116 and height 62.
; PLAN: r0=55(x), r1=33(y), r2=116(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 33
LDI r2, 116
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
