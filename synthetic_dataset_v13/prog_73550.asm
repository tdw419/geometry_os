; DESCRIPTION: Places a purple circle of radius 17 at center (275, 191).
; PLAN: r0=275(x), r1=191(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 275
LDI r1, 191
LDI r2, 17
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
