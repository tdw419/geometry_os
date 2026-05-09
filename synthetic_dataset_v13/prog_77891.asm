; DESCRIPTION: Composite: Draws a purple circle centered at (55, 225) with radius 14 then Sets a single green pixel at (426, 177).
; PLAN: r0=55(x), r1=225(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=426(x), r6=177(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 55
LDI r1, 225
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 426
LDI r6, 177
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
