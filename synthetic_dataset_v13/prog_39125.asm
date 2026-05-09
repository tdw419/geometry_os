; DESCRIPTION: Places a black circle of radius 56 at center (370, 137).
; PLAN: r0=370(x), r1=137(y), r2=56(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 370
LDI r1, 137
LDI r2, 56
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
