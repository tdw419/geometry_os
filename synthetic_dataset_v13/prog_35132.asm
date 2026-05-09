; DESCRIPTION: Places a blue circle of radius 63 at center (422, 168).
; PLAN: r0=422(x), r1=168(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 422
LDI r1, 168
LDI r2, 63
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
