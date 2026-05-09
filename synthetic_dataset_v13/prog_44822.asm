; DESCRIPTION: Renders a blue line between points (322, 26) and (458, 129).
; PLAN: r0=322(x1), r1=26(y1), r2=458(x2), r3=129(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 26
LDI r2, 458
LDI r3, 129
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
