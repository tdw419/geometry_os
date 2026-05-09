; DESCRIPTION: Composite: Draws a cyan circle centered at (224, 140) with radius 71 then Sets a single yellow pixel at (194, 78).
; PLAN: r0=224(x), r1=140(y), r2=71(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=194(x), r6=78(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 224
LDI r1, 140
LDI r2, 71
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 194
LDI r6, 78
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
