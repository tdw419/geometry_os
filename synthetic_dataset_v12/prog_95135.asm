; DESCRIPTION: Creates a red circular shape at (379, 177) with radius 20.
; PLAN: r0=379(x), r1=177(y), r2=20(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 379
LDI r1, 177
LDI r2, 20
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
