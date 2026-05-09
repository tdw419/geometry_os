; DESCRIPTION: Draws a orange circle centered at (195, 169) with radius 39.
; PLAN: r0=195(x), r1=169(y), r2=39(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 169
LDI r2, 39
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
