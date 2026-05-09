; DESCRIPTION: Creates a white circular shape at (316, 71) with radius 20.
; PLAN: r0=316(x), r1=71(y), r2=20(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 316
LDI r1, 71
LDI r2, 20
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
