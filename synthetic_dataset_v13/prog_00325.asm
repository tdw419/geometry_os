; DESCRIPTION: Renders a blue line between points (135, 120) and (10, 54).
; PLAN: r0=135(x1), r1=120(y1), r2=10(x2), r3=54(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 120
LDI r2, 10
LDI r3, 54
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
