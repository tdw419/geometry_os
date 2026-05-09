; DESCRIPTION: Renders a blue line between points (8, 84) and (395, 180).
; PLAN: r0=8(x1), r1=84(y1), r2=395(x2), r3=180(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 84
LDI r2, 395
LDI r3, 180
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
