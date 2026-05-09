; DESCRIPTION: Draws a black circle centered at (285, 89) with radius 61.
; PLAN: r0=285(x), r1=89(y), r2=61(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 285
LDI r1, 89
LDI r2, 61
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
