; DESCRIPTION: Draws a orange rectangle at (41, 5) with width 30 and height 32.
; PLAN: r0=41(x), r1=5(y), r2=30(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 5
LDI r2, 30
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
