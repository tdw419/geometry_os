; DESCRIPTION: Composite: Draws a green circle centered at (371, 72) with radius 55 then Sets a single green pixel at (453, 19).
; PLAN: r0=371(x), r1=72(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=453(x), r6=19(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 371
LDI r1, 72
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 453
LDI r6, 19
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
