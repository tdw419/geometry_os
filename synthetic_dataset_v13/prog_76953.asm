; DESCRIPTION: Places a yellow circle of radius 63 at center (422, 74).
; PLAN: r0=422(x), r1=74(y), r2=63(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 422
LDI r1, 74
LDI r2, 63
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
