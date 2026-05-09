; DESCRIPTION: Composite: Sets a single red pixel at (276, 60) then Renders a red line between points (507, 251) and (504, 185).
; PLAN: r0=276(x), r1=60(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=507(x1), r6=251(y1), r7=504(x2), r8=185(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 276
LDI r1, 60
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 507
LDI r6, 251
LDI r7, 504
LDI r8, 185
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
