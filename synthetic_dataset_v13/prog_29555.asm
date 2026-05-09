; DESCRIPTION: Draws a black rectangle at (169, 76) with width 31 and height 49.
; PLAN: r0=169(x), r1=76(y), r2=31(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 76
LDI r2, 31
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
