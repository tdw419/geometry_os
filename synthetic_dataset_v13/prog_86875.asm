; DESCRIPTION: Composite: Renders a green line between points (308, 77) and (132, 61) then Sets a single orange pixel at (177, 235).
; PLAN: r0=308(x1), r1=77(y1), r2=132(x2), r3=61(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=177(x), r6=235(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 308
LDI r1, 77
LDI r2, 132
LDI r3, 61
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 177
LDI r6, 235
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
