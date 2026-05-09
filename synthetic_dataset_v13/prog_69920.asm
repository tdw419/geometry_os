; DESCRIPTION: Draws a purple line from (507, 149) to (227, 95).
; PLAN: r0=507(x1), r1=149(y1), r2=227(x2), r3=95(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 149
LDI r2, 227
LDI r3, 95
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
