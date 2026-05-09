; DESCRIPTION: Composite: Sets a single blue pixel at (335, 90) then Places a orange line segment connecting (150, 47) to (118, 79).
; PLAN: r0=335(x), r1=90(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=150(x1), r6=47(y1), r7=118(x2), r8=79(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 335
LDI r1, 90
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 150
LDI r6, 47
LDI r7, 118
LDI r8, 79
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
