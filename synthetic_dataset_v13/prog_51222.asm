; DESCRIPTION: Renders a purple line between points (262, 76) and (201, 108).
; PLAN: r0=262(x1), r1=76(y1), r2=201(x2), r3=108(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 76
LDI r2, 201
LDI r3, 108
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
