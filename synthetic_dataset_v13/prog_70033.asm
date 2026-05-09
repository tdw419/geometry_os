; DESCRIPTION: Draws a black circle centered at (138, 131) with radius 72.
; PLAN: r0=138(x), r1=131(y), r2=72(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 131
LDI r2, 72
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
