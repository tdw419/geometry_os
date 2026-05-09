; DESCRIPTION: Composite: Sets a single white pixel at (497, 129) then Renders a purple disk with center (249, 70) and radius 51.
; PLAN: r0=497(x), r1=129(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=249(x), r6=70(y), r7=51(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 497
LDI r1, 129
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 249
LDI r6, 70
LDI r7, 51
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
