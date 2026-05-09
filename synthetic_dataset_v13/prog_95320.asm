; DESCRIPTION: Renders a purple line between points (377, 126) and (89, 9).
; PLAN: r0=377(x1), r1=126(y1), r2=89(x2), r3=9(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 126
LDI r2, 89
LDI r3, 9
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
