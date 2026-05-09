; DESCRIPTION: Creates a green circular shape at (66, 190) with radius 35.
; PLAN: r0=66(x), r1=190(y), r2=35(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 190
LDI r2, 35
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
