; DESCRIPTION: Draws a orange rectangle at (95, 9) with width 18 and height 23.
; PLAN: r0=95(x), r1=9(y), r2=18(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 9
LDI r2, 18
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
