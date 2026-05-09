; DESCRIPTION: Creates a green circular shape at (396, 105) with radius 51.
; PLAN: r0=396(x), r1=105(y), r2=51(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 396
LDI r1, 105
LDI r2, 51
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
