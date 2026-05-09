; DESCRIPTION: Composite: Sets a single yellow pixel at (382, 75) then Renders a purple line between points (178, 139) and (20, 84).
; PLAN: r0=382(x), r1=75(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=178(x1), r6=139(y1), r7=20(x2), r8=84(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 382
LDI r1, 75
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 178
LDI r6, 139
LDI r7, 20
LDI r8, 84
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
