; DESCRIPTION: Composite: Places a cyan circle of radius 19 at center (159, 229) then Sets a single white pixel at (472, 96).
; PLAN: r0=159(x), r1=229(y), r2=19(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=472(x), r6=96(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 159
LDI r1, 229
LDI r2, 19
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 472
LDI r6, 96
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
