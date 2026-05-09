; DESCRIPTION: Renders a blue line between points (72, 169) and (279, 243).
; PLAN: r0=72(x1), r1=169(y1), r2=279(x2), r3=243(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 169
LDI r2, 279
LDI r3, 243
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
