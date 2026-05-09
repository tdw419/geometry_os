; DESCRIPTION: Composite: Creates a blue circular shape at (374, 79) with radius 56 then Sets a single yellow pixel at (318, 58).
; PLAN: r0=374(x), r1=79(y), r2=56(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=318(x), r6=58(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 374
LDI r1, 79
LDI r2, 56
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 318
LDI r6, 58
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
