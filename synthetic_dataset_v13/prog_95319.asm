; DESCRIPTION: Draws a red rectangle at (51, 15) with width 101 and height 99.
; PLAN: r0=51(x), r1=15(y), r2=101(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 15
LDI r2, 101
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
