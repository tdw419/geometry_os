; DESCRIPTION: Renders a purple line between points (448, 78) and (443, 38).
; PLAN: r0=448(x1), r1=78(y1), r2=443(x2), r3=38(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 78
LDI r2, 443
LDI r3, 38
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
