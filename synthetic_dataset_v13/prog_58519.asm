; DESCRIPTION: Draws a orange rectangle at (1, 41) with width 22 and height 30.
; PLAN: r0=1(x), r1=41(y), r2=22(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 41
LDI r2, 22
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
