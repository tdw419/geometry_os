; DESCRIPTION: Composite: Places a yellow circle of radius 73 at center (235, 160) then Sets a single yellow pixel at (136, 182).
; PLAN: r0=235(x), r1=160(y), r2=73(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=136(x), r6=182(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 235
LDI r1, 160
LDI r2, 73
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 136
LDI r6, 182
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
