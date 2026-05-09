; DESCRIPTION: Creates a red circular shape at (299, 201) with radius 40.
; PLAN: r0=299(x), r1=201(y), r2=40(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 299
LDI r1, 201
LDI r2, 40
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
