; DESCRIPTION: Renders a green line between points (40, 201) and (342, 211).
; PLAN: r0=40(x1), r1=201(y1), r2=342(x2), r3=211(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 201
LDI r2, 342
LDI r3, 211
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
