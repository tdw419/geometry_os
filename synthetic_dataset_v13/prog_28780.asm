; DESCRIPTION: Composite: Places a white line segment connecting (381, 99) to (81, 142) then Sets a single orange pixel at (226, 235).
; PLAN: r0=381(x1), r1=99(y1), r2=81(x2), r3=142(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=226(x), r6=235(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 381
LDI r1, 99
LDI r2, 81
LDI r3, 142
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 226
LDI r6, 235
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
