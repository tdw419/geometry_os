; DESCRIPTION: Creates a green circular shape at (256, 34) with radius 12.
; PLAN: r0=256(x), r1=34(y), r2=12(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 256
LDI r1, 34
LDI r2, 12
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
