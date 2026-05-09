; DESCRIPTION: Renders a purple line between points (52, 71) and (432, 164).
; PLAN: r0=52(x1), r1=71(y1), r2=432(x2), r3=164(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 71
LDI r2, 432
LDI r3, 164
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
