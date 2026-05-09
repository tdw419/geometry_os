; DESCRIPTION: Draws a orange rectangle at (148, 22) with width 89 and height 64.
; PLAN: r0=148(x), r1=22(y), r2=89(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 22
LDI r2, 89
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
