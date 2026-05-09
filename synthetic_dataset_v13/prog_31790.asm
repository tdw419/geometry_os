; DESCRIPTION: Renders a blue line between points (80, 97) and (491, 54).
; PLAN: r0=80(x1), r1=97(y1), r2=491(x2), r3=54(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 97
LDI r2, 491
LDI r3, 54
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
