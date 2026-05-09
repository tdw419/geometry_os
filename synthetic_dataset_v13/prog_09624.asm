; DESCRIPTION: Draws a yellow rectangle at (51, 118) with width 59 and height 12.
; PLAN: r0=51(x), r1=118(y), r2=59(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 118
LDI r2, 59
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
