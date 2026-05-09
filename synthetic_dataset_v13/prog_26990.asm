; DESCRIPTION: Renders a purple line between points (505, 29) and (483, 164).
; PLAN: r0=505(x1), r1=29(y1), r2=483(x2), r3=164(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 29
LDI r2, 483
LDI r3, 164
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
