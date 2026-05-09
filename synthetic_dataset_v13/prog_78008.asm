; DESCRIPTION: Draws a black circle centered at (368, 92) with radius 74.
; PLAN: r0=368(x), r1=92(y), r2=74(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 368
LDI r1, 92
LDI r2, 74
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
