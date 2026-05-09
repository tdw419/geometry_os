; DESCRIPTION: Composite: Places a black circle of radius 14 at center (46, 165) then Sets a single orange pixel at (56, 240).
; PLAN: r0=46(x), r1=165(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=56(x), r6=240(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 46
LDI r1, 165
LDI r2, 14
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 56
LDI r6, 240
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
