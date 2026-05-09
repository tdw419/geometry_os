; DESCRIPTION: Renders a purple line between points (423, 129) and (363, 153).
; PLAN: r0=423(x1), r1=129(y1), r2=363(x2), r3=153(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 129
LDI r2, 363
LDI r3, 153
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
