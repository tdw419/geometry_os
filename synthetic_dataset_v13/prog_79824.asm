; DESCRIPTION: Places a black circle of radius 36 at center (322, 72).
; PLAN: r0=322(x), r1=72(y), r2=36(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 322
LDI r1, 72
LDI r2, 36
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
