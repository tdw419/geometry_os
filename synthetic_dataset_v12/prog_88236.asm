; DESCRIPTION: Creates a green circular shape at (247, 139) with radius 37.
; PLAN: r0=247(x), r1=139(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 247
LDI r1, 139
LDI r2, 37
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
