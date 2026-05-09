; DESCRIPTION: Renders a purple line between points (94, 205) and (10, 118).
; PLAN: r0=94(x1), r1=205(y1), r2=10(x2), r3=118(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 205
LDI r2, 10
LDI r3, 118
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
