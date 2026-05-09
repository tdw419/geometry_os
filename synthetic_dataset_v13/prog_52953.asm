; DESCRIPTION: Draws a yellow rectangle at (76, 137) with width 108 and height 73.
; PLAN: r0=76(x), r1=137(y), r2=108(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 137
LDI r2, 108
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
