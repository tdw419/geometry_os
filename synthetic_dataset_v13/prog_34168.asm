; DESCRIPTION: Renders a purple line between points (84, 132) and (58, 78).
; PLAN: r0=84(x1), r1=132(y1), r2=58(x2), r3=78(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 132
LDI r2, 58
LDI r3, 78
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
