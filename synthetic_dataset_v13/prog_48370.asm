; DESCRIPTION: Renders a purple line between points (89, 126) and (273, 131).
; PLAN: r0=89(x1), r1=126(y1), r2=273(x2), r3=131(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 126
LDI r2, 273
LDI r3, 131
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
