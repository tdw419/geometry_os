; DESCRIPTION: Composite: Places a magenta dot at position (315, 147) then Renders a red line between points (462, 216) and (396, 139).
; PLAN: r0=315(x), r1=147(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=462(x1), r6=216(y1), r7=396(x2), r8=139(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 315
LDI r1, 147
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 462
LDI r6, 216
LDI r7, 396
LDI r8, 139
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
