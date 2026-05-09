; DESCRIPTION: Draws a purple line from (51, 2) to (73, 220).
; PLAN: r0=51(x1), r1=2(y1), r2=73(x2), r3=220(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 2
LDI r2, 73
LDI r3, 220
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
