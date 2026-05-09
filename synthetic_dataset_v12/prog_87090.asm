; DESCRIPTION: Places a black circle of radius 23 at center (130, 200).
; PLAN: r0=130(x), r1=200(y), r2=23(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 200
LDI r2, 23
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
