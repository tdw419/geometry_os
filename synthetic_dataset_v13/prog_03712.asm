; DESCRIPTION: Draws a black circle centered at (469, 131) with radius 11.
; PLAN: r0=469(x), r1=131(y), r2=11(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 469
LDI r1, 131
LDI r2, 11
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
