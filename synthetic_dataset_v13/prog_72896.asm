; DESCRIPTION: Creates a yellow circular shape at (297, 76) with radius 21.
; PLAN: r0=297(x), r1=76(y), r2=21(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 297
LDI r1, 76
LDI r2, 21
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
