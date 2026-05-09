; DESCRIPTION: Renders a purple line between points (234, 57) and (463, 80).
; PLAN: r0=234(x1), r1=57(y1), r2=463(x2), r3=80(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 57
LDI r2, 463
LDI r3, 80
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
