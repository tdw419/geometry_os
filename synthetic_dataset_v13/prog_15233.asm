; DESCRIPTION: Composite: Renders a purple disk with center (395, 166) and radius 34 then Sets a single green pixel at (342, 19).
; PLAN: r0=395(x), r1=166(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=342(x), r6=19(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 395
LDI r1, 166
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 342
LDI r6, 19
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
