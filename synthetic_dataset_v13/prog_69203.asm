; DESCRIPTION: Draws a black circle centered at (177, 95) with radius 17.
; PLAN: r0=177(x), r1=95(y), r2=17(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 95
LDI r2, 17
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
