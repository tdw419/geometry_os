; DESCRIPTION: Places a black circle of radius 15 at center (287, 49).
; PLAN: r0=287(x), r1=49(y), r2=15(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 287
LDI r1, 49
LDI r2, 15
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
