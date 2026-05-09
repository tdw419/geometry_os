; DESCRIPTION: Draws a purple line from (99, 54) to (51, 164).
; PLAN: r0=99(x1), r1=54(y1), r2=51(x2), r3=164(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 54
LDI r2, 51
LDI r3, 164
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
