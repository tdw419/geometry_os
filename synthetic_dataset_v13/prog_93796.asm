; DESCRIPTION: Renders a purple line between points (76, 106) and (40, 134).
; PLAN: r0=76(x1), r1=106(y1), r2=40(x2), r3=134(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 106
LDI r2, 40
LDI r3, 134
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
