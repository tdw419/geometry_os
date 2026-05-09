; DESCRIPTION: Draws a white rectangle at (323, 5) with width 114 and height 41.
; PLAN: r0=323(x), r1=5(y), r2=114(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 5
LDI r2, 114
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
