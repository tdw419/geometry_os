; DESCRIPTION: Creates a yellow circular shape at (98, 89) with radius 56.
; PLAN: r0=98(x), r1=89(y), r2=56(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 89
LDI r2, 56
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
