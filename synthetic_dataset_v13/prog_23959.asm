; DESCRIPTION: Draws a yellow rectangle at (227, 167) with width 78 and height 51.
; PLAN: r0=227(x), r1=167(y), r2=78(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 167
LDI r2, 78
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
