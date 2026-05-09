; DESCRIPTION: Composite: Renders a purple disk with center (100, 90) and radius 41 then Sets a single yellow pixel at (367, 215).
; PLAN: r0=100(x), r1=90(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=367(x), r6=215(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 100
LDI r1, 90
LDI r2, 41
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 367
LDI r6, 215
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
