; DESCRIPTION: Draws a yellow rectangle at (31, 145) with width 100 and height 19.
; PLAN: r0=31(x), r1=145(y), r2=100(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 145
LDI r2, 100
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
