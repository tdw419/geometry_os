; DESCRIPTION: Composite: Places a black circle of radius 60 at center (347, 178) then Sets a single orange pixel at (319, 46).
; PLAN: r0=347(x), r1=178(y), r2=60(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=319(x), r6=46(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 347
LDI r1, 178
LDI r2, 60
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 319
LDI r6, 46
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
