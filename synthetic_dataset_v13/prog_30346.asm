; DESCRIPTION: Composite: Draws a blue circle centered at (142, 104) with radius 80 then Sets a single yellow pixel at (259, 119).
; PLAN: r0=142(x), r1=104(y), r2=80(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=259(x), r6=119(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 142
LDI r1, 104
LDI r2, 80
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 259
LDI r6, 119
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
