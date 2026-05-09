; DESCRIPTION: Draws a red rectangle at (51, 132) with width 31 and height 52.
; PLAN: r0=51(x), r1=132(y), r2=31(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 132
LDI r2, 31
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
