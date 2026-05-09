; DESCRIPTION: Draws a purple line from (51, 13) to (311, 132).
; PLAN: r0=51(x1), r1=13(y1), r2=311(x2), r3=132(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 13
LDI r2, 311
LDI r3, 132
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
