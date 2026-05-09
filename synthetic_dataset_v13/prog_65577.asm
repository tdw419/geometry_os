; DESCRIPTION: Creates a purple circular shape at (375, 45) with radius 44.
; PLAN: r0=375(x), r1=45(y), r2=44(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 375
LDI r1, 45
LDI r2, 44
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
