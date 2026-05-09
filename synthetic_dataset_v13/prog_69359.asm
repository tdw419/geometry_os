; DESCRIPTION: Creates a purple circular shape at (354, 163) with radius 65.
; PLAN: r0=354(x), r1=163(y), r2=65(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 354
LDI r1, 163
LDI r2, 65
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
