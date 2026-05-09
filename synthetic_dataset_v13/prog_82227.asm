; DESCRIPTION: Renders a purple line between points (389, 154) and (30, 89).
; PLAN: r0=389(x1), r1=154(y1), r2=30(x2), r3=89(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 154
LDI r2, 30
LDI r3, 89
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
