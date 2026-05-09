; DESCRIPTION: Creates a white circular shape at (316, 72) with radius 60.
; PLAN: r0=316(x), r1=72(y), r2=60(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 316
LDI r1, 72
LDI r2, 60
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
