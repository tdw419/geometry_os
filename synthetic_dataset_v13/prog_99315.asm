; DESCRIPTION: Composite: Sets a single yellow pixel at (437, 235) then Places a white circle of radius 31 at center (356, 74).
; PLAN: r0=437(x), r1=235(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=356(x), r6=74(y), r7=31(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 437
LDI r1, 235
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 356
LDI r6, 74
LDI r7, 31
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
