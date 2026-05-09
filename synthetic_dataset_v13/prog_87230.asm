; DESCRIPTION: Draws a orange rectangle at (100, 23) with width 84 and height 120.
; PLAN: r0=100(x), r1=23(y), r2=84(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 23
LDI r2, 84
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
