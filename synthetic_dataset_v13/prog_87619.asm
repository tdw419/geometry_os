; DESCRIPTION: Composite: Sets a single red pixel at (49, 238) then Renders a red line between points (275, 208) and (468, 186).
; PLAN: r0=49(x), r1=238(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=275(x1), r6=208(y1), r7=468(x2), r8=186(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 49
LDI r1, 238
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 275
LDI r6, 208
LDI r7, 468
LDI r8, 186
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
