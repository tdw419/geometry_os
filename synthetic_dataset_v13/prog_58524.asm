; DESCRIPTION: Renders a purple line between points (446, 24) and (46, 145).
; PLAN: r0=446(x1), r1=24(y1), r2=46(x2), r3=145(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 24
LDI r2, 46
LDI r3, 145
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
