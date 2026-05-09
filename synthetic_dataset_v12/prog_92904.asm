; DESCRIPTION: Places a blue circle of radius 66 at center (201, 165).
; PLAN: r0=201(x), r1=165(y), r2=66(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 201
LDI r1, 165
LDI r2, 66
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
