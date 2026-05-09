; DESCRIPTION: Composite: Places a magenta line segment connecting (146, 110) to (8, 101) then Sets a single yellow pixel at (109, 20).
; PLAN: r0=146(x1), r1=110(y1), r2=8(x2), r3=101(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=109(x), r6=20(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 146
LDI r1, 110
LDI r2, 8
LDI r3, 101
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 109
LDI r6, 20
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
