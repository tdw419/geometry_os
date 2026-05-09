; DESCRIPTION: Draws a orange rectangle at (169, 148) with width 17 and height 89.
; PLAN: r0=169(x), r1=148(y), r2=17(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 148
LDI r2, 17
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
