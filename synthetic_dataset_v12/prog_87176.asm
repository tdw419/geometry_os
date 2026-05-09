; DESCRIPTION: Renders a yellow line between points (140, 45) and (89, 227).
; PLAN: r0=140(x1), r1=45(y1), r2=89(x2), r3=227(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 45
LDI r2, 89
LDI r3, 227
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
