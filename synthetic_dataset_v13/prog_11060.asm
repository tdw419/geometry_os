; DESCRIPTION: Draws a purple line from (1, 103) to (471, 229).
; PLAN: r0=1(x1), r1=103(y1), r2=471(x2), r3=229(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 103
LDI r2, 471
LDI r3, 229
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
