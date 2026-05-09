; DESCRIPTION: Places a black circle of radius 15 at center (45, 28).
; PLAN: r0=45(x), r1=28(y), r2=15(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 45
LDI r1, 28
LDI r2, 15
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
