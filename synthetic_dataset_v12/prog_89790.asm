; DESCRIPTION: Creates a purple circular shape at (201, 129) with radius 48.
; PLAN: r0=201(x), r1=129(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 201
LDI r1, 129
LDI r2, 48
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
