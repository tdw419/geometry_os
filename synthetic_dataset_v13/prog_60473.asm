; DESCRIPTION: Creates a green circular shape at (126, 182) with radius 48.
; PLAN: r0=126(x), r1=182(y), r2=48(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 182
LDI r2, 48
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
