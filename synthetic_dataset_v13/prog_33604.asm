; DESCRIPTION: Renders a black line between points (241, 201) and (139, 10).
; PLAN: r0=241(x1), r1=201(y1), r2=139(x2), r3=10(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 201
LDI r2, 139
LDI r3, 10
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
