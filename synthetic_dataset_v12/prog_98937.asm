; DESCRIPTION: Composite: Places a purple line segment connecting (130, 100) to (25, 39) then Sets a single yellow pixel at (23, 212).
; PLAN: r0=130(x1), r1=100(y1), r2=25(x2), r3=39(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=23(x), r6=212(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 130
LDI r1, 100
LDI r2, 25
LDI r3, 39
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 23
LDI r6, 212
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
