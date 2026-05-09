; DESCRIPTION: Places a green line segment connecting (227, 147) to (190, 124).
; PLAN: r0=227(x1), r1=147(y1), r2=190(x2), r3=124(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 147
LDI r2, 190
LDI r3, 124
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
