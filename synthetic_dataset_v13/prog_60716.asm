; DESCRIPTION: Composite: Renders a blue disk with center (53, 179) and radius 37 then Sets a single black pixel at (415, 233).
; PLAN: r0=53(x), r1=179(y), r2=37(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=415(x), r6=233(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 53
LDI r1, 179
LDI r2, 37
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 415
LDI r6, 233
LDI r7, 0x000000
PSET r5, r6, r7
HALT
