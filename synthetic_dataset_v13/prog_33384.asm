; DESCRIPTION: Renders a magenta line between points (363, 44) and (475, 216).
; PLAN: r0=363(x1), r1=44(y1), r2=475(x2), r3=216(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 44
LDI r2, 475
LDI r3, 216
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
