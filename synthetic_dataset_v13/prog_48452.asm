; DESCRIPTION: Composite: Places a purple circle of radius 66 at center (374, 157) then Sets a single magenta pixel at (358, 241).
; PLAN: r0=374(x), r1=157(y), r2=66(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=358(x), r6=241(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 374
LDI r1, 157
LDI r2, 66
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 358
LDI r6, 241
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
