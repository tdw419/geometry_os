; DESCRIPTION: Draws a black rectangle at (357, 100) with width 38 and height 99.
; PLAN: r0=357(x), r1=100(y), r2=38(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 100
LDI r2, 38
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
