; DESCRIPTION: Renders a purple line between points (389, 100) and (214, 129).
; PLAN: r0=389(x1), r1=100(y1), r2=214(x2), r3=129(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 100
LDI r2, 214
LDI r3, 129
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
