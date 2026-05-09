; DESCRIPTION: Renders a purple line between points (487, 254) and (314, 161).
; PLAN: r0=487(x1), r1=254(y1), r2=314(x2), r3=161(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 254
LDI r2, 314
LDI r3, 161
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
