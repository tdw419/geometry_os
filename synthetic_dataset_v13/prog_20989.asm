; DESCRIPTION: Composite: Sets a single yellow pixel at (201, 34) then Places a yellow circle of radius 23 at center (135, 168).
; PLAN: r0=201(x), r1=34(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=135(x), r6=168(y), r7=23(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 201
LDI r1, 34
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 135
LDI r6, 168
LDI r7, 23
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
