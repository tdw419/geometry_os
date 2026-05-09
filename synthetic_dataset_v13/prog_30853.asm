; DESCRIPTION: Renders a purple line between points (437, 17) and (70, 141).
; PLAN: r0=437(x1), r1=17(y1), r2=70(x2), r3=141(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 17
LDI r2, 70
LDI r3, 141
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
