; DESCRIPTION: Composite: Places a black circle of radius 63 at center (95, 96) then Sets a single yellow pixel at (483, 215).
; PLAN: r0=95(x), r1=96(y), r2=63(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=483(x), r6=215(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 95
LDI r1, 96
LDI r2, 63
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 483
LDI r6, 215
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
