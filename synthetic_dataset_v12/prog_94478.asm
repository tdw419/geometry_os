; DESCRIPTION: Draws a orange circle centered at (419, 191) with radius 52.
; PLAN: r0=419(x), r1=191(y), r2=52(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 419
LDI r1, 191
LDI r2, 52
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
