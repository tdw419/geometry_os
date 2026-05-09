; DESCRIPTION: Composite: Renders a black disk with center (347, 121) and radius 53 then Sets a single cyan pixel at (493, 205).
; PLAN: r0=347(x), r1=121(y), r2=53(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=493(x), r6=205(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 347
LDI r1, 121
LDI r2, 53
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 493
LDI r6, 205
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
