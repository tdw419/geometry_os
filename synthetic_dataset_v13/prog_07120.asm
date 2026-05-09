; DESCRIPTION: Renders a magenta line between points (89, 139) and (363, 181).
; PLAN: r0=89(x1), r1=139(y1), r2=363(x2), r3=181(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 139
LDI r2, 363
LDI r3, 181
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
