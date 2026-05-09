; DESCRIPTION: Composite: Draws a orange circle centered at (381, 142) with radius 55 then Sets a single magenta pixel at (218, 147).
; PLAN: r0=381(x), r1=142(y), r2=55(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=218(x), r6=147(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 381
LDI r1, 142
LDI r2, 55
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 218
LDI r6, 147
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
