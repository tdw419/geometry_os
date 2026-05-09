; DESCRIPTION: Composite: Creates a red circular shape at (200, 163) with radius 26 then Sets a single green pixel at (0, 249).
; PLAN: r0=200(x), r1=163(y), r2=26(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=0(x), r6=249(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 200
LDI r1, 163
LDI r2, 26
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 0
LDI r6, 249
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
