; DESCRIPTION: Draws a orange rectangle at (426, 62) with width 41 and height 29.
; PLAN: r0=426(x), r1=62(y), r2=41(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 62
LDI r2, 41
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
