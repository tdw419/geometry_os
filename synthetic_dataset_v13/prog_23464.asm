; DESCRIPTION: Renders a blue line between points (345, 30) and (505, 250).
; PLAN: r0=345(x1), r1=30(y1), r2=505(x2), r3=250(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 30
LDI r2, 505
LDI r3, 250
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
