; DESCRIPTION: Places a black circle of radius 19 at center (250, 21).
; PLAN: r0=250(x), r1=21(y), r2=19(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 250
LDI r1, 21
LDI r2, 19
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
