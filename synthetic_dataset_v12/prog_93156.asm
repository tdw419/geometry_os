; DESCRIPTION: Creates a cyan circular shape at (201, 92) with radius 80.
; PLAN: r0=201(x), r1=92(y), r2=80(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 201
LDI r1, 92
LDI r2, 80
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
