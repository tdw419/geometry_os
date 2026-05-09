; DESCRIPTION: Renders a magenta line between points (411, 241) and (89, 129).
; PLAN: r0=411(x1), r1=241(y1), r2=89(x2), r3=129(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 241
LDI r2, 89
LDI r3, 129
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
