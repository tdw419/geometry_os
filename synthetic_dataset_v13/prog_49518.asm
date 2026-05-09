; DESCRIPTION: Composite: Renders a magenta line between points (314, 191) and (319, 187) then Sets a single yellow pixel at (176, 12).
; PLAN: r0=314(x1), r1=191(y1), r2=319(x2), r3=187(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=176(x), r6=12(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 314
LDI r1, 191
LDI r2, 319
LDI r3, 187
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 176
LDI r6, 12
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
