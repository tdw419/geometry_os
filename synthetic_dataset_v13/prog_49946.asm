; DESCRIPTION: Composite: Draws a magenta line from (230, 147) to (162, 29) then Sets a single orange pixel at (106, 109).
; PLAN: r0=230(x1), r1=147(y1), r2=162(x2), r3=29(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=106(x), r6=109(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 230
LDI r1, 147
LDI r2, 162
LDI r3, 29
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 106
LDI r6, 109
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
