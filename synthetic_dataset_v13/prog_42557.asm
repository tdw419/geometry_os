; DESCRIPTION: Composite: Places a purple line segment connecting (63, 22) to (477, 166) then Sets a single blue pixel at (92, 188).
; PLAN: r0=63(x1), r1=22(y1), r2=477(x2), r3=166(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=92(x), r6=188(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 63
LDI r1, 22
LDI r2, 477
LDI r3, 166
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 92
LDI r6, 188
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
