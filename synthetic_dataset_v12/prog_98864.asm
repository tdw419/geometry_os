; DESCRIPTION: Composite: Sets a single yellow pixel at (93, 92) then Renders a blue line between points (194, 94) and (20, 220).
; PLAN: r0=93(x), r1=92(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=194(x1), r6=94(y1), r7=20(x2), r8=220(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 93
LDI r1, 92
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 194
LDI r6, 94
LDI r7, 20
LDI r8, 220
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
