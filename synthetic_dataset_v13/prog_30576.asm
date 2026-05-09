; DESCRIPTION: Draws a black circle centered at (90, 169) with radius 71.
; PLAN: r0=90(x), r1=169(y), r2=71(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 169
LDI r2, 71
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
