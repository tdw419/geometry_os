; DESCRIPTION: Composite: Renders a magenta line between points (130, 232) and (467, 5) then Sets a single yellow pixel at (249, 110).
; PLAN: r0=130(x1), r1=232(y1), r2=467(x2), r3=5(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=249(x), r6=110(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 130
LDI r1, 232
LDI r2, 467
LDI r3, 5
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 249
LDI r6, 110
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
