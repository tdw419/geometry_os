; DESCRIPTION: Renders a purple line between points (61, 106) and (366, 107).
; PLAN: r0=61(x1), r1=106(y1), r2=366(x2), r3=107(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 106
LDI r2, 366
LDI r3, 107
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
