; DESCRIPTION: Renders a orange line between points (198, 177) and (69, 201).
; PLAN: r0=198(x1), r1=177(y1), r2=69(x2), r3=201(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 177
LDI r2, 69
LDI r3, 201
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
