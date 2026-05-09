; DESCRIPTION: Creates a green circular shape at (396, 75) with radius 75.
; PLAN: r0=396(x), r1=75(y), r2=75(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 396
LDI r1, 75
LDI r2, 75
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
