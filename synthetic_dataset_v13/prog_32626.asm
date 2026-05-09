; DESCRIPTION: Draws a black rectangle at (163, 118) with width 41 and height 114.
; PLAN: r0=163(x), r1=118(y), r2=41(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 118
LDI r2, 41
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
