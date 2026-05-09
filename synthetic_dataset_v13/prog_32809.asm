; DESCRIPTION: Renders a blue line between points (123, 196) and (448, 169).
; PLAN: r0=123(x1), r1=196(y1), r2=448(x2), r3=169(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 196
LDI r2, 448
LDI r3, 169
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
