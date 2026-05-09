; DESCRIPTION: Draws a orange rectangle at (414, 178) with width 41 and height 78.
; PLAN: r0=414(x), r1=178(y), r2=41(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 178
LDI r2, 41
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
