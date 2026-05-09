; DESCRIPTION: Places a purple circle of radius 43 at center (313, 191).
; PLAN: r0=313(x), r1=191(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 313
LDI r1, 191
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
