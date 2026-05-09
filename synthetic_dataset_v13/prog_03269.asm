; DESCRIPTION: Composite: Draws a yellow circle centered at (424, 182) with radius 57 then Sets a single green pixel at (51, 56).
; PLAN: r0=424(x), r1=182(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=51(x), r6=56(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 424
LDI r1, 182
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 51
LDI r6, 56
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
