; DESCRIPTION: Composite: Places a magenta line segment connecting (78, 131) to (163, 89) then Sets a single black pixel at (256, 208).
; PLAN: r0=78(x1), r1=131(y1), r2=163(x2), r3=89(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=256(x), r6=208(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 78
LDI r1, 131
LDI r2, 163
LDI r3, 89
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 256
LDI r6, 208
LDI r7, 0x000000
PSET r5, r6, r7
HALT
