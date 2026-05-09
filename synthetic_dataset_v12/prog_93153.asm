; DESCRIPTION: Places a black circle of radius 72 at center (374, 142).
; PLAN: r0=374(x), r1=142(y), r2=72(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 374
LDI r1, 142
LDI r2, 72
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
