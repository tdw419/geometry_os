; DESCRIPTION: Draws a white rectangle at (101, 41) with width 44 and height 89.
; PLAN: r0=101(x), r1=41(y), r2=44(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 41
LDI r2, 44
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
