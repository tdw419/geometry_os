; DESCRIPTION: Places a green circle of radius 20 at center (422, 208).
; PLAN: r0=422(x), r1=208(y), r2=20(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 422
LDI r1, 208
LDI r2, 20
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
