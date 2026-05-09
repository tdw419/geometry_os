; DESCRIPTION: Draws a green rectangle at (41, 23) with width 51 and height 55.
; PLAN: r0=41(x), r1=23(y), r2=51(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 23
LDI r2, 51
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
