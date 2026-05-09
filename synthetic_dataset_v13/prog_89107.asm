; DESCRIPTION: Composite: Places a blue line segment connecting (357, 32) to (55, 150) then Sets a single blue pixel at (466, 108).
; PLAN: r0=357(x1), r1=32(y1), r2=55(x2), r3=150(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=466(x), r6=108(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 357
LDI r1, 32
LDI r2, 55
LDI r3, 150
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 466
LDI r6, 108
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
