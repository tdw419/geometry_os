; DESCRIPTION: Composite: Places a green circle of radius 18 at center (40, 222) then Sets a single yellow pixel at (454, 251).
; PLAN: r0=40(x), r1=222(y), r2=18(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=454(x), r6=251(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 40
LDI r1, 222
LDI r2, 18
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 454
LDI r6, 251
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
