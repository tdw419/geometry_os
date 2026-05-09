; DESCRIPTION: Composite: Draws a blue circle centered at (286, 171) with radius 40 then Sets a single green pixel at (418, 179).
; PLAN: r0=286(x), r1=171(y), r2=40(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=418(x), r6=179(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 286
LDI r1, 171
LDI r2, 40
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 418
LDI r6, 179
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
