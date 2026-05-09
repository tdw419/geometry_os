; DESCRIPTION: Composite: Sets a single purple pixel at (159, 254) then Draws a purple circle centered at (110, 214) with radius 13.
; PLAN: r0=159(x), r1=254(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=110(x), r6=214(y), r7=13(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 159
LDI r1, 254
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 110
LDI r6, 214
LDI r7, 13
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
