; DESCRIPTION: Composite: Places a white line segment connecting (286, 64) to (81, 110) then Sets a single orange pixel at (251, 149).
; PLAN: r0=286(x1), r1=64(y1), r2=81(x2), r3=110(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=251(x), r6=149(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 286
LDI r1, 64
LDI r2, 81
LDI r3, 110
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 251
LDI r6, 149
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
