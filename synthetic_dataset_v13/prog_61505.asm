; DESCRIPTION: Draws a black rectangle at (297, 102) with width 51 and height 84.
; PLAN: r0=297(x), r1=102(y), r2=51(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 102
LDI r2, 51
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
