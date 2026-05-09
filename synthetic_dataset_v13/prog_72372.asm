; DESCRIPTION: Renders a purple line between points (300, 89) and (367, 252).
; PLAN: r0=300(x1), r1=89(y1), r2=367(x2), r3=252(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 89
LDI r2, 367
LDI r3, 252
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
