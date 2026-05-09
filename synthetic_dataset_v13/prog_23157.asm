; DESCRIPTION: Creates a green circular shape at (36, 184) with radius 17.
; PLAN: r0=36(x), r1=184(y), r2=17(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 36
LDI r1, 184
LDI r2, 17
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
