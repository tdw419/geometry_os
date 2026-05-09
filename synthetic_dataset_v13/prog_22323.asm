; DESCRIPTION: Draws a black rectangle at (55, 89) with width 102 and height 76.
; PLAN: r0=55(x), r1=89(y), r2=102(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 89
LDI r2, 102
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
