; DESCRIPTION: Composite: Places a black circle of radius 80 at center (342, 89) then Sets a single purple pixel at (367, 175).
; PLAN: r0=342(x), r1=89(y), r2=80(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=367(x), r6=175(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 342
LDI r1, 89
LDI r2, 80
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 367
LDI r6, 175
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
