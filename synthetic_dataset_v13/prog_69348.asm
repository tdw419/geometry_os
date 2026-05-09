; DESCRIPTION: Composite: Places a yellow dot at position (238, 216) then Draws a cyan line from (348, 90) to (316, 0).
; PLAN: r0=238(x), r1=216(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=348(x1), r6=90(y1), r7=316(x2), r8=0(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 238
LDI r1, 216
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 348
LDI r6, 90
LDI r7, 316
LDI r8, 0
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
