; DESCRIPTION: Creates a white circular shape at (379, 12) with radius 10.
; PLAN: r0=379(x), r1=12(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 379
LDI r1, 12
LDI r2, 10
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
