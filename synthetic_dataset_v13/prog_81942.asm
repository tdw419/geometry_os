; DESCRIPTION: Renders a blue line between points (110, 115) and (231, 13).
; PLAN: r0=110(x1), r1=115(y1), r2=231(x2), r3=13(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 115
LDI r2, 231
LDI r3, 13
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
