; DESCRIPTION: Composite: Sets a single green pixel at (278, 109) then Draws a white line from (136, 163) to (432, 230).
; PLAN: r0=278(x), r1=109(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=136(x1), r6=163(y1), r7=432(x2), r8=230(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 278
LDI r1, 109
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 136
LDI r6, 163
LDI r7, 432
LDI r8, 230
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
