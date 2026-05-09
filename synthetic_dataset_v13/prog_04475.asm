; DESCRIPTION: Composite: Sets a single white pixel at (41, 150) then Renders a red line between points (323, 53) and (319, 34).
; PLAN: r0=41(x), r1=150(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=323(x1), r6=53(y1), r7=319(x2), r8=34(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 41
LDI r1, 150
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 323
LDI r6, 53
LDI r7, 319
LDI r8, 34
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
