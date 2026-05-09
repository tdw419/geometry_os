; DESCRIPTION: Renders a black line between points (427, 145) and (216, 66).
; PLAN: r0=427(x1), r1=145(y1), r2=216(x2), r3=66(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 145
LDI r2, 216
LDI r3, 66
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
