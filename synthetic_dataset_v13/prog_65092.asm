; DESCRIPTION: Renders a blue line between points (444, 80) and (11, 4).
; PLAN: r0=444(x1), r1=80(y1), r2=11(x2), r3=4(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 80
LDI r2, 11
LDI r3, 4
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
