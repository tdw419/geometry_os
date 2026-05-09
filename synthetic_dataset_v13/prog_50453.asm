; DESCRIPTION: Renders a purple line between points (135, 24) and (161, 144).
; PLAN: r0=135(x1), r1=24(y1), r2=161(x2), r3=144(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 24
LDI r2, 161
LDI r3, 144
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
