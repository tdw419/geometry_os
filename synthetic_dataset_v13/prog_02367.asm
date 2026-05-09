; DESCRIPTION: Creates a cyan circular shape at (200, 157) with radius 22.
; PLAN: r0=200(x), r1=157(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 157
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
