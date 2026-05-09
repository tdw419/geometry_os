; DESCRIPTION: Places a yellow line segment connecting (141, 89) to (211, 141).
; PLAN: r0=141(x1), r1=89(y1), r2=211(x2), r3=141(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 89
LDI r2, 211
LDI r3, 141
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
