; DESCRIPTION: Composite: Renders a black line between points (131, 190) and (399, 105) then Sets a single orange pixel at (415, 15).
; PLAN: r0=131(x1), r1=190(y1), r2=399(x2), r3=105(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=415(x), r6=15(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 131
LDI r1, 190
LDI r2, 399
LDI r3, 105
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 415
LDI r6, 15
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
