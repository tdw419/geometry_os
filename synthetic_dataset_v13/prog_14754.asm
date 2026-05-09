; DESCRIPTION: Creates a cyan circular shape at (126, 139) with radius 31.
; PLAN: r0=126(x), r1=139(y), r2=31(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 139
LDI r2, 31
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
