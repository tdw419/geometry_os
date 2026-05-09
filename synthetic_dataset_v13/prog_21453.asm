; DESCRIPTION: Draws a yellow rectangle at (0, 183) with width 105 and height 51.
; PLAN: r0=0(x), r1=183(y), r2=105(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 183
LDI r2, 105
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
