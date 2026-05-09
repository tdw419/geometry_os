; DESCRIPTION: Renders a magenta line between points (201, 15) and (428, 3).
; PLAN: r0=201(x1), r1=15(y1), r2=428(x2), r3=3(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 15
LDI r2, 428
LDI r3, 3
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
