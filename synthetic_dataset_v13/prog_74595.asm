; DESCRIPTION: Places a blue circle of radius 34 at center (124, 160).
; PLAN: r0=124(x), r1=160(y), r2=34(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 160
LDI r2, 34
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
