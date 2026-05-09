; DESCRIPTION: Composite: Sets a single purple pixel at (458, 158) then Renders a red line between points (495, 59) and (179, 160).
; PLAN: r0=458(x), r1=158(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=495(x1), r6=59(y1), r7=179(x2), r8=160(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 458
LDI r1, 158
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 495
LDI r6, 59
LDI r7, 179
LDI r8, 160
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
