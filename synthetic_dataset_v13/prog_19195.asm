; DESCRIPTION: Composite: Sets a single yellow pixel at (85, 52) then Renders a magenta disk with center (314, 131) and radius 45.
; PLAN: r0=85(x), r1=52(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=314(x), r6=131(y), r7=45(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 85
LDI r1, 52
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 314
LDI r6, 131
LDI r7, 45
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
