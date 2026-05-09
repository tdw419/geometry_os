; DESCRIPTION: Creates a purple circular shape at (357, 163) with radius 55.
; PLAN: r0=357(x), r1=163(y), r2=55(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 357
LDI r1, 163
LDI r2, 55
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
