; DESCRIPTION: Draws a orange rectangle at (200, 6) with width 75 and height 41.
; PLAN: r0=200(x), r1=6(y), r2=75(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 6
LDI r2, 75
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
