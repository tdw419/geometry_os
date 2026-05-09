; DESCRIPTION: Composite: Places a white line segment connecting (314, 22) to (148, 57) then Sets a single blue pixel at (394, 132).
; PLAN: r0=314(x1), r1=22(y1), r2=148(x2), r3=57(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=394(x), r6=132(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 314
LDI r1, 22
LDI r2, 148
LDI r3, 57
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 394
LDI r6, 132
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
