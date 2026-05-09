; DESCRIPTION: Creates a cyan circular shape at (315, 156) with radius 76.
; PLAN: r0=315(x), r1=156(y), r2=76(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 315
LDI r1, 156
LDI r2, 76
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
