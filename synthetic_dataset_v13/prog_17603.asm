; DESCRIPTION: Composite: Places a cyan line segment connecting (1, 147) to (373, 50) then Sets a single blue pixel at (431, 77).
; PLAN: r0=1(x1), r1=147(y1), r2=373(x2), r3=50(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=431(x), r6=77(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 1
LDI r1, 147
LDI r2, 373
LDI r3, 50
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 431
LDI r6, 77
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
