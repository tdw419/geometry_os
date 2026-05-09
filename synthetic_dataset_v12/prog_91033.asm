; DESCRIPTION: Composite: Places a blue line segment connecting (433, 149) to (510, 112) then Sets a single black pixel at (36, 202).
; PLAN: r0=433(x1), r1=149(y1), r2=510(x2), r3=112(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=36(x), r6=202(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 433
LDI r1, 149
LDI r2, 510
LDI r3, 112
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 36
LDI r6, 202
LDI r7, 0x000000
PSET r5, r6, r7
HALT
