; DESCRIPTION: Creates a green circular shape at (419, 149) with radius 19.
; PLAN: r0=419(x), r1=149(y), r2=19(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 419
LDI r1, 149
LDI r2, 19
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
