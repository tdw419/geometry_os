; DESCRIPTION: Composite: Draws a cyan circle centered at (357, 156) with radius 19 then Sets a single cyan pixel at (214, 188).
; PLAN: r0=357(x), r1=156(y), r2=19(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=214(x), r6=188(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 357
LDI r1, 156
LDI r2, 19
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 214
LDI r6, 188
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
