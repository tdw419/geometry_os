; DESCRIPTION: Draws a yellow rectangle at (127, 89) with width 41 and height 101.
; PLAN: r0=127(x), r1=89(y), r2=41(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 89
LDI r2, 41
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
