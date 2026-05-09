; DESCRIPTION: Composite: Sets a single green pixel at (356, 170) then Draws a black circle centered at (235, 149) with radius 76.
; PLAN: r0=356(x), r1=170(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=235(x), r6=149(y), r7=76(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 356
LDI r1, 170
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 235
LDI r6, 149
LDI r7, 76
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
