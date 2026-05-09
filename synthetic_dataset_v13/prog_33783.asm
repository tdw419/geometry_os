; DESCRIPTION: Creates a cyan circular shape at (321, 43) with radius 12.
; PLAN: r0=321(x), r1=43(y), r2=12(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 321
LDI r1, 43
LDI r2, 12
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
