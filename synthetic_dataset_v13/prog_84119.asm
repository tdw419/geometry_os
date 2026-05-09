; DESCRIPTION: Renders a yellow line between points (443, 106) and (390, 114).
; PLAN: r0=443(x1), r1=106(y1), r2=390(x2), r3=114(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 106
LDI r2, 390
LDI r3, 114
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
