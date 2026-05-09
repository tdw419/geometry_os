; DESCRIPTION: Composite: Draws a purple circle centered at (79, 107) with radius 49 then Sets a single green pixel at (211, 226).
; PLAN: r0=79(x), r1=107(y), r2=49(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=211(x), r6=226(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 79
LDI r1, 107
LDI r2, 49
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 211
LDI r6, 226
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
