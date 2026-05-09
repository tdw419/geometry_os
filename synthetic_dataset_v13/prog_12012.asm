; DESCRIPTION: Draws a orange rectangle at (227, 161) with width 73 and height 11.
; PLAN: r0=227(x), r1=161(y), r2=73(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 161
LDI r2, 73
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
