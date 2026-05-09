; DESCRIPTION: Composite: Sets a single green pixel at (5, 94) then Draws a white line from (79, 235) to (291, 76).
; PLAN: r0=5(x), r1=94(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=79(x1), r6=235(y1), r7=291(x2), r8=76(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 5
LDI r1, 94
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 79
LDI r6, 235
LDI r7, 291
LDI r8, 76
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
