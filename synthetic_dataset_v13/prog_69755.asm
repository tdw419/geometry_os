; DESCRIPTION: Creates a white circular shape at (367, 137) with radius 19.
; PLAN: r0=367(x), r1=137(y), r2=19(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 367
LDI r1, 137
LDI r2, 19
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
