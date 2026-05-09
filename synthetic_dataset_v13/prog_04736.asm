; DESCRIPTION: Places a green circle of radius 58 at center (422, 135).
; PLAN: r0=422(x), r1=135(y), r2=58(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 422
LDI r1, 135
LDI r2, 58
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
