; DESCRIPTION: Composite: Renders a magenta line between points (85, 13) and (462, 232) then Sets a single yellow pixel at (411, 123).
; PLAN: r0=85(x1), r1=13(y1), r2=462(x2), r3=232(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=411(x), r6=123(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 85
LDI r1, 13
LDI r2, 462
LDI r3, 232
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 411
LDI r6, 123
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
