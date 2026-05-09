; DESCRIPTION: Renders a blue line between points (172, 100) and (84, 120).
; PLAN: r0=172(x1), r1=100(y1), r2=84(x2), r3=120(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 100
LDI r2, 84
LDI r3, 120
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
