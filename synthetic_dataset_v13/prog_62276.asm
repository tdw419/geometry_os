; DESCRIPTION: Composite: Places a white line segment connecting (324, 235) to (420, 180) then Sets a single yellow pixel at (131, 179).
; PLAN: r0=324(x1), r1=235(y1), r2=420(x2), r3=180(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=131(x), r6=179(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 324
LDI r1, 235
LDI r2, 420
LDI r3, 180
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 131
LDI r6, 179
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
