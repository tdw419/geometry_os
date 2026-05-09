; DESCRIPTION: Renders a blue line between points (83, 217) and (508, 146).
; PLAN: r0=83(x1), r1=217(y1), r2=508(x2), r3=146(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 217
LDI r2, 508
LDI r3, 146
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
