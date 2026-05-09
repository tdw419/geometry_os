; DESCRIPTION: Creates a green circular shape at (438, 139) with radius 66.
; PLAN: r0=438(x), r1=139(y), r2=66(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 438
LDI r1, 139
LDI r2, 66
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
