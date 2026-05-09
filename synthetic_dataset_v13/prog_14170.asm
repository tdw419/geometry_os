; DESCRIPTION: Renders a purple line between points (179, 164) and (135, 80).
; PLAN: r0=179(x1), r1=164(y1), r2=135(x2), r3=80(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 164
LDI r2, 135
LDI r3, 80
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
