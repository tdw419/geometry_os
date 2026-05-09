; DESCRIPTION: Places a green line segment connecting (147, 190) to (5, 66).
; PLAN: r0=147(x1), r1=190(y1), r2=5(x2), r3=66(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 190
LDI r2, 5
LDI r3, 66
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
