; DESCRIPTION: Places a yellow line segment connecting (314, 190) to (442, 51).
; PLAN: r0=314(x1), r1=190(y1), r2=442(x2), r3=51(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 190
LDI r2, 442
LDI r3, 51
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
