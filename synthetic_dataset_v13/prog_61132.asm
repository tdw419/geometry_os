; DESCRIPTION: Composite: Sets a single black pixel at (235, 52) then Draws a cyan circle centered at (407, 162) with radius 25.
; PLAN: r0=235(x), r1=52(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=407(x), r6=162(y), r7=25(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 235
LDI r1, 52
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 407
LDI r6, 162
LDI r7, 25
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
