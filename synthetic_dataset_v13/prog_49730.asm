; DESCRIPTION: Renders a blue line between points (13, 112) and (249, 233).
; PLAN: r0=13(x1), r1=112(y1), r2=249(x2), r3=233(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 112
LDI r2, 249
LDI r3, 233
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
