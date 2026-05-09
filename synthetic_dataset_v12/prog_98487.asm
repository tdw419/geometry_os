; DESCRIPTION: Composite: Renders a orange disk with center (462, 69) and radius 37 then Sets a single blue pixel at (436, 12).
; PLAN: r0=462(x), r1=69(y), r2=37(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=436(x), r6=12(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 462
LDI r1, 69
LDI r2, 37
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 436
LDI r6, 12
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
