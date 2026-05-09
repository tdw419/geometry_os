; DESCRIPTION: Creates a white circular shape at (276, 104) with radius 36.
; PLAN: r0=276(x), r1=104(y), r2=36(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 104
LDI r2, 36
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
