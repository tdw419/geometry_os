; DESCRIPTION: Renders a magenta line between points (484, 86) and (432, 51).
; PLAN: r0=484(x1), r1=86(y1), r2=432(x2), r3=51(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 86
LDI r2, 432
LDI r3, 51
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
