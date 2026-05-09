; DESCRIPTION: Composite: Places a red line segment connecting (450, 201) to (391, 92) then Sets a single magenta pixel at (164, 220).
; PLAN: r0=450(x1), r1=201(y1), r2=391(x2), r3=92(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=164(x), r6=220(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 450
LDI r1, 201
LDI r2, 391
LDI r3, 92
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 164
LDI r6, 220
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
