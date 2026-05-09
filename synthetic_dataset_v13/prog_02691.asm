; DESCRIPTION: Composite: Creates a black circular shape at (385, 174) with radius 45 then Sets a single cyan pixel at (256, 66).
; PLAN: r0=385(x), r1=174(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=256(x), r6=66(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 385
LDI r1, 174
LDI r2, 45
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 256
LDI r6, 66
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
