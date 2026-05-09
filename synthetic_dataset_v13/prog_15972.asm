; DESCRIPTION: Composite: Creates a orange circular shape at (461, 212) with radius 34 then Sets a single green pixel at (72, 17).
; PLAN: r0=461(x), r1=212(y), r2=34(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=72(x), r6=17(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 461
LDI r1, 212
LDI r2, 34
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 72
LDI r6, 17
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
