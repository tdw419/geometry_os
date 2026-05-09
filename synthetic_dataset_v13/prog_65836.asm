; DESCRIPTION: Renders a orange disk with center (447, 227) and radius 23.
; PLAN: r0=447(x), r1=227(y), r2=23(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 447
LDI r1, 227
LDI r2, 23
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
