; DESCRIPTION: Renders a blue line between points (369, 64) and (115, 11).
; PLAN: r0=369(x1), r1=64(y1), r2=115(x2), r3=11(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 64
LDI r2, 115
LDI r3, 11
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
