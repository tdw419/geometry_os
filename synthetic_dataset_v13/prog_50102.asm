; DESCRIPTION: Draws a black circle centered at (147, 131) with radius 49.
; PLAN: r0=147(x), r1=131(y), r2=49(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 131
LDI r2, 49
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
