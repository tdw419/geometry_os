; DESCRIPTION: Draws a orange rectangle at (351, 41) with width 113 and height 55.
; PLAN: r0=351(x), r1=41(y), r2=113(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 41
LDI r2, 113
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
