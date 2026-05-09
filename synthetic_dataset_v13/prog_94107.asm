; DESCRIPTION: Draws a orange rectangle at (351, 31) with width 105 and height 19.
; PLAN: r0=351(x), r1=31(y), r2=105(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 31
LDI r2, 105
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
