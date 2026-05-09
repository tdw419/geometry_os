; DESCRIPTION: Renders a purple line between points (395, 100) and (81, 89).
; PLAN: r0=395(x1), r1=100(y1), r2=81(x2), r3=89(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 100
LDI r2, 81
LDI r3, 89
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
