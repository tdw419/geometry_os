; DESCRIPTION: Renders a purple line between points (283, 33) and (390, 168).
; PLAN: r0=283(x1), r1=33(y1), r2=390(x2), r3=168(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 33
LDI r2, 390
LDI r3, 168
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
