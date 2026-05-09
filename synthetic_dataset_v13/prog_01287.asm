; DESCRIPTION: Draws a orange circle centered at (245, 25) with radius 22.
; PLAN: r0=245(x), r1=25(y), r2=22(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 25
LDI r2, 22
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
