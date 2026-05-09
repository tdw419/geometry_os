; DESCRIPTION: Renders a blue line between points (448, 142) and (273, 182).
; PLAN: r0=448(x1), r1=142(y1), r2=273(x2), r3=182(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 142
LDI r2, 273
LDI r3, 182
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
