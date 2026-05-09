; DESCRIPTION: Places a black circle of radius 23 at center (293, 224).
; PLAN: r0=293(x), r1=224(y), r2=23(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 293
LDI r1, 224
LDI r2, 23
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
