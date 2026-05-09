; DESCRIPTION: Draws a orange rectangle at (254, 134) with width 13 and height 68.
; PLAN: r0=254(x), r1=134(y), r2=13(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 134
LDI r2, 13
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
