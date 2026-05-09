; DESCRIPTION: Renders a blue line between points (448, 104) and (493, 70).
; PLAN: r0=448(x1), r1=104(y1), r2=493(x2), r3=70(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 104
LDI r2, 493
LDI r3, 70
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
