; DESCRIPTION: Creates a white circular shape at (418, 107) with radius 75.
; PLAN: r0=418(x), r1=107(y), r2=75(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 107
LDI r2, 75
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
