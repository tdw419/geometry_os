; DESCRIPTION: Composite: Creates a purple circular shape at (266, 85) with radius 76 then Sets a single yellow pixel at (328, 125).
; PLAN: r0=266(x), r1=85(y), r2=76(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=328(x), r6=125(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 266
LDI r1, 85
LDI r2, 76
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 328
LDI r6, 125
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
