; DESCRIPTION: Renders a blue line between points (395, 115) and (231, 227).
; PLAN: r0=395(x1), r1=115(y1), r2=231(x2), r3=227(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 115
LDI r2, 231
LDI r3, 227
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
