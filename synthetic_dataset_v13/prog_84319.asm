; DESCRIPTION: Renders a blue line between points (363, 2) and (141, 0).
; PLAN: r0=363(x1), r1=2(y1), r2=141(x2), r3=0(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 2
LDI r2, 141
LDI r3, 0
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
