; DESCRIPTION: Creates a green circular shape at (418, 48) with radius 20.
; PLAN: r0=418(x), r1=48(y), r2=20(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 48
LDI r2, 20
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
