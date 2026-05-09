; DESCRIPTION: Composite: Sets a single purple pixel at (356, 65) then Renders a red line between points (80, 212) and (258, 130).
; PLAN: r0=356(x), r1=65(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=80(x1), r6=212(y1), r7=258(x2), r8=130(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 356
LDI r1, 65
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 80
LDI r6, 212
LDI r7, 258
LDI r8, 130
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
