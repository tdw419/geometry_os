; DESCRIPTION: Renders a purple line between points (358, 229) and (231, 51).
; PLAN: r0=358(x1), r1=229(y1), r2=231(x2), r3=51(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 229
LDI r2, 231
LDI r3, 51
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
