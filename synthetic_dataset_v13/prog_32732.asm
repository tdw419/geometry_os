; DESCRIPTION: Places a black circle of radius 34 at center (310, 44).
; PLAN: r0=310(x), r1=44(y), r2=34(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 310
LDI r1, 44
LDI r2, 34
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
