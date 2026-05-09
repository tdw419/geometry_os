; DESCRIPTION: Creates a green circular shape at (378, 148) with radius 61.
; PLAN: r0=378(x), r1=148(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 378
LDI r1, 148
LDI r2, 61
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
