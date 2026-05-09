; DESCRIPTION: Draws a orange rectangle at (91, 34) with width 31 and height 100.
; PLAN: r0=91(x), r1=34(y), r2=31(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 34
LDI r2, 31
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
