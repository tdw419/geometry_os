; DESCRIPTION: Creates a green circular shape at (402, 182) with radius 21.
; PLAN: r0=402(x), r1=182(y), r2=21(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 402
LDI r1, 182
LDI r2, 21
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
