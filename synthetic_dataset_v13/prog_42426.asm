; DESCRIPTION: Composite: Places a cyan dot at position (369, 230) then Draws a cyan line from (20, 179) to (238, 185).
; PLAN: r0=369(x), r1=230(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=20(x1), r6=179(y1), r7=238(x2), r8=185(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 369
LDI r1, 230
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 20
LDI r6, 179
LDI r7, 238
LDI r8, 185
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
