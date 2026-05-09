; DESCRIPTION: Renders a purple line between points (141, 244) and (118, 208).
; PLAN: r0=141(x1), r1=244(y1), r2=118(x2), r3=208(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 244
LDI r2, 118
LDI r3, 208
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
