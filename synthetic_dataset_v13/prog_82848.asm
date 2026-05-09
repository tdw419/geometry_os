; DESCRIPTION: Composite: Sets a single yellow pixel at (145, 60) then Renders a yellow line between points (8, 133) and (86, 85).
; PLAN: r0=145(x), r1=60(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=8(x1), r6=133(y1), r7=86(x2), r8=85(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 145
LDI r1, 60
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 8
LDI r6, 133
LDI r7, 86
LDI r8, 85
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
