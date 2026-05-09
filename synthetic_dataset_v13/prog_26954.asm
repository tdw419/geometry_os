; DESCRIPTION: Renders a purple line between points (133, 236) and (135, 91).
; PLAN: r0=133(x1), r1=236(y1), r2=135(x2), r3=91(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 236
LDI r2, 135
LDI r3, 91
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
