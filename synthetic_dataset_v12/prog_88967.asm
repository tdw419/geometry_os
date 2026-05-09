; DESCRIPTION: Draws a orange rectangle at (457, 70) with width 52 and height 31.
; PLAN: r0=457(x), r1=70(y), r2=52(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 70
LDI r2, 52
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
