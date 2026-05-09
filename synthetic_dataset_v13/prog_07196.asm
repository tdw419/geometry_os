; DESCRIPTION: Renders a blue line between points (484, 219) and (143, 120).
; PLAN: r0=484(x1), r1=219(y1), r2=143(x2), r3=120(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 219
LDI r2, 143
LDI r3, 120
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
