; DESCRIPTION: Draws a white rectangle at (41, 12) with width 44 and height 43.
; PLAN: r0=41(x), r1=12(y), r2=44(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 12
LDI r2, 44
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
