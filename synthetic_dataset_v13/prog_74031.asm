; DESCRIPTION: Composite: Places a cyan circle of radius 48 at center (112, 114) then Sets a single black pixel at (17, 233).
; PLAN: r0=112(x), r1=114(y), r2=48(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=17(x), r6=233(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 112
LDI r1, 114
LDI r2, 48
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 17
LDI r6, 233
LDI r7, 0x000000
PSET r5, r6, r7
HALT
