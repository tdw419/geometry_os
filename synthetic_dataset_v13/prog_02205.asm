; DESCRIPTION: Renders a purple line between points (511, 89) and (444, 21).
; PLAN: r0=511(x1), r1=89(y1), r2=444(x2), r3=21(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 89
LDI r2, 444
LDI r3, 21
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
