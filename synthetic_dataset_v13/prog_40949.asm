; DESCRIPTION: Composite: Places a white circle of radius 62 at center (319, 147) then Sets a single orange pixel at (455, 115).
; PLAN: r0=319(x), r1=147(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=455(x), r6=115(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 319
LDI r1, 147
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 455
LDI r6, 115
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
