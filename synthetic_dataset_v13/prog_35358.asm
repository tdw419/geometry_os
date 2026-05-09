; DESCRIPTION: Draws a orange circle centered at (48, 137) with radius 39.
; PLAN: r0=48(x), r1=137(y), r2=39(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 48
LDI r1, 137
LDI r2, 39
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
