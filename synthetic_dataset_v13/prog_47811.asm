; DESCRIPTION: Draws a yellow rectangle at (41, 51) with width 37 and height 109.
; PLAN: r0=41(x), r1=51(y), r2=37(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 51
LDI r2, 37
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
