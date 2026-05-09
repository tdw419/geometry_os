; DESCRIPTION: Places a black circle of radius 69 at center (100, 86).
; PLAN: r0=100(x), r1=86(y), r2=69(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 86
LDI r2, 69
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
