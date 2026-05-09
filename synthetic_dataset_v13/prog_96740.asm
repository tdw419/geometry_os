; DESCRIPTION: Composite: Sets a single blue pixel at (39, 79) then Places a purple circle of radius 25 at center (117, 94).
; PLAN: r0=39(x), r1=79(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=117(x), r6=94(y), r7=25(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 39
LDI r1, 79
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 117
LDI r6, 94
LDI r7, 25
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
