; DESCRIPTION: Composite: Places a red line segment connecting (165, 120) to (118, 201) then Sets a single blue pixel at (270, 73).
; PLAN: r0=165(x1), r1=120(y1), r2=118(x2), r3=201(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=270(x), r6=73(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 165
LDI r1, 120
LDI r2, 118
LDI r3, 201
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 270
LDI r6, 73
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
