; DESCRIPTION: Composite: Places a yellow circle of radius 67 at center (388, 85) then Places a purple dot at position (363, 185).
; PLAN: r0=388(x), r1=85(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=363(x), r6=185(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 388
LDI r1, 85
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 363
LDI r6, 185
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
