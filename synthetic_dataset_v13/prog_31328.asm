; DESCRIPTION: Composite: Draws a orange circle centered at (90, 234) with radius 20 then Sets a single blue pixel at (478, 95).
; PLAN: r0=90(x), r1=234(y), r2=20(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=478(x), r6=95(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 90
LDI r1, 234
LDI r2, 20
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 478
LDI r6, 95
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
