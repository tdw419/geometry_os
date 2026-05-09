; DESCRIPTION: Composite: Sets a single purple pixel at (172, 142) then Draws a white line from (455, 0) to (251, 170).
; PLAN: r0=172(x), r1=142(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=455(x1), r6=0(y1), r7=251(x2), r8=170(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 172
LDI r1, 142
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 455
LDI r6, 0
LDI r7, 251
LDI r8, 170
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
