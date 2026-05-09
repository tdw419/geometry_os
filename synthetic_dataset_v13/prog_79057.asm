; DESCRIPTION: Renders a black line between points (377, 145) and (459, 155).
; PLAN: r0=377(x1), r1=145(y1), r2=459(x2), r3=155(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 145
LDI r2, 459
LDI r3, 155
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
