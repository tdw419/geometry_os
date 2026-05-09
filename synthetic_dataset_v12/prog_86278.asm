; DESCRIPTION: Places a black circle of radius 39 at center (364, 44).
; PLAN: r0=364(x), r1=44(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 364
LDI r1, 44
LDI r2, 39
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
