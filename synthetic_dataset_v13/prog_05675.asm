; DESCRIPTION: Renders a purple line between points (331, 108) and (139, 237).
; PLAN: r0=331(x1), r1=108(y1), r2=139(x2), r3=237(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 108
LDI r2, 139
LDI r3, 237
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
