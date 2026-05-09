; DESCRIPTION: Creates a yellow circular shape at (163, 156) with radius 80.
; PLAN: r0=163(x), r1=156(y), r2=80(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 156
LDI r2, 80
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
