; DESCRIPTION: Composite: Renders a orange disk with center (436, 59) and radius 46 then Sets a single red pixel at (402, 211).
; PLAN: r0=436(x), r1=59(y), r2=46(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=402(x), r6=211(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 436
LDI r1, 59
LDI r2, 46
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 402
LDI r6, 211
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
