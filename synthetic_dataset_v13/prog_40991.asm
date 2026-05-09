; DESCRIPTION: Draws a orange rectangle at (287, 43) with width 11 and height 100.
; PLAN: r0=287(x), r1=43(y), r2=11(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 43
LDI r2, 11
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
