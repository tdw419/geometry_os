; DESCRIPTION: Composite: Sets a single black pixel at (14, 63) then Renders a red line between points (173, 190) and (414, 80).
; PLAN: r0=14(x), r1=63(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=173(x1), r6=190(y1), r7=414(x2), r8=80(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 14
LDI r1, 63
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 173
LDI r6, 190
LDI r7, 414
LDI r8, 80
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
