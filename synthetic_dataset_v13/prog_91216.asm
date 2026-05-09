; DESCRIPTION: Composite: Sets a single magenta pixel at (95, 160) then Renders a orange line between points (483, 50) and (279, 72).
; PLAN: r0=95(x), r1=160(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=483(x1), r6=50(y1), r7=279(x2), r8=72(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 95
LDI r1, 160
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 483
LDI r6, 50
LDI r7, 279
LDI r8, 72
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
