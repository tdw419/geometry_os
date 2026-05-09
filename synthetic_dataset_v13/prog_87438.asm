; DESCRIPTION: Creates a yellow circular shape at (297, 72) with radius 33.
; PLAN: r0=297(x), r1=72(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 297
LDI r1, 72
LDI r2, 33
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
