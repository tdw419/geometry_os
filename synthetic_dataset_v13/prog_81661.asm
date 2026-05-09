; DESCRIPTION: Draws a orange rectangle at (81, 70) with width 91 and height 54.
; PLAN: r0=81(x), r1=70(y), r2=91(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 70
LDI r2, 91
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
