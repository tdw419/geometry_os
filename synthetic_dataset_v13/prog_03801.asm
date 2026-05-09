; DESCRIPTION: Composite: Places a black circle of radius 17 at center (178, 112) then Sets a single green pixel at (68, 95).
; PLAN: r0=178(x), r1=112(y), r2=17(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=68(x), r6=95(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 178
LDI r1, 112
LDI r2, 17
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 68
LDI r6, 95
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
