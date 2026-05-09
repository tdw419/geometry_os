; DESCRIPTION: Creates a green circular shape at (97, 77) with radius 36.
; PLAN: r0=97(x), r1=77(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 97
LDI r1, 77
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
