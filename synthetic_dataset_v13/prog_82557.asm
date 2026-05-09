; DESCRIPTION: Draws a black circle centered at (376, 131) with radius 62.
; PLAN: r0=376(x), r1=131(y), r2=62(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 376
LDI r1, 131
LDI r2, 62
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
