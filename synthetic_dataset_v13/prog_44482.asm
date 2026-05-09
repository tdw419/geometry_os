; DESCRIPTION: Places a yellow line segment connecting (453, 3) to (89, 188).
; PLAN: r0=453(x1), r1=3(y1), r2=89(x2), r3=188(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 3
LDI r2, 89
LDI r3, 188
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
