; DESCRIPTION: Draws a orange rectangle at (44, 89) with width 51 and height 115.
; PLAN: r0=44(x), r1=89(y), r2=51(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 89
LDI r2, 51
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
