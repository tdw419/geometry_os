; DESCRIPTION: Composite: Draws a black circle centered at (251, 127) with radius 72 then Sets a single purple pixel at (20, 234).
; PLAN: r0=251(x), r1=127(y), r2=72(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=20(x), r6=234(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 251
LDI r1, 127
LDI r2, 72
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 20
LDI r6, 234
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
