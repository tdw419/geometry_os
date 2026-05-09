; DESCRIPTION: Composite: Places a purple dot at position (276, 160) then Places a yellow circle of radius 69 at center (341, 110).
; PLAN: r0=276(x), r1=160(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=341(x), r6=110(y), r7=69(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 276
LDI r1, 160
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 341
LDI r6, 110
LDI r7, 69
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
