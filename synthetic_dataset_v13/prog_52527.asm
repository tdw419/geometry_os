; DESCRIPTION: Renders a purple line between points (459, 133) and (433, 123).
; PLAN: r0=459(x1), r1=133(y1), r2=433(x2), r3=123(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 133
LDI r2, 433
LDI r3, 123
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
