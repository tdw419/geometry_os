; DESCRIPTION: Renders a purple line between points (493, 104) and (95, 131).
; PLAN: r0=493(x1), r1=104(y1), r2=95(x2), r3=131(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 104
LDI r2, 95
LDI r3, 131
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
