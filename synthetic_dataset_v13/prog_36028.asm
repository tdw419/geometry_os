; DESCRIPTION: Renders a purple line between points (1, 46) and (331, 80).
; PLAN: r0=1(x1), r1=46(y1), r2=331(x2), r3=80(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 46
LDI r2, 331
LDI r3, 80
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
