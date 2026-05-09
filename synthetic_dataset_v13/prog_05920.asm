; DESCRIPTION: Draws a orange rectangle at (80, 34) with width 106 and height 10.
; PLAN: r0=80(x), r1=34(y), r2=106(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 34
LDI r2, 106
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
