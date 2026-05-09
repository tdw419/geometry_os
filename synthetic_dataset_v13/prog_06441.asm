; DESCRIPTION: Creates a black circular shape at (419, 193) with radius 20.
; PLAN: r0=419(x), r1=193(y), r2=20(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 419
LDI r1, 193
LDI r2, 20
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
