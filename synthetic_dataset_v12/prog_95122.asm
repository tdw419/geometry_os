; DESCRIPTION: Composite: Draws a cyan circle centered at (264, 190) with radius 56 then Sets a single green pixel at (216, 157).
; PLAN: r0=264(x), r1=190(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=216(x), r6=157(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 264
LDI r1, 190
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 216
LDI r6, 157
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
