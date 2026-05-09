; DESCRIPTION: Draws a orange rectangle at (170, 5) with width 81 and height 51.
; PLAN: r0=170(x), r1=5(y), r2=81(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 5
LDI r2, 81
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
