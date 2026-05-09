; DESCRIPTION: Draws a orange rectangle at (67, 81) with width 52 and height 41.
; PLAN: r0=67(x), r1=81(y), r2=52(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 81
LDI r2, 52
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
