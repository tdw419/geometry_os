; DESCRIPTION: Creates a yellow circular shape at (104, 156) with radius 31.
; PLAN: r0=104(x), r1=156(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 156
LDI r2, 31
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
