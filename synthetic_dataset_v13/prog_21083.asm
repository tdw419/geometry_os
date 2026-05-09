; DESCRIPTION: Composite: Sets a single purple pixel at (142, 135) then Places a black circle of radius 78 at center (411, 131).
; PLAN: r0=142(x), r1=135(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=411(x), r6=131(y), r7=78(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 142
LDI r1, 135
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 411
LDI r6, 131
LDI r7, 78
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
