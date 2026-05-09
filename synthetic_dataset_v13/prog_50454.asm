; DESCRIPTION: Creates a green circular shape at (283, 93) with radius 53.
; PLAN: r0=283(x), r1=93(y), r2=53(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 283
LDI r1, 93
LDI r2, 53
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
