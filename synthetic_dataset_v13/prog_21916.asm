; DESCRIPTION: Places a orange line segment connecting (160, 190) to (163, 17).
; PLAN: r0=160(x1), r1=190(y1), r2=163(x2), r3=17(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 190
LDI r2, 163
LDI r3, 17
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
