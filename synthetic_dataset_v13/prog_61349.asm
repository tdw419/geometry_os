; DESCRIPTION: Renders a purple line between points (322, 191) and (451, 216).
; PLAN: r0=322(x1), r1=191(y1), r2=451(x2), r3=216(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 191
LDI r2, 451
LDI r3, 216
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
