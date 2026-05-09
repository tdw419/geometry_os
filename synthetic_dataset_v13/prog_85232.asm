; DESCRIPTION: Composite: Sets a single black pixel at (461, 68) then Draws a black circle centered at (410, 104) with radius 13.
; PLAN: r0=461(x), r1=68(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=410(x), r6=104(y), r7=13(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 461
LDI r1, 68
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 410
LDI r6, 104
LDI r7, 13
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
