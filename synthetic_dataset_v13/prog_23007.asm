; DESCRIPTION: Creates a green circular shape at (399, 97) with radius 80.
; PLAN: r0=399(x), r1=97(y), r2=80(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 399
LDI r1, 97
LDI r2, 80
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
