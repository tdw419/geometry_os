; DESCRIPTION: Composite: Sets a single magenta pixel at (355, 100) then Renders a magenta disk with center (183, 212) and radius 12.
; PLAN: r0=355(x), r1=100(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=183(x), r6=212(y), r7=12(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 355
LDI r1, 100
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 183
LDI r6, 212
LDI r7, 12
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
