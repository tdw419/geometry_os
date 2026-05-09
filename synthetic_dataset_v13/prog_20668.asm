; DESCRIPTION: Creates a yellow circular shape at (358, 156) with radius 57.
; PLAN: r0=358(x), r1=156(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 358
LDI r1, 156
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
