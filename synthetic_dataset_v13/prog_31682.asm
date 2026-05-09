; DESCRIPTION: Creates a white circular shape at (363, 196) with radius 15.
; PLAN: r0=363(x), r1=196(y), r2=15(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 363
LDI r1, 196
LDI r2, 15
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
