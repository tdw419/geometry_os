; DESCRIPTION: Composite: Sets a single yellow pixel at (96, 23) then Places a purple circle of radius 49 at center (94, 157).
; PLAN: r0=96(x), r1=23(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=94(x), r6=157(y), r7=49(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 96
LDI r1, 23
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 94
LDI r6, 157
LDI r7, 49
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
