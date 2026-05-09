; DESCRIPTION: Creates a green circular shape at (341, 48) with radius 44.
; PLAN: r0=341(x), r1=48(y), r2=44(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 341
LDI r1, 48
LDI r2, 44
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
