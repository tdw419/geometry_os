; DESCRIPTION: Draws a black circle centered at (116, 147) with radius 72.
; PLAN: r0=116(x), r1=147(y), r2=72(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 147
LDI r2, 72
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
