; DESCRIPTION: Places a black circle of radius 30 at center (222, 109).
; PLAN: r0=222(x), r1=109(y), r2=30(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 109
LDI r2, 30
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
