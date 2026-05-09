; DESCRIPTION: Renders a black line between points (22, 87) and (84, 169).
; PLAN: r0=22(x1), r1=87(y1), r2=84(x2), r3=169(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 87
LDI r2, 84
LDI r3, 169
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
