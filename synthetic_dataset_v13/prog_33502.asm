; DESCRIPTION: Composite: Renders a purple disk with center (295, 126) and radius 34 then Sets a single yellow pixel at (87, 27).
; PLAN: r0=295(x), r1=126(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=87(x), r6=27(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 295
LDI r1, 126
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 87
LDI r6, 27
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
