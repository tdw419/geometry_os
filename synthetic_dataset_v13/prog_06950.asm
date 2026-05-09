; DESCRIPTION: Composite: Places a purple line segment connecting (290, 202) to (263, 56) then Sets a single black pixel at (457, 110).
; PLAN: r0=290(x1), r1=202(y1), r2=263(x2), r3=56(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=457(x), r6=110(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 290
LDI r1, 202
LDI r2, 263
LDI r3, 56
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 457
LDI r6, 110
LDI r7, 0x000000
PSET r5, r6, r7
HALT
