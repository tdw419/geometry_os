; DESCRIPTION: Draws a orange rectangle at (426, 41) with width 41 and height 96.
; PLAN: r0=426(x), r1=41(y), r2=41(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 41
LDI r2, 41
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
