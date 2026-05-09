; DESCRIPTION: Draws a orange rectangle at (54, 162) with width 100 and height 70.
; PLAN: r0=54(x), r1=162(y), r2=100(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 162
LDI r2, 100
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
