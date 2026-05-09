; DESCRIPTION: Composite: Renders a purple disk with center (405, 168) and radius 66 then Sets a single purple pixel at (138, 147).
; PLAN: r0=405(x), r1=168(y), r2=66(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=138(x), r6=147(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 405
LDI r1, 168
LDI r2, 66
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 138
LDI r6, 147
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
