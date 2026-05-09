; DESCRIPTION: Renders a orange line between points (201, 177) and (115, 94).
; PLAN: r0=201(x1), r1=177(y1), r2=115(x2), r3=94(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 177
LDI r2, 115
LDI r3, 94
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
