; DESCRIPTION: Composite: Places a yellow dot at position (306, 112) then Draws a purple line from (225, 74) to (139, 14).
; PLAN: r0=306(x), r1=112(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=225(x1), r6=74(y1), r7=139(x2), r8=14(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 306
LDI r1, 112
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 225
LDI r6, 74
LDI r7, 139
LDI r8, 14
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
