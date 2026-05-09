; DESCRIPTION: Renders a purple line between points (511, 132) and (325, 106).
; PLAN: r0=511(x1), r1=132(y1), r2=325(x2), r3=106(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 132
LDI r2, 325
LDI r3, 106
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
