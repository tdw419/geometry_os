; DESCRIPTION: Creates a green circular shape at (184, 211) with radius 19.
; PLAN: r0=184(x), r1=211(y), r2=19(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 211
LDI r2, 19
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
