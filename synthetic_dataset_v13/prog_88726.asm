; DESCRIPTION: Draws a orange rectangle at (254, 52) with width 116 and height 114.
; PLAN: r0=254(x), r1=52(y), r2=116(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 52
LDI r2, 116
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
