; DESCRIPTION: Draws a orange circle centered at (69, 216) with radius 18.
; PLAN: r0=69(x), r1=216(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 216
LDI r2, 18
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
