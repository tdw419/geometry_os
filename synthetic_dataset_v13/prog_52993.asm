; DESCRIPTION: Draws a yellow rectangle at (35, 51) with width 20 and height 109.
; PLAN: r0=35(x), r1=51(y), r2=20(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 51
LDI r2, 20
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
