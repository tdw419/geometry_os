; DESCRIPTION: Composite: Sets a single black pixel at (89, 188) then Renders a purple line between points (96, 80) and (308, 255).
; PLAN: r0=89(x), r1=188(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=96(x1), r6=80(y1), r7=308(x2), r8=255(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 89
LDI r1, 188
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 96
LDI r6, 80
LDI r7, 308
LDI r8, 255
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
