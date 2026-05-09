; DESCRIPTION: Creates a white circular shape at (112, 137) with radius 80.
; PLAN: r0=112(x), r1=137(y), r2=80(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 137
LDI r2, 80
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
