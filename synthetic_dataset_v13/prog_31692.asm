; DESCRIPTION: Composite: Sets a single purple pixel at (400, 206) then Creates a black circular shape at (449, 96) with radius 60.
; PLAN: r0=400(x), r1=206(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=449(x), r6=96(y), r7=60(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 400
LDI r1, 206
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 449
LDI r6, 96
LDI r7, 60
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
