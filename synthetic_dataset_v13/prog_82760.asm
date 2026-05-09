; DESCRIPTION: Creates a green circular shape at (194, 190) with radius 66.
; PLAN: r0=194(x), r1=190(y), r2=66(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 190
LDI r2, 66
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
