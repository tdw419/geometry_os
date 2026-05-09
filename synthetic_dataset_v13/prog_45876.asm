; DESCRIPTION: Creates a cyan circular shape at (318, 157) with radius 80.
; PLAN: r0=318(x), r1=157(y), r2=80(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 318
LDI r1, 157
LDI r2, 80
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
