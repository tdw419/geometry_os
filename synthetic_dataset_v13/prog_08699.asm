; DESCRIPTION: Draws a black circle centered at (335, 108) with radius 71.
; PLAN: r0=335(x), r1=108(y), r2=71(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 335
LDI r1, 108
LDI r2, 71
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
