; DESCRIPTION: Places a black circle of radius 23 at center (400, 73).
; PLAN: r0=400(x), r1=73(y), r2=23(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 400
LDI r1, 73
LDI r2, 23
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
