; DESCRIPTION: Draws a black circle centered at (339, 92) with radius 57.
; PLAN: r0=339(x), r1=92(y), r2=57(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 92
LDI r2, 57
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
