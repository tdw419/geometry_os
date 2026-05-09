; DESCRIPTION: Draws a orange circle centered at (56, 184) with radius 33.
; PLAN: r0=56(x), r1=184(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 184
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
