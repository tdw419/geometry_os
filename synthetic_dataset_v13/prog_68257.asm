; DESCRIPTION: Creates a green circular shape at (245, 125) with radius 73.
; PLAN: r0=245(x), r1=125(y), r2=73(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 125
LDI r2, 73
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
