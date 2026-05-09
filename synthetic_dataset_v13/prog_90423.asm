; DESCRIPTION: Draws a orange circle centered at (291, 123) with radius 21.
; PLAN: r0=291(x), r1=123(y), r2=21(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 291
LDI r1, 123
LDI r2, 21
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
