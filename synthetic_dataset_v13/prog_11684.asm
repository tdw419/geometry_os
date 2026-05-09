; DESCRIPTION: Creates a green circular shape at (382, 190) with radius 60.
; PLAN: r0=382(x), r1=190(y), r2=60(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 382
LDI r1, 190
LDI r2, 60
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
