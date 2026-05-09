; DESCRIPTION: Places a cyan circle of radius 31 at center (382, 201).
; PLAN: r0=382(x), r1=201(y), r2=31(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 382
LDI r1, 201
LDI r2, 31
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
