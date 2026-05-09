; DESCRIPTION: Renders a purple line between points (442, 49) and (304, 89).
; PLAN: r0=442(x1), r1=49(y1), r2=304(x2), r3=89(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 49
LDI r2, 304
LDI r3, 89
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
