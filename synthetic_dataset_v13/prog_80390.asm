; DESCRIPTION: Renders a blue line between points (413, 198) and (363, 47).
; PLAN: r0=413(x1), r1=198(y1), r2=363(x2), r3=47(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 198
LDI r2, 363
LDI r3, 47
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
