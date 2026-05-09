; DESCRIPTION: Draws a black rectangle at (260, 136) with width 18 and height 76.
; PLAN: r0=260(x), r1=136(y), r2=18(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 136
LDI r2, 18
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
