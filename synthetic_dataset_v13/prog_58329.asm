; DESCRIPTION: Composite: Places a purple dot at position (199, 125) then Draws a black circle centered at (189, 110) with radius 55.
; PLAN: r0=199(x), r1=125(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=189(x), r6=110(y), r7=55(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 199
LDI r1, 125
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 189
LDI r6, 110
LDI r7, 55
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
