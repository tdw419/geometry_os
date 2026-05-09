; DESCRIPTION: Places a black circle of radius 17 at center (99, 37).
; PLAN: r0=99(x), r1=37(y), r2=17(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 37
LDI r2, 17
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
