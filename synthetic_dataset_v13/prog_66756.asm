; DESCRIPTION: Composite: Renders a blue line between points (235, 92) and (375, 3) then Sets a single purple pixel at (475, 78).
; PLAN: r0=235(x1), r1=92(y1), r2=375(x2), r3=3(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=475(x), r6=78(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 235
LDI r1, 92
LDI r2, 375
LDI r3, 3
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 475
LDI r6, 78
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
