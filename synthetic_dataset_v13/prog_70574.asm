; DESCRIPTION: Renders a green line between points (471, 34) and (94, 201).
; PLAN: r0=471(x1), r1=34(y1), r2=94(x2), r3=201(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 34
LDI r2, 94
LDI r3, 201
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
