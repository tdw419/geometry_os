; DESCRIPTION: Renders a purple line between points (418, 205) and (322, 211).
; PLAN: r0=418(x1), r1=205(y1), r2=322(x2), r3=211(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 205
LDI r2, 322
LDI r3, 211
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
