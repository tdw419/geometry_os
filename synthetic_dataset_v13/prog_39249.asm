; DESCRIPTION: Draws a magenta line from (118, 120) to (471, 200).
; PLAN: r0=118(x1), r1=120(y1), r2=471(x2), r3=200(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 120
LDI r2, 471
LDI r3, 200
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
