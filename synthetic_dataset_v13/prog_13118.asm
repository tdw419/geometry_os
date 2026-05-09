; DESCRIPTION: Renders a purple line between points (487, 73) and (451, 145).
; PLAN: r0=487(x1), r1=73(y1), r2=451(x2), r3=145(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 73
LDI r2, 451
LDI r3, 145
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
