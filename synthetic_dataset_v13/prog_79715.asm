; DESCRIPTION: Creates a cyan circular shape at (119, 199) with radius 54.
; PLAN: r0=119(x), r1=199(y), r2=54(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 199
LDI r2, 54
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
