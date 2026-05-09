; DESCRIPTION: Places a black circle of radius 56 at center (200, 84).
; PLAN: r0=200(x), r1=84(y), r2=56(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 84
LDI r2, 56
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
