; DESCRIPTION: Draws a orange rectangle at (45, 123) with width 19 and height 66.
; PLAN: r0=45(x), r1=123(y), r2=19(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 123
LDI r2, 19
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
