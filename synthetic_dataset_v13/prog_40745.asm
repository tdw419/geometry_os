; DESCRIPTION: Creates a red circular shape at (418, 139) with radius 48.
; PLAN: r0=418(x), r1=139(y), r2=48(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 139
LDI r2, 48
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
