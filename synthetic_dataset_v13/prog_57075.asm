; DESCRIPTION: Composite: Sets a single green pixel at (65, 186) then Draws a white line from (164, 85) to (185, 51).
; PLAN: r0=65(x), r1=186(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=164(x1), r6=85(y1), r7=185(x2), r8=51(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 65
LDI r1, 186
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 164
LDI r6, 85
LDI r7, 185
LDI r8, 51
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
