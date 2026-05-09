; DESCRIPTION: Places a yellow line segment connecting (190, 40) to (145, 207).
; PLAN: r0=190(x1), r1=40(y1), r2=145(x2), r3=207(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 40
LDI r2, 145
LDI r3, 207
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
