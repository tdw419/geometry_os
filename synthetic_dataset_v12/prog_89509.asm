; DESCRIPTION: Draws a orange circle centered at (245, 110) with radius 57.
; PLAN: r0=245(x), r1=110(y), r2=57(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 110
LDI r2, 57
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
