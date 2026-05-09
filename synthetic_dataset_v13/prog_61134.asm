; DESCRIPTION: Draws a orange rectangle at (162, 30) with width 52 and height 74.
; PLAN: r0=162(x), r1=30(y), r2=52(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 30
LDI r2, 52
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
