; DESCRIPTION: Places a black line segment connecting (118, 147) to (106, 168).
; PLAN: r0=118(x1), r1=147(y1), r2=106(x2), r3=168(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 147
LDI r2, 106
LDI r3, 168
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
