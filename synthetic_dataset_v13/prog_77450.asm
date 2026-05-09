; DESCRIPTION: Draws a red rectangle at (41, 105) with width 90 and height 53.
; PLAN: r0=41(x), r1=105(y), r2=90(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 105
LDI r2, 90
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
