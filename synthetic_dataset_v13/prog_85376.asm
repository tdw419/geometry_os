; DESCRIPTION: Renders a purple line between points (347, 149) and (142, 196).
; PLAN: r0=347(x1), r1=149(y1), r2=142(x2), r3=196(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 149
LDI r2, 142
LDI r3, 196
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
