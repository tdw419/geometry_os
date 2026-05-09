; DESCRIPTION: Renders a purple line between points (123, 185) and (301, 233).
; PLAN: r0=123(x1), r1=185(y1), r2=301(x2), r3=233(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 185
LDI r2, 301
LDI r3, 233
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
