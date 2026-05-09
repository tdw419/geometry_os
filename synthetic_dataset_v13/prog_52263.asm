; DESCRIPTION: Draws a orange circle centered at (485, 169) with radius 22.
; PLAN: r0=485(x), r1=169(y), r2=22(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 485
LDI r1, 169
LDI r2, 22
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
