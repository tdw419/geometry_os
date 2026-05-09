; DESCRIPTION: Draws a orange rectangle at (272, 123) with width 112 and height 19.
; PLAN: r0=272(x), r1=123(y), r2=112(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 123
LDI r2, 112
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
