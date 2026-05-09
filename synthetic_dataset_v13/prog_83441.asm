; DESCRIPTION: Draws a white rectangle at (114, 4) with width 41 and height 62.
; PLAN: r0=114(x), r1=4(y), r2=41(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 4
LDI r2, 41
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
