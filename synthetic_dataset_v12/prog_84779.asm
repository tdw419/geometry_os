; DESCRIPTION: Composite: Draws a purple circle centered at (352, 94) with radius 72 then Sets a single green pixel at (371, 107).
; PLAN: r0=352(x), r1=94(y), r2=72(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=371(x), r6=107(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 352
LDI r1, 94
LDI r2, 72
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 371
LDI r6, 107
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
