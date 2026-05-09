; DESCRIPTION: Draws a black rectangle at (199, 22) with width 62 and height 102.
; PLAN: r0=199(x), r1=22(y), r2=62(width), r3=102(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 22
LDI r2, 62
LDI r3, 102
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
