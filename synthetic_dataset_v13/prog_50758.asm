; DESCRIPTION: Creates a green circular shape at (139, 179) with radius 59.
; PLAN: r0=139(x), r1=179(y), r2=59(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 179
LDI r2, 59
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
