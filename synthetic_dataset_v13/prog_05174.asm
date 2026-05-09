; DESCRIPTION: Creates a red circular shape at (351, 101) with radius 80.
; PLAN: r0=351(x), r1=101(y), r2=80(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 351
LDI r1, 101
LDI r2, 80
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
