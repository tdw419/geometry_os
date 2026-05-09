; DESCRIPTION: Renders a purple line between points (46, 145) and (20, 31).
; PLAN: r0=46(x1), r1=145(y1), r2=20(x2), r3=31(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 145
LDI r2, 20
LDI r3, 31
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
