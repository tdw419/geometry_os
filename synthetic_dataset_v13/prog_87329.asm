; DESCRIPTION: Draws a white rectangle at (231, 51) with width 118 and height 41.
; PLAN: r0=231(x), r1=51(y), r2=118(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 51
LDI r2, 118
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
