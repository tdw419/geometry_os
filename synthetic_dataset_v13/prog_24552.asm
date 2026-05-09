; DESCRIPTION: Composite: Sets a single yellow pixel at (5, 190) then Renders a purple disk with center (381, 61) and radius 42.
; PLAN: r0=5(x), r1=190(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=381(x), r6=61(y), r7=42(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 5
LDI r1, 190
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 381
LDI r6, 61
LDI r7, 42
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
