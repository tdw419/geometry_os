; DESCRIPTION: Renders a purple line between points (343, 62) and (443, 84).
; PLAN: r0=343(x1), r1=62(y1), r2=443(x2), r3=84(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 62
LDI r2, 443
LDI r3, 84
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
