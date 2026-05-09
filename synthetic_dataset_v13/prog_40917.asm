; DESCRIPTION: Draws a red rectangle at (334, 203) with width 29 and height 41.
; PLAN: r0=334(x), r1=203(y), r2=29(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 203
LDI r2, 29
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
