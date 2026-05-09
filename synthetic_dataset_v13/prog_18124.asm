; DESCRIPTION: Creates a white circular shape at (363, 182) with radius 17.
; PLAN: r0=363(x), r1=182(y), r2=17(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 363
LDI r1, 182
LDI r2, 17
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
