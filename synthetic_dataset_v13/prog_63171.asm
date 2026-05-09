; DESCRIPTION: Renders a magenta line between points (124, 30) and (448, 207).
; PLAN: r0=124(x1), r1=30(y1), r2=448(x2), r3=207(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 30
LDI r2, 448
LDI r3, 207
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
