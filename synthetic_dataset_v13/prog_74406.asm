; DESCRIPTION: Composite: Sets a single blue pixel at (171, 254) then Places a green circle of radius 51 at center (79, 110).
; PLAN: r0=171(x), r1=254(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=79(x), r6=110(y), r7=51(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 171
LDI r1, 254
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 79
LDI r6, 110
LDI r7, 51
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
