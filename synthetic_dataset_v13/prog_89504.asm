; DESCRIPTION: Renders a orange line between points (177, 29) and (361, 201).
; PLAN: r0=177(x1), r1=29(y1), r2=361(x2), r3=201(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 29
LDI r2, 361
LDI r3, 201
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
