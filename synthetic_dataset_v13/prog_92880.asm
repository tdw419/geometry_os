; DESCRIPTION: Places a black circle of radius 39 at center (230, 72).
; PLAN: r0=230(x), r1=72(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 230
LDI r1, 72
LDI r2, 39
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
