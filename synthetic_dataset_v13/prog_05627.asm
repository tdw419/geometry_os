; DESCRIPTION: Draws a purple circle centered at (422, 98) with radius 80.
; PLAN: r0=422(x), r1=98(y), r2=80(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 422
LDI r1, 98
LDI r2, 80
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
