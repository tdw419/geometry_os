; DESCRIPTION: Renders a blue line between points (259, 250) and (345, 35).
; PLAN: r0=259(x1), r1=250(y1), r2=345(x2), r3=35(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 250
LDI r2, 345
LDI r3, 35
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
