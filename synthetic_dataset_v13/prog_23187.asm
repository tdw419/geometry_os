; DESCRIPTION: Draws a orange circle centered at (433, 192) with radius 51.
; PLAN: r0=433(x), r1=192(y), r2=51(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 433
LDI r1, 192
LDI r2, 51
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
