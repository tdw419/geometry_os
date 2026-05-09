; DESCRIPTION: Draws a orange circle centered at (204, 79) with radius 71.
; PLAN: r0=204(x), r1=79(y), r2=71(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 79
LDI r2, 71
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
