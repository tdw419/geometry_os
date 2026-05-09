; DESCRIPTION: Draws a purple line from (5, 128) to (471, 51).
; PLAN: r0=5(x1), r1=128(y1), r2=471(x2), r3=51(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 128
LDI r2, 471
LDI r3, 51
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
