; DESCRIPTION: Draws a orange rectangle at (12, 19) with width 63 and height 73.
; PLAN: r0=12(x), r1=19(y), r2=63(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 19
LDI r2, 63
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
