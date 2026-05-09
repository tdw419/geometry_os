; DESCRIPTION: Creates a magenta circular shape at (418, 119) with radius 55.
; PLAN: r0=418(x), r1=119(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 119
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
