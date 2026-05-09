; DESCRIPTION: Composite: Sets a single green pixel at (5, 163) then Draws a black line from (109, 12) to (158, 105).
; PLAN: r0=5(x), r1=163(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=109(x1), r6=12(y1), r7=158(x2), r8=105(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 5
LDI r1, 163
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 109
LDI r6, 12
LDI r7, 158
LDI r8, 105
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
