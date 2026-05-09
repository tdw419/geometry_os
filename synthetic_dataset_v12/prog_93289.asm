; DESCRIPTION: Draws a black rectangle at (199, 2) with width 101 and height 69.
; PLAN: r0=199(x), r1=2(y), r2=101(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 2
LDI r2, 101
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
