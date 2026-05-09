; DESCRIPTION: Creates a cyan circular shape at (321, 137) with radius 11.
; PLAN: r0=321(x), r1=137(y), r2=11(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 321
LDI r1, 137
LDI r2, 11
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
