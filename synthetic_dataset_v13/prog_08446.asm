; DESCRIPTION: Composite: Sets a single red pixel at (475, 249) then Renders a black line between points (468, 125) and (357, 61).
; PLAN: r0=475(x), r1=249(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=468(x1), r6=125(y1), r7=357(x2), r8=61(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 475
LDI r1, 249
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 468
LDI r6, 125
LDI r7, 357
LDI r8, 61
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
