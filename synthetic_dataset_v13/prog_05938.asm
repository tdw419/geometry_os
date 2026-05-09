; DESCRIPTION: Creates a cyan circular shape at (388, 84) with radius 76.
; PLAN: r0=388(x), r1=84(y), r2=76(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 388
LDI r1, 84
LDI r2, 76
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
