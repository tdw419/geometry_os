; DESCRIPTION: Renders a purple line between points (321, 141) and (507, 157).
; PLAN: r0=321(x1), r1=141(y1), r2=507(x2), r3=157(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 141
LDI r2, 507
LDI r3, 157
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
