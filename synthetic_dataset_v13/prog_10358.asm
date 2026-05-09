; DESCRIPTION: Composite: Sets a single purple pixel at (45, 120) then Draws a red line from (289, 158) to (312, 52).
; PLAN: r0=45(x), r1=120(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=289(x1), r6=158(y1), r7=312(x2), r8=52(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 45
LDI r1, 120
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 289
LDI r6, 158
LDI r7, 312
LDI r8, 52
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
