; DESCRIPTION: Places a black circle of radius 23 at center (324, 109).
; PLAN: r0=324(x), r1=109(y), r2=23(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 324
LDI r1, 109
LDI r2, 23
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
