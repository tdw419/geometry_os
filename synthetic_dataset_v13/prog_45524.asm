; DESCRIPTION: Renders a purple line between points (345, 47) and (322, 45).
; PLAN: r0=345(x1), r1=47(y1), r2=322(x2), r3=45(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 47
LDI r2, 322
LDI r3, 45
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
