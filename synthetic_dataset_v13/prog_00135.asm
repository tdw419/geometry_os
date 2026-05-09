; DESCRIPTION: Composite: Draws a cyan circle centered at (65, 177) with radius 45 then Sets a single black pixel at (80, 73).
; PLAN: r0=65(x), r1=177(y), r2=45(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=80(x), r6=73(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 65
LDI r1, 177
LDI r2, 45
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 80
LDI r6, 73
LDI r7, 0x000000
PSET r5, r6, r7
HALT
