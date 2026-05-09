; DESCRIPTION: Composite: Sets a single magenta pixel at (39, 119) then Renders a magenta disk with center (179, 116) and radius 51.
; PLAN: r0=39(x), r1=119(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=179(x), r6=116(y), r7=51(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 39
LDI r1, 119
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 179
LDI r6, 116
LDI r7, 51
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
