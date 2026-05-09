; DESCRIPTION: Places a white line segment connecting (149, 159) to (147, 118).
; PLAN: r0=149(x1), r1=159(y1), r2=147(x2), r3=118(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 159
LDI r2, 147
LDI r3, 118
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
