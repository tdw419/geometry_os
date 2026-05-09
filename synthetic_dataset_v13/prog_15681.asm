; DESCRIPTION: Creates a green circular shape at (112, 77) with radius 73.
; PLAN: r0=112(x), r1=77(y), r2=73(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 77
LDI r2, 73
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
