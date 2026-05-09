; DESCRIPTION: Composite: Sets a single blue pixel at (448, 124) then Renders a orange line between points (106, 149) and (394, 153).
; PLAN: r0=448(x), r1=124(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=106(x1), r6=149(y1), r7=394(x2), r8=153(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 448
LDI r1, 124
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 106
LDI r6, 149
LDI r7, 394
LDI r8, 153
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
