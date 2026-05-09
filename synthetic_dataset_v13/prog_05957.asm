; DESCRIPTION: Composite: Sets a single black pixel at (378, 250) then Draws a white line from (98, 134) to (217, 86).
; PLAN: r0=378(x), r1=250(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=98(x1), r6=134(y1), r7=217(x2), r8=86(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 378
LDI r1, 250
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 98
LDI r6, 134
LDI r7, 217
LDI r8, 86
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
