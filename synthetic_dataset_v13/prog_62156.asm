; DESCRIPTION: Draws a magenta line from (217, 201) to (471, 80).
; PLAN: r0=217(x1), r1=201(y1), r2=471(x2), r3=80(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 201
LDI r2, 471
LDI r3, 80
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
