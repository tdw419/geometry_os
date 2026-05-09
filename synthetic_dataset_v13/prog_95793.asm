; DESCRIPTION: Draws a orange rectangle at (343, 43) with width 76 and height 30.
; PLAN: r0=343(x), r1=43(y), r2=76(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 43
LDI r2, 76
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
