; DESCRIPTION: Places a black circle of radius 58 at center (362, 72).
; PLAN: r0=362(x), r1=72(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 362
LDI r1, 72
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
