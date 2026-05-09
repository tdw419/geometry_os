; DESCRIPTION: Places a blue circle of radius 60 at center (293, 78).
; PLAN: r0=293(x), r1=78(y), r2=60(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 293
LDI r1, 78
LDI r2, 60
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
