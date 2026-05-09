; DESCRIPTION: Draws a orange circle centered at (204, 87) with radius 34.
; PLAN: r0=204(x), r1=87(y), r2=34(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 87
LDI r2, 34
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
