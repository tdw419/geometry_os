; DESCRIPTION: Renders a magenta line between points (459, 5) and (273, 201).
; PLAN: r0=459(x1), r1=5(y1), r2=273(x2), r3=201(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 5
LDI r2, 273
LDI r3, 201
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
